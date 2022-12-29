
<%@page import="java.lang.System.out"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
     
 <%         
  String name =(String) session.getAttribute("uname");
  String surname = (String)session.getAttribute("usurname");
  String afm = (String)session.getAttribute("uAFM");
  String days = (String)session.getAttribute("uDays");
  String room_type = (String)session.getAttribute("uChoice");
  String transport_cost = (String)session.getAttribute("uTransport");
  String diet_type = (String)session.getAttribute("uChoice2");   %>     
  
  <%! public void Save(){
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
        sql="Insert into HOTEL_CLIENTS (uname, usurname, afm, days, room_type, transport_cost, diet_type)"
              + " values ('" + name + "', '" +  surname + "', " 
              + afm + ", " + days + ",'" + room_type 
              + "', " + transport_cost + ", '" + diet_type + "')";
        
        dbStmt.executeUpdate(sql);
       
        dbConn.close();//Κλείνω την σύνδεση
       
     }
    
  }    
  catch(SQLException e)
  {
    dbConn = null;
    out.println("SQLException caught: " +e.getMessage());
  }
  }%>
       
    </body>
</html>
