<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
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
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
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


    </style>
  </head>
  <body>
  
  <jsp:include page="../common/adminMenubar.jsp"/>

    <!-- 화면 -->
    <div class="content">
      <div class="container box">

        <div style="font-size: 30px;">공지사항</div>
        <div class="input-group" >
        <form action="searchNoticeList.do" method="post" enctype="multipart/form-data">
              <select class="custom-select" id="searchType" name="searchType" style="margin-left:614px; width:150px">
                <option value="title"<c:if test="${searchType eq 'title' }">selected='selected'</c:if> >제목</option>
                <option value="content"<c:if test="${searchType eq 'content' }">selected='selected'</c:if> >내용</option>
                <option value="titleContent"<c:if test="${searchType eq 'titleContent' }">selected='selected'</c:if> >제목+내용</option>        
              </select>
              <div class="input-group-append" style="float:right; width: 75px; height: 38px;">    
              <input type="text" class="form-control" id="keyword" name="keyword" value="${keyword }" style="float:right; width:450px;height: 38px;" placeholder="검색어를 입력하세요">
                <input type="submit" value="검색" id="searchBtn" name="searchBtn" class="btn btn-primary" style="float:right; height:38px; margin-right: 10px;">     
              </div>
          	 </form>
         </div>
            <br>
			<input type="hidden" name="searchType" value="${searchType }">
            <input type="hidden" name="keyword" value="${keyword }">
            
          <table style="text-align: center; margin-top:15px">
        <thead>
          <tr>
            <th><input type="checkbox" id="checkAll">
            </th><th style="width:10%">번호</th>
            <th style="width:55%">제목</th>
            <th style="width:20%">작성일</th>
            <th style="width:10%">조회수</th>
          </tr>
        </thead>
        <tbody >
	        <c:choose>
		      			<c:when test="${fn:length(list)>0 }">
					        <c:forEach var="b" items="${list }">
					          <tr>
					          		<td><input type="checkbox" class="common" id="noticeNo${cnt.index}" name="noticeNo" value="${b.bBoard_no }"></td>
					          		<td align="center">${b.rownum }</td>
									<td align="center">
										<c:url var="adminNoticeDetail" value="adminNoticeDetail.do">
											<c:param name="bBoard_no" value="${b.bBoard_no }"/>
											<c:param name="page" value="${pi.currentPage }"/>
										</c:url>
										<a href="${adminNoticeDetail }">${b.bTitle }</a>
									</td>
									<td align="center">${b.bWrite_date }</td>
									<td align="center">${b.bRead_num }</td>
					          </tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="5">조회된 결과가 없습니다.</td>
						</c:otherwise>
			</c:choose>
        </tbody>
      </table>
            <br><br>
            <c:if test="${loginUser.memberId eq 'admin' }">
            &nbsp;&nbsp;<a href="adminNoticeInsert.do" type="button" class="btn btn-primary" style="float:right;">글쓰기</a> 
            <input type="button" value="삭제" style="float:right; margin-right: 10px;"" class="btn btn-primary" onclick="nDelete()">
  			</c:if>
            <br><br><br>
                  
                  
                  
                  
      			<!------페이징 처리----->
                <div class="page-center">
                	<c:choose>
		      		<c:when test="${fn:length(list1)>0 }">
                    <ul class="pagination-t">
                       <!-- 이전 -->
                        <c:if test="${pi.currentPage eq 1 }">
                           <li class="page-item-t disabled-t"><a class="page-link-t"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						   <path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
						   </svg></a></li>
                  		</c:if>
                   		<c:if test="${pi.currentPage gt 1 }">
                     		<c:url var="blistBack" value="searchNoticeList.do">
                        		<c:param name="page" value="${pi.currentPage-1 }"/>
                        		<c:param name="searchType" value="${searchType }"/>
                        		<c:param name="keyword" value="${keyword }"/>
                     		</c:url>
                            <li class="page-item-t">
                            <a class="page-link-t" href="${blistBack }">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
     						<path d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
   							</svg></a></li>
                  		</c:if>
                  
                  <!-- 번호들 -->
                  <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                     
                     <c:if test="${p eq pi.currentPage }">
                                <li class="page-item-t  active-t"><a class="page-link-t">${p }<span class="sr-only"></span></a></li>
                     </c:if>
                     
                           <c:if test="${p ne pi.currentPage }">
                              <c:url var="blistCheck" value="searchNoticeList.do">
                                 <c:param name="page" value="${p }"/>
                                 <c:param name="searchType" value="${searchType }"/>
                        		 <c:param name="keyword" value="${keyword }"/>
                              </c:url>
                              <li class="page-item-t"><a class="page-link-t" href="${blistCheck }">${p } <span class="sr-only"></span></a>
                              </li>
                          </c:if>
                        </c:forEach>
                        
                        
                        <!-- 이후 -->
                        <c:if test="${pi.currentPage eq pi.maxPage }">
                           <li class="page-item-t disabled-t"><a class="page-link-t">
                           <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						   <path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
						   </svg></a></li>
                  		</c:if>
                   		<c:if test="${pi.currentPage lt pi.maxPage }">
                     		<c:url var="blistAfter" value="searchNoticeList.do">
                        		<c:param name="page" value="${pi.currentPage+1 }"/>
                        		<c:param name="searchType" value="${searchType }"/>
                        		<c:param name="keyword" value="${keyword }"/>
                     		</c:url>
                            <li class="page-item-t">
                            <a class="page-link-t" href="${blistAfter }">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
							</svg></a></li>
                  		</c:if>
                    </ul>
                    </c:when>
                    <c:otherwise>
                    
                    </c:otherwise>
                    </c:choose>
                </div>

    </div><!--하얀박스 있는부분 끝-->
  </div><!--회색바탕 div-->
  
	 <script>
	 
	  
		  // 선택 삭제
		  
			  function nDelete(){
				 			var sendArr = Array();
		     				var sendCnt = 0;
		     				var chkbox=$(".common");
			        		
		     				for(i=0; i<chkbox.length;i++){
		               			if(chkbox[i].checked == true){
		               				sendArr[sendCnt] = chkbox[i].value;
		               				sendCnt++;
		               			}
		               		}
			        		
			        		$.ajax({
			    				url:"noticeDeleteCheck.do",
			    				type:"post",
			    				traditional:true,
			    				data:{"sendArr":sendArr},
			    				success:function(data){
			    					alert("선택한 공지들을 삭제합니다");
			    					getNoticeList();
			    				},
			    				error:function(request, status, errorData){
				                    alert("error code: " + request.status + "\n"
					                           +"message: " + request.responseText
					                           +"error: " + errorData);
					                  }   
			    			});
			        	} 
	  
		// 삭제 후 리스트 가져오기
	      function getNoticeList(){
	     	 var page=${pi.currentPage};
	     	 var searchType='${searchType}';
	     	 var keyword='${keyword}';
	     	 
	     	 $.ajax({
	     		 
	     	 	url:"noticeSearchListChange.do", 
	     	 	data:{"page":page, "searchType":searchType, "keyword":keyword},
	     	 	dataType:"json",
	     	 	success:function(data){
	     	 		
	     	 		//게시물 상세보기(ajax후)
	        	        
	        	       	$(function(){
	        	       		
	        	       		$("tr").on("click",function(){
	        	       			var bBoard_no=$(this).children().eq(1).text();
	        	        		var page=${pi.currentPage };  
	        	           		location.href="adminNoticeDetail.do?bBoard_no="+bBoard_no+"&page="+page;
	        	       		})
	        	       	})
	        	       	
	     	 		$tableBody=$("tbody");
	     	 		$tableBody.html("");
	     	 		
	     	 		var $tr;
	     	 		var $bBoard_no;
	     	 		var $rownum;
	     	 		var $bTitle;
	     	 		var $bWrite_date;
	     	 		var $bRead_num;
	     	 		var $th;
	     	 		
	     	 				
	     	 				for(var i in data.adminNoticeSearch){
	     	 					
	     	 				$tr=$("<tr id='cursor'>");
	     	 				$td=$("<td onclick='event.cancelBubble=true'>");
	     	 				$checkBox=$("<input type='checkbox' class='common' name='eventNo'>").val(data.adminNoticeSearch[i].bBoard_no);     	 			
	     	 				$bBoard_no=$("<td onclick='event.cancelBubble=true'>").text(data.adminNoticeSearch[i].bBoard_no).hide();
	     	 				$rownum=$("<td onclick='event.cancelBubble=true'>").text(data.adminNoticeSearch[i].rownum);
	     	 				$bTitle=$("<td>").text(data.adminNoticeSearch[i].bTitle);
	     	 				$bWrite_date=$("<td onclick='event.cancelBubble=true'>").text(data.adminNoticeSearch[i].bWrite_date);
	     	 				$bRead_num=$("<td onclick='event.cancelBubble=true'>").text(data.adminNoticeSearch[i].bRead_num);
	     	 				
	     	 				
	     	 				
	     	 				$td.append($checkBox);
	     	 				$tr.append($td);
	     	 				$tr.append($bBoard_no);
	     	 				$tr.append($rownum);
	     	 				$tr.append($bTitle);
	     	 				$tr.append($bWrite_date);
	     	 				$tr.append($bRead_num);
	     	 				$tableBody.append($tr);
	     	 				
	     	 			}
	     	 	},
	     	 	error:function(request, status, errorData){
	                 alert("error code: " + request.status + "\n"
		                           +"message: " + request.responseText
		                           +"error: " + errorData);
		                  }   
	     	 	
	     	 })
	     	 
	      }
	  
	  
	  // 모두 체크
	  
		  $(function(){
				
		    			$("#checkAll").click(function(){
		    				var bool = $(this).prop("checked");
		    				$(".common").prop('checked', bool);
		    				
		    			});
		    		}); 
	  
	  </script>

   




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>