package kosta.mvc.down;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/downLoad")
public class DownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 넘어오는 파일의 이름을 받기
		String fName = request.getParameter("fileName");


		//2. 저장폴더의 실제 경로를 얻어오기
		String saveDir="/Users/nonoro/Servlet/test_2nd/src/main/webapp/save";
		File file = new File(saveDir, fName); //다운로드할 파일객체 생성

		//부가적인 옵션!!!
		//요청된 파일의 mimeType을 설정한다(문서의 형태설정)
		String mimeType = getServletContext().getMimeType(file.toString());
		System.out.println("mimeType : " + mimeType);

		if(mimeType==null){//문서의 형태를 알수 없다면
			response.setContentType("application/octet-stream");
		}

		//브라우져 별 파일이름에대한 한글인코딩설정
		if (request.getHeader("user-agent").indexOf("Trident") == -1) {// IE가 아닌경우
			System.out.println(1);
			fName = new String(file.getName().getBytes("UTF-8"), "8859_1");
		} else {
			System.out.println(2);
			fName = new String(file.getName().getBytes("euc-kr"), "8859_1");
		}

		//브라우져가 해석할수 있는 파일을 해석하지 않고 다운로드!!!
		response.setHeader("Content-Disposition", "attachment;filename=\""+ fName + "\";");


		//3. 폴더에서 파일이름에 해당하는 파일을 읽어서
		//클라이언트 브라우져에서 다운로드(출력=쓰기)

		FileInputStream  fi = new FileInputStream(file);
		ServletOutputStream so = response.getOutputStream();//클라이언트쪽으로 내려보낼(다운로드) 출력(저장) 준비

		byte b [] = new byte [1024];

		int i=0;
		while((i = fi.read(b) ) != -1){
			so.write(b);
		}

		so.flush();
		fi.close();
		so.close();

	}

}






