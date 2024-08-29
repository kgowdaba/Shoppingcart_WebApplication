<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Forgot Password</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter your email" required>
     <input type="text" name="mobile" placeholder="Enter mobile number" required>
     <select name="securityQuestion">
     <option value="enter your 1st name">Enter your 1st name</option>
     <option value="enter your 1st bike no">Enter your 1st bike no</option>
     <option value="enter your favourite person">Enter your favourite person</option>
     </select>
     <input type="text" name="answer" placeholder="Enter answer" required>
     <input type="password" name="newpassword" placeholder="Enter new password" required>
     <input type="submit" value="Save">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <% 
   String msg=request.getParameter("msg");
   if("done".equals(msg)) {
   %>
   <h1>Password Changed Successfully!</h1>
   <% } else if("invalid".equals(msg)) { %>
   <h1>Something Went Wrong! Please Try Again!</h1> <!-- Corrected the error message and added "Please" for politeness -->
   <% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is an application that allows users to shop online without physically going to the stores.</p> <!-- Edited for clarity and grammar -->
  </div>
</div>
</body>
</html>
