package kosta.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.ReviewDTO;
import kosta.controller.ModelAndView;
import kosta.service.ProductService;
import kosta.service.ProductServiceImpl;
import kosta.service.ReviewService;
import kosta.service.ReviewServiceImpl;

public class ReviewController implements Controller{
	private ReviewService reviewService = new ReviewServiceImpl();
	private ProductService productService = new ProductServiceImpl();
		
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
		String userId = m.getParameter("userId");
		String productName = m.getParameter("productName");
		int productCode = productService.selectByProductName(productName).getProductCode();
		String reviewGrade = m.getParameter("reviewStar");
		String reviewDetail = m.getParameter("reviewDetail");
		String reviewPostdate = m.getParameter("reviewPostdate");
		String reviewFile = m.getParameter("file");
		String dogName=m.getParameter("dogName");
		System.out.println("userId = "+userId);
		System.out.println("productCode = "+productCode);
		System.out.println("productName = "+productName);
		System.out.println("reviewGrade = "+reviewGrade);
		System.out.println("reviewDetail = "+reviewDetail);
		System.out.println("reviewFile = "+reviewFile);
		
		ReviewDTO review = new ReviewDTO
				(0, userId, productCode, Integer.parseInt(reviewGrade), reviewDetail, new Date().toString(),reviewFile,dogName, productName);
		
		//만약, 파일첨부가 되었다면....
		if(m.getFilesystemName("file") != null) {
			//파일이름저장
			review.setReviewFile(m.getFilesystemName("file"));
		}
		reviewService.insert(review);
		
		
		return new ModelAndView("myPage.jsp",true);
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
		for(ReviewDTO i : list) {
			System.out.println("d1111asd"+i.getReviewFile()) ;
		}
		int avrGrade = reviewService.selectAvrGrade(Integer.parseInt(productCode));
		
		request.setAttribute("list", list);
		request.setAttribute("avrGrade", avrGrade);
		request.setAttribute("pageNo", pageNo);
		
		return new ModelAndView("product_detail_test.jsp");
	}
	
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String reviewCode = request.getParameter("reviewCode");
		String userId = request.getParameter("userId");
		String reviewGrade = request.getParameter("reviewStar");
		String reviewDetail = request.getParameter("reviewDetail");
		System.out.println("reviewCode = "+reviewCode);
		System.out.println("userId = "+userId);
		System.out.println("reviewGrade = "+ reviewGrade);
		System.out.println("reviewDetail = "+ reviewDetail);
		
		ReviewDTO review = new ReviewDTO(Integer.parseInt(reviewCode), userId, 0, Integer.parseInt(reviewGrade), reviewDetail, null, null, null, null);
		
		reviewService.update(review);
		
		
		return new ModelAndView("myPage.jsp", true);
	}
	
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String reviewCode = request.getParameter("reviewCode");
		String saveDir = request.getServletContext().getRealPath("/save");
		
		reviewService.delete(Integer.parseInt(reviewCode), saveDir);
		
		
		return new ModelAndView("myPage.jsp",true);
	}
	
	public ModelAndView selectByCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String reviewCode = request.getParameter("reviewCode");
		
		ReviewDTO review = reviewService.selectByCode(Integer.parseInt(reviewCode));
		
		request.setAttribute("reviewByCode", review);
		
		return new ModelAndView("review_update_test.jsp");
	}
	
	public ModelAndView selectByUserId(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String userId = request.getParameter("userId");
		
		List<ReviewDTO> myReviewList = reviewService.selectByUserId(userId);
		System.out.println(myReviewList);
		
		request.setAttribute("myReviewList", myReviewList);
		return new ModelAndView("myReview.jsp");
	}

}
