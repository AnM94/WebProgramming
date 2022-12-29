<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clients</title>
        <style>
            .bg_img {
            /* The image used */
            /*background-image: url("sunset-on-beach.jpg");*/
            max-height: 100%; /*το ύψος της εικόνας */
            max-width: 100%; /*με τη χρήση ποσοστού, η εικόνα προσαρμόζεται στη διάσταση που έχει το παράθυρο */
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat; /*αν δεν γεμιζε την οθόνη η εικόνα, ΔΕΝ θα έκανε επανάληψη για να τη γεμίσει*/
            background-size: cover; /*το background προσαρμόζεται στις διαστάσεις της εικόνας*/
            position: fixed;
	}
        
        /*Κωδικας για να εχω 2 εικόνες χωρίς το logo να ειναι button*/
	/*.logo_img{
		max-height: 200px;
		max-width: 200px;
		left:  25px;
		top: 20px;
		position: absolute;
                box-shadow: 10px 10px 18px #009879;
	}*/     

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
            /*box-shadow: 10px 10px 18px #009879;*/
        }
        
        </style>
    </head>
    <body>
        <img class="bg_img" src='njv-athens-plaza.jpg'>
		<!--<img class="logo_img" src='uniwa.jpg'>--> <!--Αν ηθελα να εχω δυο εικονες χωρις καμια να ειναι κουμπι-->  
        <button class="btn_img" onclick="location.href='form.html'"></button>
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
            String sql="";

            sql="SELECT * FROM HOTEL_CLIENTS";

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
                 %>
                 <%@include file="table_For_ShowClients.jsp"%>
                 <%
                     
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
  
    </body>
</html>
