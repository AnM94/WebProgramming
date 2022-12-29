
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
     
 <%!void Save(){ %>         <%--     '<%!' επειδή ξεκινάω συνάρτηση       --%> 
 <%
     
  String JDBC_DRIVER = "com.mysql.jdbc.Driver";//Δηλώνω τον mysql Driver
  String db_URL = "jdbc:mysql://127.0.0.1:3306/hotel_db?characterEncoding=utf8";//Δηλώνω το URL της βάσης και την κωδικοποίηση  
  String dbUSER = "Athena";
  String dbPASS = "Athena";
  Connection dbConn = null;
  Statement dbStmt = null;  //Statement: μηχανή εκτέλεσης εντολών SQL
   
  try {
    Class.forName(JDBC_DRIVER);
    dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);  
    
    
    if(dbConn != null) {
        dbStmt = dbConn.createStatement();
        String sql = "";
        
        sql="SELECT * FROM HOTEL_CLIENTS WHERE uname='" + session.getAttribute("uname") + "' AND usurname='"
                + session.getAttribute("usurname") + "' AND afm='" + session.getAttribute("uAFM") + "'";
        ResultSet dbRs = dbStmt.executeQuery(sql);
        if(!dbRs.next()){ //if entry does not exist already
            
            sql="Insert into HOTEL_CLIENTS (uname, usurname, afm, days, room_type, transport_cost, diet_type)"
                  + " values ('" + session.getAttribute("uname") + "', '" +  session.getAttribute("usurname") + "', " 
                  + session.getAttribute("uAFM") + ", " + session.getAttribute("uDays") + ",'" + session.getAttribute("uChoice") 
                  + "', " + session.getAttribute("uTransport") + ", '" + session.getAttribute("uChoice2") + "')";

            dbStmt.executeUpdate(sql);
        }
        
        dbConn.close();//Closing Connection
       
     }
  }    
  catch(SQLException e)
  {
    dbConn = null;
    out.println("SQLException caught: " +e.getMessage());
  }
  %> 
 <%!}%>
       
    </body>
</html>
