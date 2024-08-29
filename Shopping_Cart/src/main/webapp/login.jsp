<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post"> <!-- Changed 'from' to 'form' -->
     <input type="email" name="email" placeholder="enter the email" required>
      <input type="password" name="password" placeholder="enter the password" required>
      <input type="submit" value="login">
     </form> <!-- Closed form tag -->

      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <% String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
      <h1>Incorrect Username or Password</h1>
  <% } %>
  <% if("invalid".equals(msg))
  {
  %>
      <h1>Something Went Wrong! Try Again!</h1> <!-- Changed 'Some thing' to 'Something' -->
  <% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>
