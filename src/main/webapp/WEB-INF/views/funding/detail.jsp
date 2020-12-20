<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${funding.rewardList}" var="rewardList"/>
<section class="htc__product__details pt--20 pb--50 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                        <div class="product__details__container">
                            <div class="product__big__images">
                                <div class="portfolio-full-image tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active product-video-position mx-auto" id="img-tab-1">
                                        <img src="<%=request.getContextPath()%>/member/getPicture?picture=${funding.project_img}" style="width:590px; height:590px;" alt="full-image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-30 xmt-30">
                        <div class="htc__product__details__inner">
                            <div class="pro__detl__title">
                            <!-- 제목 -->
                                <h2>${funding.title}</h2>
                            </div>
                            <!--판매자 정보 사진첨부하고 하셈~ -->
                            <div class="pro__details">
                           		<p><i class="zmdi zmdi-circle"></i> ${funding.writer} </p>
                            </div>
                            
                            
                            <ul class="pro__dtl__prize">
                                <li class="old__prize">모인금액</li>
                                <li>${funding.price_pre} <span>원 <span class="percent">${funding.percent }</span>%</span></li>
                            </ul>
                            
                            <ul class="pro__dtl__prize">
                                <li class="old__prize">남은시간</li>
                                <li>13 <span>일</span></li>
                            </ul>
                            
                            
                            <blockquote>
	                           	<p><strong>펀딩 진행중</strong></p>
								<p>	목표 금액인 ${funding.price_goal }원이 모여야만 결제됩니다.<br>
								결제는 2020년 12월 17일에 다함께 진행됩니다.</p>
							</blockquote>
                            
                            
                             <ul class="pro__dtl__prize">
                                <li class="old__prize">후원자</li>
                                <li>${funding.fcount } <span>명</span></li>
                            </ul>
                            
                            
                            
                            <ul class="pro__dtl__btn">
                                <li class="buy__now__btn"><a href="#rewardFocus">후원하기</a></li>
                                <li><a href="javascript:registWish(${funding.fno})"><span class="far fa-heart f${funding.fno}"></span></a></li>
                                <li><a href="#"><span class="ti-sharethis"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>


<!-- divid -->

<section class="blog-details-wrap ptb--20 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
                        <!--  왼쪽 -->
                        <div class="blog-details-left-sidebar">
                            <!-- 메뉴선택 바 -->
			                <div class="row">
			                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
			                        <ul class="product__deatils__tab mb--60" role="tablist">
			                            <li role="presentation" class="active">
			                                <a href="#story" role="tab" data-toggle="tab" aria-expanded="true">스토리</a>
			                            </li>
			                            <li role="presentation" class="">
			                                <a href="#community" role="tab" data-toggle="tab" aria-expanded="false">커뮤니티</a>
			                            </li>
			                            <li role="presentation" class="">
			                                <a href="#funding_info" role="tab" data-toggle="tab" aria-expanded="false">펀딩 안내</a>
			                            </li>
			                        </ul>
			                    </div>
			                </div>
			                
					                
					                <div class="row">
					                    <div class="col-md-12">
					                        <div class="product__details__tab__content">
					                        	<!--스토리탭 --> 
					                            <div role="tabpanel" id="story" class="fade active in">
					                                  ${funding.content }
					                            </div>
					                            <!-- 스토리 끝 -->
					                            
					                            
					                            
					                           <!-- 커뮤니티 -->
					                            <div role="tabpanel" id="community" class="fade" >
													<div class="review__address__inner">
					                                    <!-- Start Single Review -->
					                                    <div class="pro__review" style="display: contents;"> 
					                                    	
					                                    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
																	  글 등록
															</button>
																	
																	<!-- 내용 작성 -->
																	<div class="modal" id="myModal">
																	  <div class="modal-dialog">
																	    <div class="modal-content">
																	
																	      <!-- Modal Header -->
																	      <div class="modal-header">
																	        <h4 class="modal-title">Modal Heading</h4>
																	        <button type="button" class="close" data-dismiss="modal">&times;</button>
																	      </div>
																	
																	      <!-- Modal body -->
																	      <div class="modal-body">
																	       <form action="<%=request.getContextPath() %>/community/regist.do" method="post">
																				fno:<input type="hidden" name="fno" value="${param.fno }"/>
																				title: <input type="text" name="title"	/>
																				content: <input type="text" name="content"	/>
																				<input type="hidden" name="email" value="${loginUser.email }">
																				<input type="submit" value="등록"> 
																			</form>
																	      </div>
																	
																	      <!-- Modal footer -->
																	      <div class="modal-footer">
																	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
																	      </div>
																	
																	    </div>
																	  </div>
																	</div>
					                                    	
															
					                                        		
					                                        		
					                                        
					                                        <c:forEach var="community" items="${communityList}" varStatus="status">
					                                        <div class="accordion" id="aco_profile">
																<div class="card">
																	<div class="card-header" id="cre_name">
																	<div class="communitys" data-toggle="collapse" data-target="#creater_name${community.cno }" 
																	aria-expanded="true" onclick="showReply(${community.cno })" aria-controls="#creater_name">
																		
																		
																		<span>작성자 : ${community.email }</span> 
																		<span>댓글 :${community.replyCount }</span>	
																		<span>작성일 :${community.regdate }  </span>
																		<input type="hidden" value="${community.cno }" class="cno">
																		<input type ="hidden" value="${community.fno }" class="fno">
																		<span><textarea name="content" style="background: #ffffff; border: 1px solid #e8d9d8;  display: none;">${community.content }</textarea>
																		<span class="textareaSpan">글 내용 :  ${community.content }</span> 
																		<!-- <span  id="contentBtn" style="display: block;">글수정</span> -->
																		</span>
																		<input type="hidden" name="cno" value="${community.cno }"> 
																	</div>
																	<button type="button" class="contentBtn" onclick="contentBtn(this)"  style="display: block;">글수정</button>
																	<button type="button" class="removeBtn" onclick="removeBtn(this)"  style="display: block;">글삭제</button>
																	<button type="button" class="updateBtn"onclick="updateBtn(this)"  style="display: none;" >등록</button>
																	<button type="button" class="backBtn" onclick="backBtn(this)"  style="display: none;" >취소</button>
																	</div>
																	<div id="creater_name${community.cno }" class="collapse" aria-labelledby="cre_name" data-parent="#aco_profile">
																		<div class="card-body">
																		<div class="reply${community.cno}" ></div>
																		
																			<input class="form-control" type="text" name="replyContent${community.cno }" placeholder="댓글 등록" >
																			
																			<button type="button" id="replyBtn" onclick="replyBtn(${community.cno })">등록</button>
																			
																		</div>
																	</div>
																</div>
															</div>
															</c:forEach>
					                                    </div>
					                                    <!-- End Single Review -->
					                                    <!-- Start Single Review -->
					                                   
					                                    <!-- End Single Review -->
					                                </div>
					                                
					                            </div>
					                            <!-- End 커뮤니티 -->
					                            
					                            
					                            
					                            <!-- Start펀딩 인포  -->
					                            <div role="tabpanel" id="funding_info" class=" fade">
					                                
					                                펀딩 ㅓㅇ보 
					                                
					                            </div>
					                            <!-- End Single Content -->
					                        </div>
					                    </div>
					                </div>
                            
                            
                            
                        </div>
                    </div>
                    
    <!-- 오른쪽 -->
                    <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12 smt-30 xmt-40">
        
                        <div class="blod-details-right-sidebar">
                        <!-- 창작자 소개 -->
                            <div class="" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						          	<p><strong>창작자 소개</strong></p>
						          	<img class="ti-heart" /> <strong>${funding.creater }</strong>
						          	<p>녕하세요. 현재 작품활동 및 미술교육을 하고있는 임여송입니다. 외할머니와 함께 살적에 종종 미술활동을 함께 하다보니 할머니께서 그림에 취미를 가지게 되었습니다. 이제는 혼자서 심심하실 때마다 그림을 그리십니다. 스케치북과 간단한 크레파
						          	</p>
						          	<hr>
						          	<div style="font-color:#333333;">
						          	<p>마지막 로그인 <strong> 한 시간 전 </strong></p>
						          	<p>진행한 프로젝트 <strong class="plr--10">1</strong> 밀어준 프로젝트 <strong class="plr--10">1</strong> </p>
						        	<button class="btn text-center mt--10" style="width:100%; padding:5px;" onclick="javascript:OpenWindow('<%=request.getContextPath() %>/member/messageSend.do?receiver=${funding.writer}','메시지',800,600)"> <i class="ti-email"></i>&nbsp;&nbsp;창작자에게 문의 하기</button>	
						          	</div>
						        </div>
                            
                            <!-- 선물선택 기본 -->
                             	<div class="mt--20 selectReward" id="rewardFocus" onclick="select(this,1000);" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <strong style="font-size:1.5rem">1,000 + </strong>
						          <p>선물을 선택하지 않고 밀어만 줍니다.</p>
						        </div>
						        <c:forEach items="${rewardList}" var="list">
						        	<div class="mt--20 selectReward" onclick="select(this,${list.rprice},${list.rno});" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; ">
						         <p style=" margin:0px 10px 10px 0px ;">${list.rcount-list.subcount } 개 남음</p> 
						         <strong  style="font-size:1.5rem; margin-bottom:10px;">${list.rprice } + </strong>
						         <p>선물 내용 ~</p>
						         <ul style="list-style:disc; list-style-position: inside; ">
						         
						         	<c:forEach items="${list.rItemList}" var="iList">
						         		<li>${iList.ritem}&nbsp;&nbsp;&nbsp;${iList.options }</li>
						         	</c:forEach>
						         	
						         </ul>
						        </div>
						        </c:forEach>
						        
						        <!-- 구매를 위한 form -->
						        <form role=form>
						        		<input type="hidden" name="rno" value="0">
						        		<input type="hidden" name="fno" value="${funding.fno }">
					        	</form>
						        
                            <!-- 리워드 반복 -->
<%--                             	<div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; "> --%>
<!-- 						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p> -->
<!-- 						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong> -->
<!-- 						         <p>선물 내용 ~</p> -->
<!-- 						         <ul style="list-style:disc; list-style-position: inside; "> -->
<!-- 						         	<li>선물 1</li> -->
<!-- 						         	<li>선물 2</li> -->
						         
<!-- 						         </ul> -->
<!-- 						        </div> -->
						        
<%-- 						        <div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; "> --%>
<!-- 						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p> -->
<!-- 						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong> -->
<!-- 						         <p>선물 내용 ~</p> -->
<!-- 						         <ul style="list-style:disc; list-style-position: inside; "> -->
<!-- 						         	<li>선물 1</li> -->
<!-- 						         	<li>선물 2</li> -->
						         
<!-- 						         </ul> -->
<!-- 						        </div> -->
						        
<%-- 						        <div class="mt--20" style="background: rgba(0, 0, 0, 0) url(<%=request.getContextPath() %>/resources/images/bg/2.jpg) ; padding:20px; border-radius:10px; "> --%>
<!-- 						         <p style=" margin:0px 10px 10px 0px ;"><i class="ti-check" ></i> <span>123</span>명이 선택</p> -->
<!-- 						         <strong  style="font-size:1.5rem; margin-bottom:10px;">5,000 + </strong> -->
<!-- 						         <p>선물 내용 ~</p> -->
<!-- 						         <ul style="list-style:disc; list-style-position: inside; "> -->
<!-- 						         	<li>선물 1</li> -->
<!-- 						         	<li>선물 2</li> -->
						         
<!-- 						         </ul> -->
<!-- 						        </div> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

<script>
	function select(frame, pr, rno) {
		const list = document.querySelectorAll('.selectReward');
		const del = document.querySelector('input[name="price"]');
		const sub = document.querySelector('input[value="구매"]');
		const del2 = document.querySelector('.message');
		
		if(del != null){
			del.parentNode.removeChild(del);
			del2.parentNode.removeChild(del2);
			sub.parentNode.removeChild(sub);
		}

		for(let i=0; i<list.length; i++){
			list[i].style.border="";
		}
		
		const price = document.createElement("input");
		price.setAttribute("name","price");
		price.setAttribute("type","text");
		price.setAttribute("value","0");
		
		const al = document.createElement("p");
		al.innerText = "더 후원하기";
		al.setAttribute("class","message");
		
		const buy = document.createElement("input");
		buy.setAttribute("type","submit");
		buy.setAttribute("value","구매");
		buy.setAttribute("onclick","buy(" +pr+ "," + rno + ")");
		
		
		
		frame.append(al);
		frame.append(price);
		frame.append(buy);
		price.focus();
		
		frame.style.border="5px solid #c78c8c";
	}
	
	function buy(pr, rno){
		const pr2 = document.querySelector('input[name="price"]').value;
		const lastPrice = parseInt(pr) + parseInt(pr2);
		
		const rprice = document.createElement("input");
		rprice.setAttribute("type","hidden");
		rprice.setAttribute("value",lastPrice);
		rprice.setAttribute("name","sprice");
		
		console.log(rno);
		document.querySelector('input[name="rno"]').value = rno;
		
		
		const form = document.querySelector('form[role="form"]');
		form.append(rprice);
		form.setAttribute("method","post");
		form.setAttribute("action","<%=request.getContextPath() %>/member/buy.do");
		form.submit();
// 		console.log(form);
	}
</script>
<script>
			
			
			function replyremove(rpno){
				$.ajax({
					url : "<%=request.getContextPath()%>/reply/remove.do",
					type: "get",
					data : {
							rpno : rpno
					},
					success:function(req){
						alert('삭제성공');
					}
				})
			}
			
			function replyModify(rpno){
				$.ajax({
					url : "<%=request.getContextPath()%>/reply/modify.do",
					type : "get",
					data : {
						content : $('input[name="replyContents'+rpno+'"]').val(),
						rpno : rpno
					},
					success:function(req){
						alert('수정 성공');
					}
				})
				
				
			}
			
			function replyBtn(cno){
				$.ajax({
					url : "<%=request.getContextPath()%>/reply/regist.do",
					type : "get",
					data :{ cno : cno,
							content : $('input[name="replyContent'+cno+'"]').val(),
							email : "${loginUser.email}"
					},
					success:function(req){
						if(req){
						alert('성공');
						}
					}
				})
				
			}
			
			function removeBtn(cno){
		         
				cno2 = $(cno).closest('div').find('.cno').val()
				$.ajax ({
					url: "<%=request.getContextPath()%>/community/remove.do",
					type: "post",
					data : {cno : cno2,
							content : $(cno).closest('div').find('textarea').val()
						},
					success:function(req){
						if(req){
							alert('삭제 성공');
							$(cno).closest('div').find('.contentBtn').css("display", "block")
							$(cno).closest('div').find('textarea').css("display", "none")
						 	$(cno).closest('div').find('.updateBtn').css("display", "none")
						 	$(cno).closest('div').find('.backBtn').css("display", "none")
						 	$(cno).closest('div').find('.removeBtn').css("display", "block")
						 	$(cno).closest('div').find('.textareaSpan').css("display", "block").text(req);
						}
					}
				})
			}



		function updateBtn(cno){
					cno2 = $(cno).closest('div').find('.cno').val()
					$.ajax ({
						url: "<%=request.getContextPath()%>/community/modify.do",
						type: "post",
						data : {content : $(cno).closest('div').find('textarea').val(),
								cno : cno2
								},
						success:function(req){
							if(req){
								alert('수정 성공');
								$(cno).closest('div').find('.contentBtn').css("display", "block")
								$(cno).closest('div').find('textarea').css("display", "none")
							 	$(cno).closest('div').find('.updateBtn').css("display", "none")
							 	$(cno).closest('div').find('.backBtn').css("display", "none")
							 	$(cno).closest('div').find('.removeBtn').css("display", "block")
							 	$(cno).closest('div').find('.textareaSpan').css("display", "block").text(req);
							}
						}
					})
				}
		
	 function contentBtn(cno){
		 
		  $(cno).closest('div').find('.removeBtn').css("display", "none")
		  $(cno).closest('div').find('textarea').css("display", "block")
		  $(cno).closest('div').find('.updateBtn').css("display", "block")
		  $(cno).closest('div').find('.contentBtn').css("display", "none")
		  $(cno).closest('div').find('.backBtn').css("display", "block")
		  $(cno).closest('div').find('.textareaSpan').css("display", "none")
	} 
	function backBtn(cno){
		
		$(cno).closest('div').find('.removeBtn').css("display", "block")
		  $(cno).closest('div').find('textarea').css("display", "none")
		  $(cno).closest('div').find('.updateBtn').css("display", "none")
		  $(cno).closest('div').find('.contentBtn').css("display", "block")
		  $(cno).closest('div').find('.backBtn').css("display", "none")
		  $(cno).closest('div').find('.textareaSpan').css("display", "block")
		
	} 

	
	
	  function showReply(cno){
		  
		  // 요청
		  xhttp = new XMLHttpRequest();
		  xhttp.open('get', '<%=request.getContextPath()%>/reply/list.do?cno='+cno, true)
		  xhttp.send()
		    
		  //응답
		  xhttp.onreadystatechange = function() {
		      if(this.readyState == 4 && this.status == 200){
		          res = this.responseText;
		          jsondata = JSON.parse(res);
		          console.log(jsondata);
				  let code="";
				  for(let i=0; i<jsondata.length; i++){
					  code +="<form>"
					  code +='<input type="hidden" class="rpno" name="rpno" value="'+jsondata[i].rpno+'">';
					  code +='<input type="hidden" name="cno" class="cnos" value="'+jsondata[i].cno+'">';
					  code +='작성자:<input type="text" name="email" value="'+jsondata[i].email+'">';
					  code +='내용:<input type="text" name="replyContents'+jsondata[i].rpno+'" value="'+jsondata[i].content+'">';
					  code +='<input type="text" name="regdate" value="'+jsondata[i].regdate+'">';
					  code +='<input type="button" class="replyModify" value="수정" onclick="replyModify('+jsondata[i].rpno+')">';
					  code +='<input type="button" value="삭제" onclick="replyremove('+jsondata[i].rpno+')">';
					  code +="</form>"
				  }
		          document.querySelector('.reply'+cno).innerHTML=code;
		      }
		  }
	  }
		 
</script>

<%@ include file="../include/footer.jsp" %>

