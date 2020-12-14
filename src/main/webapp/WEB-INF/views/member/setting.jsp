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
								<i class="fas fa-cog"></i>&nbsp;설정
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
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
				<ul class="product__deatils__tab" role="tablist">
					<li role="presentation" class="active"><a href="#profile" role="tab" data-toggle="tab" aria-expanded="true">프로필</a></li>
					<li role="presentation" class=""><a href="#account" role="tab" data-toggle="tab" aria-expanded="false">계정</a></li>
					<li role="presentation" class=""><a href="#payment" role="tab" data-toggle="tab" aria-expanded="false">결제수단</a></li>
					<li role="presentation" class=""><a href="#address" role="tab" data-toggle="tab" aria-expanded="false">배송지</a></li>
					<li role="presentation" class=""><a href="#notice" role="tab" data-toggle="tab" aria-expanded="false">알림</a></li>
				</ul>
			</div>
		</div>


		<div class="row" style="font-size: 1rem">
			<div class="col-md-12">


				<div class="product__details__tab__content">
					<!-- Start Single Content -->
					<div role="tabpanel" id="profile" class="product__tab__content fade in active">


						<div class="accordion" id="aco_profile">

							<div class="card">
								<div class="card-header" id="cre_img">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_img" aria-expanded="true" aria-controls="#creater_img">프로필 사진</button>
									</h2>
								</div>
								<div id="creater_img" class="collapse" aria-labelledby="cre_img" data-parent="#aco_profile">
									<div class="card-body">
										<div style="width: 30px; height: 30px; background-color: black; border-radius: 50%; display: inline-block;"></div>
										<input type="file" style="display: inline-block;" class="form-control-file" id="">
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_name">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_name" aria-expanded="true" aria-controls="#creater_name">이름</button>
									</h2>
								</div>
								<div id="creater_name" class="collapse" aria-labelledby="cre_name" data-parent="#aco_profile">
									<div class="card-body">

										<input class="form-control" type="text" placeholder="프로젝트 제목">
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_comment">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_comment" aria-expanded="true" aria-controls="#creater_comment">소개</button>
									</h2>
								</div>
								<div id="creater_comment" class="collapse" aria-labelledby="cre_comment" data-parent="#aco_profile">
									<div class="card-body">
										<textarea class="form-control" placeholder="프로젝트 요약을 입력해주세요" rows="2" style="width: 100%;"></textarea>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header" id="cre_site">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#creater_site" aria-expanded="true" aria-controls="#creater_site">웹사이트</button>
									</h2>
								</div>
								<div id="creater_site" class="collapse" aria-labelledby="cre_site" data-parent="#aco_profile">
									<div class="card-body">
										http://www.funhading.com/<input class="form-control" type="text" placeholder="url">
									</div>
								</div>
							</div>

						</div>
						<!-- 아코디언 -->


					</div>
					<!-- End Single Content -->

					<!-- Start Single Content -->
					<div role="tabpanel" id="account" class="product__tab__content fade">

						<div class="accordion" id="aco_account">

							<div class="card">
								<div class="card-header" id="acc_email">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_email" aria-expanded="true" aria-controls="#account_email">이메일</button>
									</h2>
								</div>
								<div id="account_email" class="collapse" aria-labelledby="#acc_email" data-parent="#aco_account">
									<div class="card-body">
										<input class="form-control" type="email" placeholder="이메일">
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="acc_pwd">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_pwd" aria-expanded="true" aria-controls="#account_pwd">비밀번호</button>
									</h2>
								</div>
								<div id="account_pwd" class="collapse" aria-labelledby="#acc_pwd" data-parent="#aco_account">
									<div class="card-body">
										<div >
											<div >
												<div >현재 비밀번호</div>
												<div>
													<span ><input class="form-control" type="password" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="현재 비밀번호" autocomplete="off" autocapitalize="off" value=""></span>
												</div>
												<div >
													비밀번호가 기억나지 않나요? <span ccolor="sub0180"><a href="/forgot-password">비밀번호 초기화</a></span>
												</div>
											</div>
											<div >
												<div>변경할 비밀번호</div>
												<div>
													<span ><input type="password" class="form-control" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
												</div>
												<div >
													<span ><input type="password" class="form-control" inputmode="password" pattern="[a-zA-Z0-9!@#$%^*_|]{6,20}" placeholder="변경할 비밀번호 확인" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 bnACyJ" value=""></span>
												</div>
											</div>
											<div >
												<button class="btn btn-primary">
													<span>저장</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="card">
								<div class="card-header" id="acc_phone">
									<h2 class="mb-0">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#account_phone" aria-expanded="true" aria-controls="#"account_phone">연락처</button>
									</h2>
								</div>
								<div id="account_phone" class="collapse" aria-labelledby="#acc_phone" data-parent="#aco_account">
									<div class="card-body">
										<input class="form-control" type="email" placeholder="연락처">
									</div>
								</div>
							</div>

						</div>
						<!-- 아코디언 -->
					</div>
					<!-- End Single Content -->

					<!-- Start Single Content -->
					<div role="tabpanel" id="payment" class="product__tab__content fade"></div>
					<!-- End Single Content -->


					<!-- Start Single Content -->
					<div role="tabpanel" id="address" class="product__tab__content fade"></div>
					<!-- End Single Content -->


					<!-- Start Single Content -->
					<div role="tabpanel" id="notice" class="product__tab__content fade"></div>
					<!-- End Single Content -->



				</div>
			</div>
		</div>

	</div>

</section>






<%@ include file="../include/footer.jsp"%>