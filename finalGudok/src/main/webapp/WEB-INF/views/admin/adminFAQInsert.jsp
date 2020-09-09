<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title></title>
    <style>
          body{
      font-family: 'Jua', sans-serif;
    }
    .list{
        margin:20px;
        list-style-type: none;
    }
    table {
    width: 100%;
    border-top: 1px solid #CCCCCC !important;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #CCCCCC !important;
    padding: 10px;
  }
  
  #list a{
    color:black;
    text-decoration: none;
  }
  button{
      background-color: rgb(0, 125, 255);
  }

  .container {
        width: 100%;
        margin-right: auto;
        margin-left: auto;
        margin:auto;
    }
    .content{
        margin-left:250px;
        background-color: RGB(237,237,237);
        padding:50px;
    
    }
    .box{
        padding:70px 70px 70px 70px; 
        
        background-color: #ffffff;
        height:1100px;
      
    }

        .filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: rgb(0, 125, 255);
    border-color:  rgb(0, 125, 255);
    margin-bottom:0px;
}

</style>
</head>
<body>
  <jsp:include page="../common/adminMenubar.jsp"/>

    <!-- 화면 -->
    <div class="content">
      <div class="container box">

            <form action="insertFAQ.do" method="post" enctype="multipart/form-data" onsubmit="return validate();">
            <input type="hidden" name="bMember_id" value=${loginUser.memberId }>
          	<input type="hidden" name="bEmail" value=${loginUser.email }>
          	<input type="hidden" name="bMember_no" value=${loginUser.memberNo }>
                <div style="font-size: 30px;">FAQ</div><br>
                <hr style="border-color:rgb(0, 125, 255);">
                <table style="text-align: center; margin-top:15px">
                    <tbody>
                        <tr>
                            <th style="padding:20px;" >제목</th>
                            <td>
                                <textarea class="form-control" rows="1" style="resize: none;width:907px;" name="bTitle" id="bTitle"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th style="padding:20px;">내용</th>
                            <td><textarea class="form-control" rows="22" style="resize: none; width:907px" name="bContent" id="bContent"></textarea></td>
                        </tr>
                    </tbody>
                  </table>
            <br><br>
            &nbsp;&nbsp;<a href="javascript:history.go(-1)" type="button" class="btn btn-primary" style="float:right;">이전으로</a>
            <input type="submit" value="저장" class="btn btn-primary" style="float:right; margin-right: 10px;">
          </form>
            <br><br><br>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
 
 
 	<script>
 	
 	function validate(){
    	  
 		var flag = true;
 		
  	   if($("#bTitle").val().trim().length == 0){
             alert("제목을 입력하세요");
             $("#bTitle").focus();
             flag = false;
  	   }
  	   else if($("#bContent").val().trim().length == 0){
  		   alert("내용을 입력하세요");
             $("#bContent").focus();
             flag = false;
  	   }
  	   else{
  		 	if(confirm("FAQ를 등록하시겠습니까?")){
		 		alert("등록되었습니다!");
		 	}else{
		 		flag = false;
		 	}           
          }
  	   return flag;
       }
 	
 	</script>
   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
    
</body>
</html>