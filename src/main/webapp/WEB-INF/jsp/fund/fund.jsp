<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>UpConstruction Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${ path }/resources/assets/img/favicon.png" rel="icon">
<link href="${ path }/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${ path }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ path }/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
<!-- Template Main CSS File -->
<link href="${ path }/resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: UpConstruction - v1.1.0
  * Template URL: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<!-- ======= Modal ======== -->
	<div class="modal" id="password-modal" style="display:none">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">????????? ?????? ???????????? ??????</h5>
					<button type="button" class="btn-close btn-modal-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<form name="transferForm" method="post" action="${ path }/fund/${ project.projectSeq }">
						<input type="hidden" name="amount">
						<input type="submit" id="transfer-form-submit-btn" style="display:none">
						
						<div class="text-center">
							<img style="width:50%" alt="password ?????????" src="${ path }/resources/assets/img/account/password.gif">
						</div>
						<div>
							<p>???????????? 4??????</p>
							<input class="col-lg-12 text-center" type="password" name="password" placeholder="4??????">
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn primary-button" onclick="transferFromSubmitBtnActive()">??????</button>
					</div>
			</div>
		</div>
	</div>
	<!-- End Modal -->
	
	<!-- ======= Header ======= -->
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<!-- End Header -->

	<main id="main">
		
		<!-- ======= fund-form Section ======= -->
		<section id="fund-form-section" class="fund-form-section">
			
			<div class="container" data-aos="fade-up" data-aos-delay="100">
				<div class="row justify-content-center">
					<div class="col-lg-6 mt-5">

						<!-- ???????????? -->
						<form class="fund-form" name="fundForm">
								
							<h5 class="fw-bold border-bottom border-3 mt-5">????????? ??????</h5>
							<p class="mt-3">?????????????????? : <fmt:formatNumber value="${ project.minFundUnit }" pattern="#,###" />???<br>
							?????????????????? : <fmt:formatNumber value="${ project.maxFundUnit }" pattern="#,###" />???</p>
							<p class="fw-bold text-end bg-light p-2 text-center">?????? ????????? : <fmt:formatNumber value="${ myAccount.balance }" pattern="#,###" /> ???</p>
							
							<div class="col-lg-12 form-group mt-3">
								<input type="text" name="amount" class="form-control text-end" style="display:none">
								<input type="text" id="amountShow" name="amountShow" class="form-control text-end" onchange="fundAmtCheck()" placeholder="?????????????????? ?????? ????????? ?????????????????? (???)">
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-3 form-group">
									<button type="button" class="primary-round-button"  onclick="fundAmountBtn(5)">5??????</button>
								</div>
								<div class="col-lg-3 form-group">
									<button type="button" class="primary-round-button" onclick="fundAmountBtn(10)">10??????</button>
								</div>
								<div class="col-lg-3 form-group">
									<button type="button" class="primary-round-button" onclick="fundAmountBtn(50)">50??????</button>
								</div>
								<div class="col-lg-3 form-group">
									<button type="reset" class="sacondary-round-button">??????</button>
								</div>
							</div>
							
							<h5 class="fw-bold border-bottom border-3 mt-5">?????? ??????</h5>
							
							<p class="mt-3">??????????????? : ${ project.title }<br>
							??????????????? : ${ project.securityExpire }</p>
							<br>
							
							<div class="row gy-4">
								<div class="col-lg-6 form-group">
									<p class="primary-color fw-bold">????????????</p>
								</div>
								<div class="col-lg-6 form-group text-end">
									<p class="primary-color" id="fundAmountCheck">0 ???</p>
								</div>
							</div>
							
							<h5 class="fw-bold border-bottom border-3 mt-5">????????????</h5>
							<div class="form-check my-3">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckAll" onclick="checkAll()">
								<label class="form-check-label" for="flexCheckDefault"> ?????? ?????? </label>
							</div>
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingOne">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="false" aria-controls="flush-collapseOne">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
												<label class="form-check-label" for="flexCheckDefault">(??????) ???????????? ?????????????????? ??????</label>
											</div>
										</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										aria-labelledby="flush-headingOne"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											Placeholder content for this accordion, which is intended to
											demonstrate the
											<code>.accordion-flush</code>
											class. This is the second item's accordion body. Let's imagine this
											being filled with some actual content.
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingTwo">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
												<label class="form-check-label" for="flexCheckDefault">(??????) ???????????? ???????????????????????? ??????</label>
											</div>
										</button>
									</h2>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										aria-labelledby="flush-headingTwo"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											Placeholder content for this accordion, which is intended to
											demonstrate the
											<code>.accordion-flush</code>
											class. This is the second item's accordion body. Let's imagine this
											being filled with some actual content.
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingThree">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
											aria-expanded="false" aria-controls="flush-collapseThree">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
												<label class="form-check-label" for="flexCheckDefault">(??????) ??????????????? ??????</label>
											</div>
										</button>
									</h2>
									<div id="flush-collapseThree" class="accordion-collapse collapse"
										aria-labelledby="flush-headingThree"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											Placeholder content for this accordion, which is intended to
											demonstrate the
											<code>.accordion-flush</code>
											class. This is the third item's accordion body. Nothing more exciting
											happening here in terms of content, but just filling up the space to
											make it look, at least at first glance, a bit more representative of
											how this would look in a real-world application.
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="flush-headingFour">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
											aria-expanded="false" aria-controls="flush-collapseThree">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
												<label class="form-check-label" for="flexCheckDefault">(??????) ???????????? ??? ???????????? ??????</label>
											</div>
										</button>
									</h2>
									<div id="flush-collapseFour" class="accordion-collapse collapse"
										aria-labelledby="flush-headingFour"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											Placeholder content for this accordion, which is intended to
											demonstrate the
											<code>.accordion-flush</code>
											class. This is the third item's accordion body. Nothing more exciting
											happening here in terms of content, but just filling up the space to
											make it look, at least at first glance, a bit more representative of
											how this would look in a real-world application.
										</div>
									</div>
								</div>
							</div>
							<h5 class="fw-bold border-bottom border-3 mt-5">????????????</h5>
							<div class="row gy-4">
								<div class="col-lg-9 form-group">
									<input class="form-control bg-light" type="text" name="phone" value="01026093796" readonly="readonly">
								</div>
								<div class="col-lg-3 form-group text-end">
									<button type="button" style="width:100%" onclick="javascript:authMessage();">????????????</button>
								</div>
							</div>
							<div class="row gy-4">
								<div class="col-lg-9 form-group">
									<input class="form-control" type="text" placeholder="???????????? ??????" name="authNum">
								</div>
								<div class="col-lg-3 form-group text-end">
									<button type="button" style="width:100%" onclick="javascript:authCheck();">??????</button>
								</div>
							</div>
							
							<div class="row gy-4">
								<div class="col-lg-12 form-group text-center" id="resultMessage"></div>
							</div>
							
							<div class="text-center mt-5">
								<button type="button" class="primary-round-button fw-bold" name="fundSubmitBtn" type="button" onclick="gotoPasswordModal()"> ???????????? </button>
							</div>
						</form>
						
					</div>
					<!-- End Submit Form -->
				</div>
			</div>
		</section>
		<!-- End Submit Section -->
		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="${ path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/aos/aos.js"></script>
	<script src="${ path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ path }/resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${ path }/resources/assets/js/main.js"></script>
	
	<!-- My javascript -->
	<script src="${ path }/resources/assets/js/jquery-3.6.1.min.js"></script>
	<script>
		function checkAll () {
			let checkInputs = document.getElementsByClassName('form-check-input');
			let bool = checkInputs[0].checked;
			for(let i = 1; i<checkInputs.length; i++){
				checkInputs[i].checked = bool;
			}
		}
		
		function fundAmountBtn(val) {
			let amountInput = document.fundForm.amount;
			let amountShowInput = document.fundForm.amountShow;
			let fundAmountCheckP = document.getElementById('fundAmountCheck');
			
			amountInput.value = Number(amountInput.value) + val * 10000;
			let value = putComa(String(Number(amountShowInput.value.replace(',', '')) + val * 10000));
			amountShowInput.value = value;
			fundAmountCheckP.innerHTML = value + ' ???';
			
		}
		
		function gotoPasswordModal() {
			modalShow('password-modal');
			let amount = document.fundForm.amount.value;
			document.transferForm.amount.value = amount;
		}
		
		function transferFromSubmitBtnActive(){
			document.getElementById('transfer-form-submit-btn').click();
		}
		
		
		// modal ?????? ??????
		function modalShow(modalName) {
			let modal = document.getElementById(modalName);
			modal.style.display = "block";
		}
		
		function modalHidden(modalName) {
			let modal = document.getElementById(modalName);
			modal.style.display = "none";
		}
		
		const modal = document.getElementsByClassName("modal")
        function modalOn() {
            modal[0].style.display = "flex"
        }
        function isModalOn() {
            return modal[0].style.display === "flex"
        }
        function modalOff() {
            modal[0].style.display = "none"
        }
        
        const closeBtns = document.getElementsByClassName("btn-modal-close");
        for (const closeBtn of closeBtns) {
        	closeBtn.addEventListener('click', function onClick() {
        		modalOff();
			});
		}
        
        function putComa(val){
        	return val.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        }
        
        function authMessage() {
			let telnum = document.fundForm.phone.value;
			let json = { 
		        			'tel' : telnum.toString()
			        	}
			
			$.ajax({

				url : '${ path }/auth',
				method : 'post',
				data : JSON.stringify(json),
				contentType: "application/json",
				success : function() {
					console.log('??????');
				},
				error : function() {
					alert('??????');
				}
			})
		}
        
        function authCheck() {
			let authNum = document.fundForm.authNum.value;
			let json = { 
		        			'authNum' : authNum.toString()
			        	}
			
			$.ajax({

				url : '${ path }/auth/check',
				method : 'post',
				data : JSON.stringify(json),
				dataType: 'text',
				contentType: "application/json",
				success : function() {
					console.log('??????');
					let resultMessage = document.getElementById('resultMessage');
					resultMessage.innerHTML = `<span class="text-primary">?????????????????????.</span>`;
					document.fundForm.authNum.readOnly = 'ture';
					document.fundForm.authNum.className += ' bg-light ';
					
				},
				error : function() {
					alert('??????');
					let resultMessage = document.getElementById('resultMessage');
					resultMessage.innerHTML = `<span class="text-danger">????????? ?????????????????????.</span>`;
				}
			})
		}
        
	</script>
</body>

</html>