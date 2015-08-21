<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <jsp:include page="../fragments/staticFiles.jsp"/>
<script>
$(function() {
	$("#navlist li").click(function(){
		var content = $(this).text();
		alert('content = ' + content);
	});
	
	$("#firstPageButton").click(function(){
		$("#pageNumber").val(1);
		$("#searchForm").submit();
	});
	
	$("#previous10PageButton").click(function(){
		var currentPage = $("#pageNumber").val();
		$("#pageNumber").val(+currentPage-10);
		$("#searchForm").submit();
	});
	
	$("#previousPageButton").click(function(){
		var currentPage = $("#pageNumber").val();
		$("#pageNumber").val(+currentPage-1);
		$("#searchForm").submit();
	});
	
	$("a.page").not("#firstPageButton,#previous10PageButton,#previousPageButton,#nextPageButton,#next10PageButton,#lastPageButton").click(function(){
		//alert($(this).text());
		$("#pageNumber").val($(this).text());
		$("#searchForm").submit();
	});
	
	$("#nextPageButton").click(function(){
		var currentPage = $("#pageNumber").val();
		$("#pageNumber").val(+currentPage+1);
		$("#searchForm").submit();
	});
	
	$("#next10PageButton").click(function(){
		var currentPage = $("#pageNumber").val();
		$("#pageNumber").val(+currentPage+10);
		$("#searchForm").submit();
	});
	
	$("#lastPageButton").click(function(){
		//var maxPageNumber = ${page.maxPageNumber};
		$("#pageNumber").val("<c:out value='${page.maxPageNumber}'/>");
		$("#searchForm").submit();
	});
	
	$("#pageNumberInput").mask("000");
	
	$("#goToButton").click(function(){
		var pageNumber = $("#pageNumberInput").val();
		if(pageNumber==null||pageNumber==0){
			pageNumber =1;
		}
		$("#pageNumber").val(pageNumber);
		$("#searchForm").submit();
	});
	
	
	// http://stackoverflow.com/questions/15596900/jquerys-spinner-ui-value-not-logging-out-value
	$(".spinner").spinner({
		min : 0,
		max : 99,
		step : 1,
		numberFormat: "n",
		change: function(event, ui) {
			//var spinValue = $(this).val();
            //console.log(this.value);
            $(this).attr("value",$(this).val());
            console.log($(this).val());
            	//$(this).attr("value",spinValue);
         //console.log(spinValue);
        }
	}).width(30);
	
	//  http://stackoverflow.com/questions/16125913/javascript-returning-undefined
	$(".addToCart").click(function(){
		//var productId = $(this).children("span").text();		//working
		var productId = $(this).closest("td").children("span.visible-span").text();
		//var amount = $(this).prev().spinner("value").html();
		//var testValue = $(this).prev(".spinner").val();
		//var testValue = $("#test-spinner").spinner("value");		//working
		//var amount = $(this).closest("input.spinner").attr("value");
		var amount = $(this).siblings("span.ui-spinner").children("input.spinner").spinner("value");
		if(amount==null){
			amount=0;
		}
		//var amount = $(this).closest("input.spinner.ui-spinner-input").val();
		//alert("productId=" + productId + " amount=" + amount);
		$("#productId").val(productId);		//working
		$("#amount").val(amount);		//working
		console.log("productId=" + productId + " amount=" + amount);
		//$("#amount").val(5);
		//$("#cartForm").submit();
	});
	
});
</script>
</head>
<body>

 <header>
 			<jsp:include page="../fragments/header.jsp"/>
 </header>
 <div id='main'>
    <article>
   			<c:if test="${not empty searchParams}">
   					<div class="yellow-box"><H3>搜尋關鍵字 [ ${ searchParams.searchArgValues[0]} ]</H3></div>
   					<form id="searchForm" action="${pageContext.request.contextPath}/product/find" method="GET">
   								<input type="hidden" name="searchColumn" value="${searchParams.searchColumn}"/>
										<input type="hidden" name="searchOperator" value="${searchParams.searchOperator}"/>
										<input id="argValue0" type="hidden" name="searchArgValues[0]" value="${searchParams.searchArgValues[0]}"/>
										<input type="hidden" name="searchArgTypes[0]" value="${searchParams.searchArgTypes[0]}"/>
										<input type="hidden" name="orderColumn" value="${searchParams.orderColumn}"/>
										<input type="hidden" name="orderType" value="${searchParams.orderType}"/>
										<input id="pageNumber" type="hidden" name="pageNumber" value="${searchParams.pageNumber}"/>
										<input type="hidden" name="pageSize" value="${searchParams.pageSize}"/>
   					</form>
   			</c:if><br/>
   			
   			<c:choose>
   				<c:when test="${not empty page.elements}">
   							<h3>返回了${page.totalRows}筆記錄</h3>
   				 <table>
   				 <thead>
   				 		<th>產品名稱</th>
   				 		<th>價格</th>
   				 		<th>單位</th>
   				 		<th></th>
   				 	</thead>
   				 	<tbody>
   						<c:forEach var="product" items="${page.elements}">
   									<tr>
   										<td><a href="${pageContext.request.contextPath}/product/detail/${product.id}">${product.title}</a></td>
   										<td>${product.price}</td>
   										<td>${product.unit}</td>
   										<!-- product.createdTime = ${product.createdTime} -->
   										<!-- product.lastModified = ${product.lastModified} -->
												<!-- product.enabled = ${product.enabled} --> 
												<!-- product.category.id = ${product.category.id} --> 
												<!-- product.category.name = ${product.category.name} --> 
												<td>
														<span class="visible-span">${product.id}</span>
														數量 : <input class="spinner" type="text"/>
														<button class="addToCart" type="button">放入購物車</button>
														<sec:authorize access="hasRole('ROLE_ADMIN')">
															|<a class="admin-mod-product-button" href="${pageContext.request.contextPath}/admin/product/modify/${product.id}">修改</a>
															|<button class="delete-product-btn" type="button">刪除</button>
														</sec:authorize>
												</td>
											</tr>
   						</c:forEach>
   					</tbody>
   					</table>
   				</c:when>
   				<c:otherwise>
   								要求的頁面不存在<br/><br/>
   				</c:otherwise>
   			</c:choose>
  
   			<a href="${pageContext.request.contextPath}/home">回首頁</a><br/>
   			
   			<c:if test="${not empty page.pageButtons}">
   						${page.pageButtons}<br/>
   			</c:if>
    </article>
   
    <nav>
          <jsp:include page="../login.jsp"/>
          <jsp:include page="../fragments/productFeatures.jsp"/>
    </nav>
    
    <aside>aside<br>
    		<form id="cartForm" action="${pageContext.request.contextPath}/cart/add" method="GET">
    				<input id="productId" type="hidden" name="productId"/>
    					<input id="amount" type="hidden" name="amount"/>
    		</form>
    <h2></h2>
    <c:url var="part" value="/part"></c:url>
    <h2>${part}</h2>
    <c:import url="/part"/>
    </aside>
    
 </div>
 <footer>
 			<jsp:include page="../fragments/footer.jsp"/>
 </footer>


</body>
</html>