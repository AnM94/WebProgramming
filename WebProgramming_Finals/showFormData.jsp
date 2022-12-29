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

		* { 
		  box-sizing: border-box; 
		  font-size: 15px;
		}
			
		.Pictures{
			position: relative;
			top: 0;
			right:  0;
		}

		.bg_img {
			max-height: 100%; 
			max-width: 100%; 
			background-position: center;
			background-repeat: no-repeat; 
			background-size: cover; 
			position: relative;
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
    <div class="Pictures">
		<img class="bg_img" src='hotel-room.jpg'> 
         <button class="btn_img" onclick="location.href='form.html'"></button>
    <body>
        
        <%
                String uname=request.getParameter("Name");     
                String usurname=request.getParameter("SurName");
                String uAFM=request.getParameter("Afm");   
                String days=request.getParameter("Days");
                int uDays=Integer.parseInt(days);
                String uChoice=request.getParameter("choice");
                String Transport=request.getParameter("transport");
                float uTransport=0;
                
                String uChoice2=request.getParameter("choice2");
               
                double Cost=0;
                int Cost_Room=0; 
                int Cost_Diatrofh=0; 

                if(uDays<=0){
                    response.sendRedirect("Error_Days.html");
                }
                
                boolean correct = Transport.matches("[-+]?[0-9]*\\.?[0-9]+");
                if(!correct){
                    response.sendRedirect("Error_Transport.html");
                }else{
                           uTransport=Float.parseFloat(Transport);
                if (uTransport<=0){
                    response.sendRedirect("Error_Transport2");
                }else{
                
                if(uChoice.equals("Mezoneta"))  {
                    if(uChoice2.equals("Plhrhs")){
                        Cost=(uTransport+(uDays*45)+(uDays*150));
                        Cost_Diatrofh=(uDays*45); 
                                                   
                    }    
                    if(uChoice2.equals("Hmidiatrofh")){
                        Cost=(uTransport+(uDays*30)+(uDays*150));
                        Cost_Diatrofh=(uDays*30);                 
                    }
                    if(uChoice2.equals("Prwino")){
                        Cost=(uTransport+(uDays*10)+(uDays*150));
                        Cost_Diatrofh=(uDays*10);                 
                    }
                     if(uChoice2.equals("Oxi")){
                        Cost=(uTransport+(uDays*150));
                        Cost_Diatrofh=0;                 
                    }
                    Cost_Room=(uDays*150); 
                }
                
                 
                if(uChoice.equals("Diplo"))  {
                    if(uChoice2.equals("Plhrhs")){
                        Cost=(uTransport+(uDays*45)+(uDays*120));
                        Cost_Diatrofh=(uDays*45); 
                                                   
                    }    
                    if(uChoice2.equals("Hmidiatrofh")){
                        Cost=(uTransport+(uDays*30)+(uDays*120));
                        Cost_Diatrofh=(uDays*30);                  
                    }
                    if(uChoice2.equals("Prwino")){
                        Cost=(uTransport+(uDays*10)+(uDays*120));
                        Cost_Diatrofh=(uDays*10);                  
                    }
                     if(uChoice2.equals("Oxi")){
                        Cost=(uTransport+(uDays*120));
                        Cost_Diatrofh=0;                  
                    }
                    Cost_Room=(uDays*120);
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
                    Cost_Room=(uDays*80); 
                }
            } 
         }
                
        session.setAttribute("uname", uname);    
        session.setAttribute("usurname", usurname);  
        session.setAttribute("uAFM", uAFM);  
        session.setAttribute("uDays", uDays);
        session.setAttribute("uChoice", uChoice); 
        session.setAttribute("uTransport", uTransport);
        session.setAttribute("uChoice2", uChoice2); 
        session.setAttribute("Cost", Cost);
        %>
        
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
