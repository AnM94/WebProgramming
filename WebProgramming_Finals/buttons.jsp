<%-- 
    Document   : Buttons
    Created on : 11 Δεκ 2022, 2:40:16 μμ
    Author     : antonis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            
            .popup {
                position: absolute;
                top: 400px; right: 230px;
                display: inline-block;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .popup .popuptext {
                visibility: hidden;
                width: 160px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 8px 0;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                margin-left: -80px;
            }

            .popup .popuptext::after {
				content: "";
				position: absolute;
				top: 100%;
				left: 50%;
				margin-left: -5px;
				border-width: 5px;
				border-style: solid;
				border-color: #555 transparent transparent transparent;
            }

            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }

            @-webkit-keyframes fadeIn {
                from {opacity: 0;} 
                to {opacity: 1;}
            }

            @keyframes fadeIn {
				from {opacity: 0;}
				to {opacity:1 ;}
            }
            
			.btn{
				background-color: #BCA352;
				border: none;
				color: white;
				padding: 15px 32px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 18px;
				font-weight: bold;
				margin: 0px 0px;
				cursor: pointer;
				opacity: 1;
			}

		    .btn_save:hover{ background-color: black;  opacity: 1; }
        
			.btn_save{ position: relative; }
        
			.btn_view_clients:hover{ background-color: black;  opacity: 1; }
        
			.btn_view_clients{ position: absolute; top: 400px; right: 40px; }

        </style>
    </head>
    <body>
            <%@include file="Save_Client.jsp" %>         
            
            <div class="popup" onclick="myFunction()">
                <input type="button" value="Αποθήκευση" onclick="<%Save();%>" class="btn btn_save">
                <span class="popuptext" id="myPopup">Επιτυχής Αποθήκευση!</span>
            </div>
            
                <a href="ShowClients.jsp">
                <input type="button" value="Προβολή" class="btn btn_view_clients">
                </a>
                
            <script>
                function myFunction() {
                  var popup = document.getElementById("myPopup");
                  popup.classList.toggle("show");
                }
            </script>
    </body>
</html>
