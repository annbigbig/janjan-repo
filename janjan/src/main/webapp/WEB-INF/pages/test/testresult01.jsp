<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testresult01</title>
</head>
<body>
member.membername=${member.membername}<br/>
member.password=${member.password}<br/>
member.password=${member.cpassword}<br/>
member.password=${member.email}<br/>
member.password=${member.birthday}<br/>
member.password=${member.testint}<br/>
member.password=${member.testdouble}<br/>
</body>
</html>