<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <jsp:include page="../fragments/staticFiles.jsp"/>
</script>
</head>
<body>
 <header>
 			<jsp:include page="../fragments/header.jsp"/>
 </header>
 <div id='main'>
    <article><h2>恭喜您，註冊成功</h2><br/><br/>
<h1>${message}</h1><br>
   <c:if test="${not empty currentURL}">
		  currentURL = ${currentURL}
		</c:if>
		提交來的user.username=${user.username}<br/>
		user.password=${user.password}<br/>
		user.cpassword=${user.cpassword}<br/>
		user.email=${user.email}<br/>
		user.nickname=${user.nickname}<br/>
		user.realname=${user.realname}<br/>
		user.gender=${user.gender}<br/>
		user.birthday=${user.birthday}<br/>
		user.telephone=${user.telephone}<br/>
		user.telephone=${user.mobile}<br/>
		user.zipcode=${user.zipcode}<br/>
		user.address=${user.address}<br/>
				<a href="${pageContext.request.contextPath}/home">回首頁</a><br/>
    </article>
    
    <nav>
    <jsp:include page="../login.jsp"/>
       
    </nav>
    
    <aside>aside<br>
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