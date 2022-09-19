<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

		<section id="about" class="about mt-5">
			<div class="container mt-5" data-aos="fade-up">

				<div class="row position-relative">

					<div class="col-lg-7 about-img"
						style="background-image: url('${ path }/${ projectFileMap.sign.path }/${ projectFileMap.sign.saveName }');"></div>

					<div class="col-lg-5">
						<h3>icon ${ project.subjectName }</h3>
						<h2>${ project.title }</h2>
						<div class="our-story">
							<h4 class="text-center mb-5">
								<c:choose>
									<c:when test="${ project.startDDay > 0 }">
										<span class="fw-bold rounded-pill p-2 mt-2">모집 예정</span>
									</c:when>
									<c:when test="${ project.endDDay > 0 }">
										<span class="fw-bold rounded-pill p-2 mt-2"><c:out value="${ project.endDDay }일 남음"/></span>
									</c:when>
									<c:otherwise>
										<span class="fw-bold rounded-pill p-2 mt-2">모집 마감</span>
									</c:otherwise>
								</c:choose>
							</h4>
							
							<p class="ps-2 text-end">
								<fmt:formatNumber value="${ project.fundAmt }" pattern="#,###" /> 원 모집 | 
								<span class="fw-bold fs-5 me-2 primary-color"><c:out value="${ project.fundAmtPer }"/></span>
							</p>
							<div class="progress progress-bg-color2">
								<div class="progress-bar progress-bar-striped progress-bar-animated primary-bg-color progress-animation" role="progressbar" style="width: ${ project.fundAmtPer }" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
								<c:if test="${ project.fundAmt < project.minFundAmt }">
									<div class="progress-bar progress-bg-color1" role="progressbar" 
										style="width: ${ (project.minFundAmt / project.maxFundAmt - project.fundAmt / project.maxFundAmt) * 100  }%" aria-valuenow="${ project.fundAmtPer }" aria-valuemin="0" aria-valuemax="100"></div>
								</c:if>
							</div>
							<ul>
								<li>
									<i class="bi bi-circle-fill progress-color1"></i>
									<span><strong>최소 모집 금액</strong> | <fmt:formatNumber value="${ project.minFundAmt }" pattern="#,###" /> 원</span>
								</li>
								<li>
									<i class="bi bi-circle-fill progress-color2"></i>
									<span><strong>최대 모집 금액</strong> | <fmt:formatNumber value="${ project.maxFundAmt }" pattern="#,###" /> 원</span>
								</li>
							</ul>
							
							<h3>모집 기한</h3>
							<p>${ project.fundStart } ~ ${ project.fundEnd }</p>
							
							<h3>소개</h3>
							<p>${ project.summary }</p>

							<div class="row">
								
							</div>
							<div class="row text-center mt-3">
								<c:choose>
									<c:when test="${ project.startDDay > 0 }">
										<button type="button" class="btn btn-primary bg-white border text-dark auto" style="width:80%" > <i class="bi bi-bell"></i> 알림신청 </button>
									</c:when>
									<c:when test="${ project.endDDay > 0 }">
										<a href="${ path }/fund/${ project.projectSeq }" data-aos="fade-up" data-aos-delay="200" class="btn-fund-started aos-init aos-animate fw-bold">투자하기</a>
									</c:when>
								</c:choose>
								<a id="kakaotalk-sharing-btn" href="javascript:;" style="width:10%">
									<img
									  src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
									  alt="카카오톡 공유 보내기 버튼"
									/>
								</a>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>