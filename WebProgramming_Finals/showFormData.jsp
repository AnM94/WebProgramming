<%@page import="javax.websocket.Session"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.BufferedWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>   
<%@page import="java.io.File"      %>
<%@page import="java.io.IOException"     %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" c>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body, html {
	  height: 100%;
	  font-family: Arial, Helvetica, sans-serif;
	}

	* { /* The '*' means the changes will be applied to every element in this document */
	  box-sizing: border-box; /*The box-sizing CSS property sets how the total width and height of an element is calculated.*/
	  font-size: 15px;
	}
        
        .Pictures{
		position: relative;
		top: 0;
		right:  0;
	}

	.bg_img {
            /* The image used */
            /*background-image: url("sunset-on-beach.jpg");*/
            max-height: 100%; /*το ύψος της εικόνας */
            max-width: 100%; /*με τη χρήση ποσοστού, η εικόνα προσαρμόζεται στη διάσταση που έχει το παράθυρο */
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat; /*αν δεν γεμιζε την οθόνη η εικόνα, ΔΕΝ θα έκανε επανάληψη για να τη γεμίσει*/
            background-size: cover; /*το background προσαρμόζεται στις διαστάσεις της εικόνας*/
            position: relative;
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
    <div class="Pictures">
		<img class="bg_img" src='hotel-room.jpg'>
		<!--<img class="logo_img" src='uniwa.jpg'>--> <!--Αν ηθελα να εχω δυο εικονες χωρις καμια να ειναι κουμπι-->  
                <button class="btn_img" onclick="location.href='form.html'"></button>
    <body>
        
        <%
                String uname=request.getParameter("Name");     
                String usurname=request.getParameter("SurName");
                String uAFM=request.getParameter("Afm");   //ΑΦΜ
                String days=request.getParameter("Days");
                int uDays=Integer.parseInt(days);//ΗΜΕΡΕΣ ΔΙΑΜΟΜΗΣ
                String uChoice=request.getParameter("choice");//ΚΑΤΗΓΟΡΙΑ ΔΩΜΑΤΙΟΥ
                String Transport=request.getParameter("transport");
                float uTransport=0;
                
                String uChoice2=request.getParameter("choice2");//Είδος Διατροφής
               
                double Cost=0;//τελικό κόστος
                int Cost_Room=0; //κόστος δωματίου
                int Cost_Diatrofh=0; //Κόστος διατροφής

                if(uDays<=0){
                    response.sendRedirect("Error_Days.html");
                }
                
                boolean correct = Transport.matches("[-+]?[0-9]*\\.?[0-9]+");//Ελεγχος αν το string ειναι float
                if(!correct){
                    response.sendRedirect("Error_Transport.html");
                }else{
                           uTransport=Float.parseFloat(Transport);//ΚΟΣΤΟΣ ΜΕΤΑΦΟΡΑΣ
                if (uTransport<=0){
                    response.sendRedirect("Error_Transport2");
                }else{
                
                if(uChoice.equals("Mezoneta"))  {
                    if(uChoice2.equals("Plhrhs")){
                        Cost=(uTransport+(uDays*45)+(uDays*150));
                        Cost_Diatrofh=(uDays*45); //Υπολογισμός κόστους Διατροφής
                                                   
                    }    
                    if(uChoice2.equals("Hmidiatrofh")){
                        Cost=(uTransport+(uDays*30)+(uDays*150));
                        Cost_Diatrofh=(uDays*30); //Υπολογισμός κόστους Διατροφής                 
                    }
                    if(uChoice2.equals("Prwino")){
                        Cost=(uTransport+(uDays*10)+(uDays*150));
                        Cost_Diatrofh=(uDays*10); //Υπολογισμός κόστους Διατροφής                 
                    }
                     if(uChoice2.equals("Oxi")){
                        Cost=(uTransport+(uDays*150));
                        Cost_Diatrofh=0; //Υπολογισμός κόστους Διατροφής                 
                    }
                    Cost_Room=(uDays*150); //Υπολογισμός κόστους δωματίου
                }
                
                 
                if(uChoice.equals("Diplo"))  {
                    if(uChoice2.equals("Plhrhs")){
                        Cost=(uTransport+(uDays*45)+(uDays*120));
                        Cost_Diatrofh=(uDays*45); //Υπολογισμός κόστους Διατροφής
                                                   
                    }    
                    if(uChoice2.equals("Hmidiatrofh")){
                        Cost=(uTransport+(uDays*30)+(uDays*120));
                        Cost_Diatrofh=(uDays*30); //Υπολογισμός κόστους Διατροφής                 
                    }
                    if(uChoice2.equals("Prwino")){
                        Cost=(uTransport+(uDays*10)+(uDays*120));
                        Cost_Diatrofh=(uDays*10); //Υπολογισμός κόστους Διατροφής                 
                    }
                     if(uChoice2.equals("Oxi")){
                        Cost=(uTransport+(uDays*120));
                        Cost_Diatrofh=0; //Υπολογισμός κόστους Διατροφής                 
                    }
                    Cost_Room=(uDays*120); //Υπολογισμός κόστους δωματίου
                }
                
                if(uChoice.equals("Monoklino"))  {
                    if(uChoice2.equals("Plhrhs")){
                        Cost=(uTransport+(uDays*45)+(uDays*80));
                        Cost_Diatrofh=(uDays*45);
                                                   
                    }    
                    if(uChoice2.equals("Hmidiatrofh")){
                        Cost=(uTransport+(uDays*30)+(uDays*80));
                        Cost_Diatrofh=(uDays*30);                 
                    }
                    if(uChoice2.equals("Prwino")){
                        Cost=(uTransport+(uDays*10)+(uDays*80));
                        Cost_Diatrofh=(uDays*10);                 
                    }
                     if(uChoice2.equals("Oxi")){
                        Cost=(uTransport+(uDays*80));
                        Cost_Diatrofh=0;                 
                    }
                    Cost_Room=(uDays*80); //Υπολογισμός κόστους δωματίου
                }
            } 
         }
                
        //Για να ξέρει αυτά τα Attributes το 'table.jsp' και το 'Save_Client.jsp'        
        session.setAttribute("uname", uname); //Το 'table.jsp' και το 'Save_Client.jsp' θα τα πάρουν μέσω getAttribute   
        session.setAttribute("usurname", usurname);  
        session.setAttribute("uAFM", uAFM);  
        session.setAttribute("uDays", uDays);
        session.setAttribute("uChoice", uChoice); //Κατηγορία Δωματίου
        session.setAttribute("uTransport", uTransport);
        session.setAttribute("uChoice2", uChoice2); //Είδος Διατροφής
        session.setAttribute("Cost", Cost);
        
        %>
        
        
        
            <!-- <tr><th colspan="2">Στοιχεία Πελάτη</th></tr>
            <% 
            /*out.println( "<tr><td>Όνομα</td>" + "<td><b>" + uname+ "</b></tr>");
           out.print( "<tr><td>Επώνυμο</td>" + "<td><b>" + usurname + "</b></tr>");
            out.print("<tr><td>ΑΦΜ</td>" + "<td><b>" + uAFM + "</b></tr>");
            out.print("<tr><td>Τελικό Κόστος:</td>" + "<td><b>" + Cost + "</b></tr>");  */ 
            %> -->
         </div>   
        <%@include file="table.jsp"%>
        <%@include file="buttons.jsp"%>
        <%@include file="select.jsp"%>
        
                       
 <% 
  try {
        
      File myObj = new File("C:\\Users\\antonis\\Desktop\\Netbeans\\Exetash_Diktuakos\\" + uAFM + ".txt");
      if (myObj.createNewFile()) {
            PrintWriter myWriter = new PrintWriter(new FileWriter(myObj,true));
            myWriter.write("Όνομα: ");
            myWriter.write(uname + "\n");
            myWriter.write("Επώνυμο: ");
            myWriter.write(usurname + "\n");
            myWriter.write("Κόστος Μεταφοράς: ");
            myWriter.write(String.valueOf(uTransport) + "\n");
            myWriter.write("Ημέρες Διαμονής: ");
            myWriter.write(String.valueOf(uDays) + "\n");
            myWriter.write("Κόστος Δωματίου: ");
            myWriter.write(String.valueOf(Cost_Room) + "\n");
            myWriter.write("Κόστος Διατροφής ");
            myWriter.write(String.valueOf(Cost_Diatrofh) + "\n");
            myWriter.write("Συνολικό Κόστος: ");
            myWriter.write(String.valueOf(Cost) + "\n\n");
            myWriter.close();
      }
      
    } catch (IOException e) {
      out.print("An error occurred.");
      e.printStackTrace();
    }
%>
    </body>
</html>
