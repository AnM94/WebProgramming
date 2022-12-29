<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clients</title>
        <style>
            .bg_img {
				max-height: 100%; 
				max-width: 100%; 
				background-position: center;
				background-repeat: no-repeat; 
				background-size: cover; 
				position: fixed;
			}
        
			.btn_img{
				background-image: url("hotel_logo.png");
				background-size: cover;
				background-color: transparent;
				
				border: none;
				cursor: pointer;
				overflow: hidden;
				outline: none;
				
				height: 200px;
				width: 220px;
				left:  25px;
				top: 20px;
				position: fixed;
				background-position: center;
			}
        
        </style>
    </head>
    <body>
        <img class="bg_img" src='njv-athens-plaza.jpg'> 
        <button class="btn_img" onclick="location.href='form.html'"></button>
 <%  
  String JDBC_DRIVER = "com.mysql.jdbc.Driver";
  String db_URL = "jdbc:mysql://127.0.0.1:3306/hotel_db?characterEncoding=utf8";  
  String dbUSER = "Athena";
  String dbPASS = "Athena";
  Connection dbConn = null;
  Statement dbStmt = null;  
   
  try {
        Class.forName(JDBC_DRIVER);
        dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);  

        if(dbConn != null)
        {
            dbStmt = dbConn.createStatement();
            String sql="";

            sql="SELECT * FROM HOTEL_CLIENTS";

            ResultSet dbRs = dbStmt.executeQuery(sql);

              while(dbRs.next())
              {
                 int id = dbRs.getInt("id");
                 String uname = dbRs.getString("uname");
                 String usurname = dbRs.getString("usurname");
                 int afm = dbRs.getInt("afm");
                 int days = dbRs.getInt("days");
                 String room_type = dbRs.getString("room_type");
                 float transport_cost = dbRs.getFloat("transport_cost");
                 String diet_type = dbRs.getString("diet_type");

                 session.setAttribute("id", id);
                 session.setAttribute("uname", uname);  
                 session.setAttribute("usurname", usurname);  
                 session.setAttribute("afm", afm);  
                 session.setAttribute("days", days);
                 session.setAttribute("room_type", room_type); 
                 session.setAttribute("transport_cost", transport_cost);
                 session.setAttribute("diet_type", diet_type); 
                 %>
                 <%@include file="table_For_ShowClients.jsp"%>
                 <%
                
              }
           dbConn.close();  
        }
  }
  catch(SQLException e)
  {
    dbConn = null;
    out.println("SQLException caught: " +e.getMessage());
  }    
  %>    
  
    </body>
</html>
