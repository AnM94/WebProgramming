<%-- 
    Document   : Final_Cost_Calculate
    Created on : 11 Δεκ 2022, 1:43:24 μμ
    Author     : antonis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
        
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
            position: absolute;
            background-position: center;
        }
            
            
        .content-table {
            position: absolute;
            margin: 10px;
            border-collapse: collapse;
            /*margin: -10px 75%;*/
            font-family: Arial;
            font-size: 15px;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden; 
            box-shadow: 10px 10px 18px #BCA352 inset, 10px 10px 18px #BCA352;
            
        }

        .content-table thead tr {
            background-color: #BCA352;
            color: #ffffff;
            text-align: right;
            font-weight: bold;
        }

        .content-table th,
        .content-table td {
            padding: 20px 15px;
        }

        .content-table tbody th{
            border-bottom: 2px solid #BCA352;
        }
        
        .content-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
        
        .content-table tbody tr:last-of-type{
            border-top: 2px solid #BCA352;
        }

        .content-table tbody tr {
            background-color: #3b3c36;
        }
      
        .content-table tbody tr.active-row {
            font-weight: bold;
            color: #BCA352;
        }
        
       
        
        </style>
    </head>
    <div class="Pictures">
		<img class="bg_img" src='grand-hotel-palace.jpg'>  
        <button class="btn_img" onclick="location.href='form.html'"></button>
    <body>
        <table class="content-table" style="top: 0px; right: 10px;" >
            <thread>
                <tr>
                    <th style="text-align: right; ">Στοιχεία Πελάτη</th><th></th>
                </tr>
            </thread>
            <tbody>
                <tr class="active-row">
                    <td>ID</td>
                    <td><% out.print(session.getAttribute("id")); %></td>
                </tr>
                <tr>
                    <td>Όνομα</td>
                    <td><% out.print(session.getAttribute("uname")); %></td>
                </tr>
                <tr>
                    <td>Επώνυμο</td>
                    <td><% out.print(session.getAttribute("usurname")); %></td>
                </tr>
                <tr>
                    <td>ΑΦΜ</td>
                    <td><% out.print(session.getAttribute("afm")); %></td>
                </tr>
                <tr>
                    <td>Ημέρες Διαμονής</td>
                    <td><% out.print(session.getAttribute("days")); %></td>
                </tr>
                <tr>
                    <td>Κατηγορία Δωματίου</td>
                    <td><% out.print(session.getAttribute("room_type")); %></td>
                </tr>
                <tr>
                    <td>Κόστος Μεταφοράς</td>
                    <td><% out.print(session.getAttribute("transport_cost")); %></td>
                </tr>
                <tr>
                    <td>Είδος Διατροφής</td>
                    <td><% out.print(session.getAttribute("diet_type")); %></td>
                </tr>
                </table>    
    </div>
    </body>
</html>
