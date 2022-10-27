package kosta.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosta.dto.ProductDTO;
import kosta.dto.ReviewDTO;
import kosta.service.ProductService;
import kosta.service.ProductServiceImpl;
import kosta.service.ReviewService;
import kosta.service.ReviewServiceImpl;


public class ProductController implements Controller {
	
	private ProductService prodService = new ProductServiceImpl();
	private ReviewService reviewService = new ReviewServiceImpl();
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return null;
		
	}

	/**
	 * 상품 전체검색
	 * */
	public ModelAndView selectAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List<ProductDTO> selectAll = prodService.selectAll();
		request.setAttribute("list", selectAll);//뷰에서 ${list}
		
		return new ModelAndView("product.jsp");  //forward방식으로 이동
	}
	
	
	/**
	 * 상품코드에 해당하는 레코드 검색
	 * 
	 * */
	public ModelAndView selectByProductCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {                              
		String productCode=request.getParameter("productCode") ;
		System.out.println(productCode);
		ProductDTO selectByCode =prodService.selectByProductCode(Integer.parseInt(productCode));
		
		request.setAttribute("selectByCode", selectByCode);

		return new ModelAndView("product_detail.jsp");
	}
	
	/**
	 * 상품이름에 해당하는 레코드 검색
	 * */
	public ModelAndView selectByProductName(HttpServletRequest request, HttpServletResponse response)
			throws Exception { 
		String pageNo = request.getParameter("pageNo");
	      if(pageNo==null || pageNo.equals("")) {
	         pageNo="1";
	      }
	      
	      String productName=request.getParameter("productName") ;
			ProductDTO selectByName =prodService.selectByProductName(productName);
			

			request.setAttribute("selectByName", selectByName);
			
	      String userId = request.getParameter("userId");
	      String productCode = request.getParameter("productCode");
	      
	      ReviewDTO review = new ReviewDTO();
	      review.setUserId(userId);
	      review.setProductCode(Integer.parseInt(productCode));
	      
	     
			
			
	      List<ReviewDTO> list = reviewService.selectAll(review);//pageNo넣어야함?
	      
	      request.setAttribute("list", list);
	      request.setAttribute("pageNo", pageNo);

		request.setAttribute("selectByName", selectByName);

		return new ModelAndView("product_detail_test.jsp");

	}
	
	/**
	 * 상품 등록하기
	 * */
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 상품등록.jsp 에서  enctype="multipart/form-data" 설정되어 있다면 request아닌 MultipartRequest로 처리한다. - cos.jar
				String saveDir = request.getServletContext().getRealPath("/save"); //
				int maxSize=1024*1024*100; //100M
				String encoding="UTF-8";
		MultipartRequest m= 
				new MultipartRequest(request, saveDir, maxSize,encoding, new DefaultFileRenamePolicy());
		//전송데이터 받기 
		String ProductCode=m.getParameter("productCode"); //아직 등록페이지 없음
		String ProductCategory=m.getParameter("productCategory");
		String ProductName=m.getParameter("productName");
		String ProductPrice=m.getParameter("productPrice");
		String ProductQty=m.getParameter("productQty");
		String ProductExplain=m.getParameter("productExplain");
		String fname=m.getParameter("fname");
		//받은값넣깅
		ProductDTO product= new ProductDTO(Integer.parseInt(ProductCode), Integer.parseInt(ProductCategory), ProductName, Integer.parseInt(ProductPrice), Integer.parseInt(ProductQty), ProductExplain,null);
				
		if(m.getFilesystemName("file") != null) {
			//파일이름저장
			product.setFname(m.getFilesystemName("file"));
			
			prodService.insert(product);
		}
		return new ModelAndView("testForKyu.jsp", true);
		
	}
	
	/**
	 * 상품 삭제하기 
	 * */
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String productCode=request.getParameter("productcode");
		String loginPwd=request.getParameter("loginPwd");
		
		//첨부된다면 상품이 삭제 되었을때 첨부파일도 삭제 하는기능 
		String saveDir=request.getServletContext().getRealPath("/save");
		prodService.delete(Integer.parseInt(productCode),loginPwd,saveDir);
		
		return new ModelAndView("testForKyu.jsp", true);
	}
	
	/**
	 * 상품 수정하기 
	 * */
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//수정할 정보 받아오기 
		String productCode=request.getParameter("productCode");
		String productName=request.getParameter("productName");
		String productPrice=request.getParameter("productPrice");
		String productQty=request.getParameter("productQty");
		String productExplain=request.getParameter("productExplain");
		
		//페이징처리 자리 
		String pageNo = request.getParameter("pageNo");
				
		prodService.update(new ProductDTO(Integer.parseInt(productCode),productName, Integer.parseInt(productPrice), Integer.parseInt(productQty), productExplain));
		
		//ModelAndView mv= new ModelAndView();
		//mv.setViewName("");
		//mv.setRedirect(true);
		
		return new ModelAndView("testForKyu.jsp", true);
	}
	/**
	 * 상품 코드별 판매통계 조회 월별
	 */
	public ModelAndView monthlySalesByCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//값받아오기 
		String productCode=request.getParameter("productCode");
		String orderDate=request.getParameter("orderDate");
		
		int monthlyTotal=prodService.monthlySalesByCode(Integer.parseInt(productCode), orderDate);
		
		request.setAttribute("monthlyTotal", monthlyTotal); 
		
		return new ModelAndView("testForKyu.jsp");
		
	}
	
	/**
	 * 상품 코드별 판매통계 조회 년별
	 */
	public ModelAndView yearlySalesByCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//값받아오기 
				String productCode=request.getParameter("productCode");
				String orderDate=request.getParameter("orderDate");
				
				int yearlyTotal=prodService.monthlySalesByCode(Integer.parseInt(productCode), orderDate);
				
				request.setAttribute("yearlyTotal", yearlyTotal); 
				
				return new ModelAndView("testForKyu.jsp");
		
	}
	
	/**
	 * 상위카테고리별 
	 * */
	public ModelAndView productSelectByCategorytop(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String productCategory=request.getParameter("productCategory");
		
		List<ProductDTO> cateList=prodService.productSelectByCategorytop(Integer.parseInt(productCategory));
		request.setAttribute("cateList", cateList);
		
		return new ModelAndView("testForKyu.jsp");
		
	}
	
	/**
	 * 하위카테고리별 
	 * */
	public ModelAndView productSelectByCategorybottom(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String productCategory=request.getParameter("productCategory");
		
		List<ProductDTO> cateBottomList=prodService.productSelectByCategorytop(Integer.parseInt(productCategory));
		request.setAttribute("cateList2", cateBottomList);
		
		return new ModelAndView("testForKyu.jsp");
		
	}
	
	/**
	 *  정렬 
	 * */
	public ModelAndView selectByarrange(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String arrange = request.getParameter("arrange");
		  
		   if(Integer.parseInt(arrange)==1) {
		      arrange = "order by ordercount desc";
		   }else if(Integer.parseInt(arrange)==2) {
		      arrange = "order by reviewcount desc";
		   }else{
		      arrange = "order by star_avg desc";
		   }
		   System.out.println(arrange);
		   List<ProductDTO> selectByarrange = prodService.selectByarrange(arrange);
	
		request.setAttribute("selectByarrange", selectByarrange);
		
		return new ModelAndView("product_arrange.jsp");
		
	}
	
	
}