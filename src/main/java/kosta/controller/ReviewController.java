package kosta.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.ReviewDTO;
import kosta.controller.ModelAndView;
import kosta.service.ReviewService;
import kosta.service.ReviewServiceImpl;

public class ReviewController implements Controller{
	private ReviewService reviewService = new ReviewServiceImpl();
		
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//폼에서 enctype="multipart/form-data" 설정되어 있기 때문에 request가 아닌 MultipartRequest로
		String saveDir=request.getServletContext().getRealPath("/save"); //C:/Edu
		int maxSize=1024*1024*100;//100Mb
		String encoding="UTF-8";

		MultipartRequest m = 
				new MultipartRequest(request,saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//전송된 데이터 받기
		String reviewCode = m.getParameter("reviewCode");
		String userId = m.getParameter("userId");
		String productCode = m.getParameter("productCode");
		String reviewGrade = m.getParameter("reviewGrade");
		String reviewDetail = m.getParameter("reviewDetail");
		String reviewPostdate = m.getParameter("reviewPostdate");
		String reviewFile = m.getParameter("reviewFile");
		
		ReviewDTO review = new ReviewDTO
				(Integer.parseInt(reviewCode), userId, Integer.parseInt(productCode), Integer.parseInt(reviewGrade), reviewDetail, new Date().toString(),null);
		
		//만약, 파일첨부가 되었다면....
		if(m.getFilesystemName("file") != null) {
			//파일이름저장
			review.setReviewFile(m.getFilesystemName("file"));
		}
		reviewService.insert(review);
		
		
		return new ModelAndView("jongmintest.jsp",true);
	}
	
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String pageNo = request.getParameter("pageNo");
		if(pageNo==null || pageNo.equals("")) {
			pageNo="1";
		}
		String userId = request.getParameter("userId");
		String productCode = request.getParameter("productCode");
		
		ReviewDTO review = new ReviewDTO();
		review.setUserId(userId);
		review.setProductCode(Integer.parseInt(productCode));
		
		List<ReviewDTO> list = reviewService.selectAll(review);//pageNo넣어야함?
		
		request.setAttribute("list", list);
		request.setAttribute("pageNo", pageNo);
		
		return new ModelAndView("product_detail_test.jsp");
	}
	
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String reviewCode = request.getParameter("reviewCode");
		String userId = request.getParameter("userId");
		String reviewGrade = request.getParameter("reviewGrade");
		String reviewDetail = request.getParameter("reviewDetail");
		
		ReviewDTO review = new ReviewDTO(Integer.parseInt(reviewCode), userId, 0, Integer.parseInt(reviewGrade), reviewDetail, null, null);
		
		reviewService.update(review);
		
		
		return new ModelAndView("jongmintest.jsp", true);
	}
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String reviewCode = request.getParameter("reviewCode");
		String saveDir = request.getServletContext().getRealPath("/save");
		
		reviewService.delete(Integer.parseInt(reviewCode), saveDir);
		
		
		return new ModelAndView("jongmintest.jsp",true);
	}

}
