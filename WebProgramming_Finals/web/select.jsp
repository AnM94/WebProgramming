<%-- 
    Document   : select
    Created on : 11 Δεκ 2022, 3:09:50 μμ
    Author     : antonis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /*------------------SELECT-----------------------*/
            
            .btn_submit{
                background-color: #BCA352;
                border: none;
                color: white;
                padding: 13px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 18px;
                font-weight: bold;
                margin: 4px 2px;
                cursor: pointer;
                position: relative;
                top: 0px; left: 7%;
                opacity: 1; 
            }
            
            .btn_submit:hover{ background-color: black;  opacity: 1; }
            
            .box {
                position: absolute;
                top: 470px;
                right: 60px;
               
            }

            .box select {
                background-color: #BCA352;
                color: white;
                padding: 13px;
                width: 200px;
                border: none;
                font-size: 20px;
               
                -webkit-appearance: button;
                appearance: button;
                outline: none;
            }

            .box::before {
                /*content: "\f13a";*/
                font-family: FontAwesome;
                position: absolute;
                top: 0;
                right: 0;
                width: 20%;
                height: 100%;
                text-align: center;
                font-size: 28px;
                line-height: 45px;
                color: rgba(255, 255, 255, 0.5);
                background-color: rgba(255, 255, 255, 0.1);
                pointer-events: none;
            }

            .box:hover::before {
                color: rgba(255, 255, 255, 0.6);
                background-color: rgba(255, 255, 255, 0.2);
            }

            .box select option {
                padding: 30px;
            }
          
            
/*--------------------END OF SELECT-------------------------------*/
        </style>
    </head>
    <body>
        <div class="box">
            <form action="Search.jsp" method="post" >
                <select  name="search_choice">Αναζήτηση με:
                    <option value="0">Αναζήτηση με:</option>
                    <option value="name">Όνομα</option>
                    <option value="surname">Επώνυμο</option>
                    <option value="afm">ΑΦΜ</option>
                </select>
                <input type="submit" value="Υποβολή" class="btn_submit"><br>
                <textarea name="text_area" rows="1" cols="20"></textarea>
            </form>    
        </div>
    </body>
</html>
