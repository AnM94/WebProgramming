<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clients</title>
    </head>
    <body>
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
        String choice = request.getParameter("search_choice");
        String uText = request.getParameter("text_area");
        String sql="";
                
        if(choice.equals("name")){
            sql="SELECT * FROM HOTEL_CLIENTS WHERE uname='" + uText + "';";
        }else if(choice.equals("surname")){
            sql="SELECT * FROM HOTEL_CLIENTS WHERE usurname='" + uText + "';";
        }else if(choice.equals("afm")){
            sql="SELECT * FROM HOTEL_CLIENTS WHERE afm='" + uText + "';";
        }else{
            sql="SELECT * FROM HOTEL_CLIENTS WHERE afm='" + uText + "' OR " + "uname='" + uText + "' OR " + "usurname='" + uText + "';";
        }
        
        
        
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
  <%@include file="table_For_Search.jsp"%>
    </body>
</html>
