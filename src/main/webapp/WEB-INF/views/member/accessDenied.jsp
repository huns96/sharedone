<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>alertPage</title>
</head>
<body>
<script type="text/javascript">
    var message = "${errMsg}";
    var url = `${pageContext.request.contextPath}` + `${url}`;
    alert(message);
    document.location.href = url;


</script>
</body>
</html>
