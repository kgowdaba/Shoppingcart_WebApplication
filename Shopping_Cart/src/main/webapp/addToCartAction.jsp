<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String email = (String) session.getAttribute("email");
String product_id = request.getParameter("id");
int quantity = 1;
int product_price = 0;
int product_total = 0;
int cart_total = 0;
int z = 0;

try {
    if(email != null && product_id != null) {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement pstProduct = con.prepareStatement("SELECT * FROM product WHERE id=?");
        pstProduct.setString(1, product_id);
        ResultSet rs = pstProduct.executeQuery();

        while (rs.next()) {
            product_price = rs.getInt("price");
            product_total = product_price;
        }
        
        // Check if the product already exists in the cart for the user
        PreparedStatement pstCart = con.prepareStatement("SELECT * FROM cart WHERE product_id=? AND email=? AND address IS NULL");
        pstCart.setString(1, product_id);
        pstCart.setString(2, email);
        ResultSet rs1 = pstCart.executeQuery();
        
        while(rs1.next()) {
            cart_total = rs1.getInt("total");
            cart_total += product_total;
            quantity = rs1.getInt("quantity");
            quantity++;
            z = 1;
        }

        if (z == 1) {
            PreparedStatement pstUpdateCart = con.prepareStatement("UPDATE cart SET total=?, quantity=? WHERE product_id=? AND email=? AND address IS NULL");
            pstUpdateCart.setInt(1, cart_total);
            pstUpdateCart.setInt(2, quantity);
            pstUpdateCart.setString(3, product_id);
            pstUpdateCart.setString(4, email);
            pstUpdateCart.executeUpdate();
            response.sendRedirect("home.jsp?msg=exist");
        } else {
            PreparedStatement pstInsertCart = con.prepareStatement("INSERT INTO cart(email, product_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
            pstInsertCart.setString(1, email);
            pstInsertCart.setString(2, product_id);
            pstInsertCart.setInt(3, quantity);
            pstInsertCart.setInt(4, product_price);
            pstInsertCart.setInt(5, product_price); 
            pstInsertCart.executeUpdate();
            response.sendRedirect("home.jsp?msg=added");
        }
    } else {
        response.sendRedirect("home.jsp?msg=invalid");
    }
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("home.jsp?msg=invalid");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("home.jsp?msg=error");
}
%>
