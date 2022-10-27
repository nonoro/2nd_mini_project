package kosta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.dto.ProductDTO;
import kosta.service.ProductService;
import kosta.service.ProductServiceImpl;
import net.sf.json.JSONArray;
//아ㅏㅈㄱ스 하고싶은메소드만 
public class ProductAjaxController implements AjaxController {
	private ProductService prodService=new ProductServiceImpl();
	@Override
	public void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	public void selectByarrange(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String arrange = request.getParameter("arrange");
		  
		   if(Integer.parseInt(arrange)==1) {
		      arrange = " order by ordercount desc";
		   }else if(Integer.parseInt(arrange)==2) {
		      arrange = " order by reviewcount desc";
		   }else{
		      arrange = " order by star_avg desc";
		   }
		   System.out.println(arrange);
		   List<ProductDTO> selectByarrange = prodService.selectByarrange(arrange);
		   
		//request.setAttribute("selectByarrange", selectByarrange);
		//아작스는 
		   JSONArray arr = JSONArray.fromObject(selectByarrange);
		      
		      PrintWriter out = response.getWriter();
		      out.print(arr);
	}

}
