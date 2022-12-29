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
  String JDBC_DRIVER = "com.mysql.jdbc.Driver";//Δηλώνω τον mysql Driver
  String db_URL = "jdbc:mysql://127.0.0.1:3306/hotel_db?characterEncoding=utf8";//Δηλώνω το URL της βάσης και την κωδικοποίηση  
  String dbUSER = "Athena";
  String dbPASS = "Athena";
  Connection dbConn = null;
  Statement dbStmt = null;  //Statement: μηχανή εκτέλεσης εντολών SQL
   
  try {
    Class.forName(JDBC_DRIVER);
    dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);  
    
    if(dbConn != null)
    {
        dbStmt = dbConn.createStatement();
        /*String uBC=request.getParameter("BC");
        String uname=request.getParameter("name");
        String udescription=request.getParameter("description");*/
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
        
        
        
        ResultSet dbRs = dbStmt.executeQuery(sql);//Για τα SELECT γράφω executeQuery()
          
          while(dbRs.next())//Αν βρέθηκε η εγγραφή (True:Υπάρχουν δεδομένα , False:Δεν υπάρχουν δεδομένα)
          {
             int id = dbRs.getInt("id");//μέσα στα " " βάζω τις μεταβλητές έτσι όπως τις όρησα στο αρχείο .sql
             String uname = dbRs.getString("uname");
             String usurname = dbRs.getString("usurname");
             int afm = dbRs.getInt("afm");
             int days = dbRs.getInt("days");
             String room_type = dbRs.getString("room_type");
             float transport_cost = dbRs.getFloat("transport_cost");
             String diet_type = dbRs.getString("diet_type");
             
             
            //Για να ξέρει αυτά τα Attributes το 'table_For_Search.jsp'      
            session.setAttribute("id", id);   //Το 'table_For_Search.jsp' θα τα πάρει μέσω getAttribute  
            session.setAttribute("uname", uname);  
            session.setAttribute("usurname", usurname);  
            session.setAttribute("afm", afm);  
            session.setAttribute("days", days);
            session.setAttribute("room_type", room_type); //Κατηγορία Δωματίου
            session.setAttribute("transport_cost", transport_cost);
            session.setAttribute("diet_type", diet_type); //Είδος Διατροφής
            
             /*out.print("id : " + String.valueOf(id) + "<br>");//όπως όταν εμφανίζω τα values από μια φόρμα html
             out.print("uname : " + uname + "<br>");
             out.print("usurname : " + usurname +  "<br>");
             out.print("afm : " + String.valueOf(afm) + "<br>");//String.valueOf(): μόνο για αριθμούς
             out.print("days : " + String.valueOf(days) + "<br>");//String.valueOf(): μόνο για αριθμούς
             out.print("room_type	: " + room_type  + "<br>");
             out.print("transport_cost	: " + transport_cost  + "<br>");
             out.print("diet_type	: " + diet_type  + "<br>");
             out.print("================================<br>");    */
          }
        
       dbConn.close();  //Κλείνω την σύνδεση
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
