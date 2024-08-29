<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
try {
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE users (name VARCHAR(10),email VARCHAR(100) PRIMARY KEY,mobile BIGINT(10),securityQuestion VARCHAR(100),answer VARCHAR(20),password VARCHAR(10),addadrss varchar(20),country varchar(10),state VARCHAR(10),city VARCHAR(10))";
	String q2="create table product(id int, name varchar(20),catagory varchar(20),price int,active varchar(10))";
	String q3="CREATE TABLE cart (email VARCHAR(50),product_id INT,quantity INT,price INT,total INT,address VARCHAR(100),city VARCHAR(50),state VARCHAR(50),country VARCHAR(20),mobile BIGINT,orderDate DATE,deliveryDate DATE,paymentMethod VARCHAR(100),transactionId VARCHAR(100),status VARCHAR(100))";

	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	
	//st.execute(q1);
	//st.execute(q2);
	st.execute(q3);
	System.out.println("table created");
	con.close();
	
}
catch (Exception e)
{
	System.out.println(e);
}
%>