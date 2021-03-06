<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <jsp:include page="fragments/staticFiles.jsp"/>
</head>
<body>

 <header>
 		<jsp:include page="fragments/header.jsp"/>
 </header>
 <div id='main'>
    <article><h2>article</h2><br>
    偶才是首頁<br>
<a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Flexible_boxes">首頁layout從這抄來的</a><br>
<h1>${message}</h1><br>
   <c:if test="${not empty currentURL}">
		  currentURL = ${currentURL}
		</c:if>
		<br/>
		
    </article>
    
    <nav>
          <jsp:include page="login.jsp"/>
          	<jsp:include page="fragments/productFeatures.jsp"/>
    </nav>
    
    <aside>aside<br>
    <h2></h2>
    <c:url var="part" value="/part"></c:url>
    <h2>${part}</h2>
    <c:import url="/part"/>
    </aside>
    
 </div>
 <footer>
 		<jsp:include page="fragments/footer.jsp"/>
 </footer>


</body>
</html>