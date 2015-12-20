<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
function validateForm()
{
    if(document.frm.username.value=="")
    {
      alert("User Name should be left blank");
      document.frm.username.focus();
      return false;
    }
    else if(document.frm.pwd.value=="")
    {
      alert("Password should be left blank");
      document.frm.pwd.focus();
      return false;
    }
}
</script>

</head>
<body>
	<form name="frm" method="get" action="validateInput.jsp" onSubmit="return validateForm()">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td width="22%">&nbsp;</td>
	    <td width="78%">&nbsp;</td>
	    </tr>
	  <tr>
	    <td>UserName </td>
	    <td><input type="text" name="username" /></td>
	  </tr>
	  <tr>
	    <td>Password</td>
	    <td><input type="text" name="pwd" /></td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td><input type="submit" name="submit" value="Submit"></td>
	    </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    </tr>
	</table>
	</form>

</body>
</html>