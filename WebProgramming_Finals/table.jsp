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
            
        .content-table {
            position: absolute;
            border-collapse: collapse;
            /*margin: -10px 75%;*/
            font-family: Arial;
            font-size: 15px;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden; /*Σε περίπτωση που γεμιζε το κελι από το περιεχόμενο θα εβαζε scrollbar. 
                                Ως 'hidden' δεν θα βάλει.(Δεν έχει λόγο ύπαρξης ως 'hidden')*/
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
        
        
        
		.btn_back {
            /*margin: 260px; */
            font-weight: bold;
            background-color: #BCA352;
            color: white;
            padding: 14px 40px;
            border: none;
            cursor: pointer; 
            width: 100%;
            opacity: 0.8;    
        }

		.btn_back:hover {
			opacity: 1;
        }
        
        </style>
    </head>
    <body>
        <table class="content-table" style="top: 30px; right: 10px" >
            <thread>
                <tr>
                    <th style="text-align: right; ">Στοιχεία Πελάτη</th><th></th>
                </tr>
            </thread>
            <tbody>
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
                    <td><% out.print(session.getAttribute("uAFM")); %></td>
                </tr>
                <tr class="active-row">
                    <td>Τελικό Κόστος</td>
                    <td><% out.print(session.getAttribute("Cost")); %></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="form.html" class="btn_back"><big>Πίσω</big></a></td>
                </tr>
            </tbody>
        </table>    
    </body>
</html>
