<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<!-- 상단 안내 -->
<section>
	<div class="ht__bradcaump__area" style="padding-bottom:-50px; background: rgba(0, 0, 0, 0) url(<%=request.getContextPath()%>/resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
		<div class="ht__bradcaump__wrap">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="bradcaump__inner text-center">
							<h2 class="bradcaump-title">
								<i class="fab fa-product-hunt"></i>&nbsp;내가 만든 프로젝트
							</h2>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>

<section>
	<div class="container">
		<h2 class="mt--30">
			<strong>작성중</strong>
		</h2>


		<div class="" style="min-height: 500px; padding: 50px;">

			<table class="table">
				<tr>
					<td style="width:30%"><img src="<%=request.getContextPath()%>/resources/images/product/sm-img/4.png" /></td>
					<td style="width:50%"><div class="col-8">최준영의 프로젝트 </div></td>
					<td style="width:20%"><button>수정</button>
						<button>삭제</button></td>
				</tr>
			</table>

		</div>
	</div>

</section>






<%@ include file="../include/footer.jsp"%>