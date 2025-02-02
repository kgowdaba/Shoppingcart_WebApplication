<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3 {
    color: yellow;
    text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String emailSession = (String) session.getAttribute("email");
if (emailSession != null) {
    String msg = request.getParameter("msg");
    if ("notpossible".equals(msg)) {
%>
    <h3 class="alert">There is only one Quantity! So click on remove!</h3>
<% 
    } else if ("inc".equals(msg)) {
%>
    <h3 class="alert">Quantity Increased Successfully!</h3>
<% 
    } else if ("dec".equals(msg)) {
%>
    <h3 class="alert">Quantity Decreased Successfully!</h3>
<% 
    } else if ("remove".equals(msg)) {
%>
    <h3 class="alert">Product Successfully Removed!</h3>
<% 
    }
%>
    <table>
        <thead>
        <%
            int total = 0;
            int sno = 0;
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs1 = st.executeQuery("SELECT sum(total) FROM cart WHERE email='" + emailSession + "' AND address IS NULL");
                while (rs1.next()) {
                    total = rs1.getInt(1);
                }
        %>
                <tr>
                    <th scope="col" style="background-color: yellow;">Total: <%= total %></th>
                    <% if(total > 0) { %>
                    <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
                    <% } %>
                </tr>
        </thead>
        <thead>
                <tr>
                    <th scope="col">S.No</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Sub Total</th>
                    <th scope="col">Remove</th>
                </tr>
        </thead>
        <tbody>
        <%
                ResultSet rs = st.executeQuery("SELECT * FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email ='" + emailSession + "' AND cart.address IS NULL;");
                while(rs.next()) {
        %>
                    <tr>
                        <% sno=sno+1;%>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getInt(4) %></td>
                        <td><a href="incndecQualityAction.jsp?id=<%= rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%= rs.getInt(8) %> <a href="incndecQualityAction.jsp?id=<%= rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
                        <td><%= rs.getInt(10) %></td>
                        <td><a href="removeFromcart.jsp?id=<%= rs.getString(1) %>">Remove</a></td>
                    </tr>
        <%
                }
            } catch(Exception e) {
                out.println(e);
            }
        %>
        </tbody>
    </table>
<%
} else {
    response.sendRedirect("login.jsp");
}
%>
</body>
</html>
