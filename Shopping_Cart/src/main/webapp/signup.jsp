<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter the name" required>
    <input type="email" name="email" placeholder="Enter email" required>
    <input type="text" name="mobile" placeholder="phone number" required>
    <select name="securityQuestion" required>
    <option value="enter ur 1st name">enter your 1st name </option>
    <option value="enter ur 1st bike no">enter your 1st bike no </option>
    <option value="enter ur fav person">enter your favourite person </option>
    </select>
    	<input type=text name="answer" placeholder="enter anwer" required>
    	<input type="password" name="password" placeholder="enter the password" required>
    	<input type="submit" value="signup">
    	</form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
	%>
	<h1>succesfully registerd</h1>
	<%} %>
	<%
	if("invalid".equals(msg))
	{
	%>
<h1>Some thing Went Wrong! Try Again !</h1>
  <%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>