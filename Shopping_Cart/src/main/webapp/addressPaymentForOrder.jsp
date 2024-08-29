<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs1 = st.executeQuery("SELECT sum(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
    while (rs1.next()) {
        total = rs1.getInt(1);
    }
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><% out.println(total);%> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
                ResultSet rs = st.executeQuery("SELECT * FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email ='" + email+ "' AND cart.address IS NULL;");
                while(rs.next()) 
                {
        %>
          <tr>
           <td><%= sno=sno+1 %></td>
           <td><%= rs.getString(2) %></td>
           <td><%= rs.getString(3) %></td>
           <td><%= rs.getInt(4) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(1)%></td>
            <td> </td>
            <td><i class="fa fa-inr"></i> </td>
            </tr>
         
        </tbody>
      </table>
      
<hr style="width: 100%">

 <div class="left-div">
 <h3>Enter Address</h3>

 </div>

<div class="right-div">
<h3>Enter city</h3>

</div> 

<div class="left-div">
<h3>Enter State</h3>

</div>

<div class="right-div">
<h3>Enter country</h3>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 
</div>

<div class="right-div">
<h3>Pay online on this shopnest@pay.com</h3>

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<i class='far fa-arrow-alt-circle-right'></i>
<h3 style="color: red">*Fill form correctly</h3>
</div>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>

      <br>
      <br>
      <br>

</body>
</html>