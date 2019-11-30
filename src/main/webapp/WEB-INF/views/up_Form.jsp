<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更改房型</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic);
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  -o-font-smoothing: antialiased;
  font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

body {
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  font-weight: 100;
  font-size: 12px;
  line-height: 30px;
  color: #777;
  background: #4CAF50;
}

.container {
  max-width: 400px;
  width: 100%;
  margin: 0 auto;
  position: relative;
  margin-top:5px;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea,
#contact button[type="submit"] {
  font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif;
}

#contact {
  background: #F9F9F9;
  padding: 25px;
  margin: 35px auto;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
  width:450px;
  border:2px solid black;
  border-radius:10px;
}

#contact h3 {
  display: block;
  font-size: 30px;
  font-weight: 300;
  margin-bottom: 10px;
}

#contact h4 {
  margin: 5px 0 15px;
  display: block;
  font-size: 13px;
  font-weight: 400;
}

fieldset {
  border: medium none !important;
  margin: 0 0 10px;
  min-width: 100%;
  padding: 0;
  width: 100%;
}

#contact input[type="text"],
#contact input[type="email"],
#contact input[type="tel"],
#contact input[type="url"],
#contact textarea {
  width: 100%;
  border: 1px solid #ccc;
  background: #FFF;
  margin: 0 0 5px;
  padding: 10px;
}

#contact input[type="text"]:hover,
#contact input[type="email"]:hover,
#contact input[type="tel"]:hover,
#contact input[type="url"]:hover,
#contact textarea:hover {
  -webkit-transition: border-color 0.3s ease-in-out;
  -moz-transition: border-color 0.3s ease-in-out;
  transition: border-color 0.3s ease-in-out;
  border: 1px solid #aaa;
}

#contact textarea {
  height: 100px;
  max-width: 100%;
  resize: none;
}

#contact button[type="submit"] {
  cursor: pointer;
  width: 100%;
  border: none;
  background: #4CAF50;
  color: #FFF;
  margin: 0 0 5px;
  padding: 10px;
  font-size: 15px;
}

#contact button[type="submit"]:hover {
  background: #43A047;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  transition: background-color 0.3s ease-in-out;
}

#contact button[type="submit"]:active {
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
}

.copyright {
  text-align: center;
}

#contact input:focus,
#contact textarea:focus {
  outline: 0;
  border: 1px solid #aaa;
}

::-webkit-input-placeholder {
  color: #888;
}

:-moz-placeholder {
  color: #888;
}

::-moz-placeholder {
  color: #888;
}

:-ms-input-placeholder {
  color: #888;
}



</style>
</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	
	<div class="container" style="margin:10px auto;height:700px">  
  <form id="contact" action="update_room" method="post" enctype="multipart/form-data">
    <h3>更改房型</h3>
    <h4>房型資訊</h4>
    <fieldset>
      <input type="hidden" name="room_id" value="${room_info.room_id}">
      <input name="room_type" placeholder="房型名稱" type="text" value="${room_info.room_type}" required="required"/>
    </fieldset>
    <fieldset>
      <input name="room_quantity" placeholder="房型數量" type="text" value="${room_info.room_quantity}" required="required"/>
    </fieldset>
    <fieldset>
      <input name="room_price" placeholder="房型價位" type="text" value="${room_info.room_price}" required="required"/>
    </fieldset>
       <fieldset>
      <input name="room_people" placeholder="容納人數" type="text" value="${room_info.room_people}" required="required"/>
    </fieldset>
           <fieldset>
      <input name="room_bed" placeholder="床數" type="text" value="${room_info.room_bed}" required="required"/>
    </fieldset>
           <fieldset>
      <input name="room_pings" placeholder="坪數" type="text" value="${room_info.room_pings}" required="required"/>
    </fieldset>
    <fieldset>
      <textarea name="room_description" placeholder="此房型詳細資料" >${room_info.room_description}</textarea>
    </fieldset>
    <fieldset>
      <input name="imageCover" placeholder="房型圖片" type="file">
    </fieldset>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">確認修改</button>
    </fieldset>
  </form>
</div>
	
	<jsp:include page="admin_footer.jsp" />
</body>
</html>