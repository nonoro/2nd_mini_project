package kosta.down;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/downLoad")
public class DownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. �Ѿ���� ������ �̸��� �ޱ�
		String fName = request.getParameter("fname");
		
		//2. ���������� ���� ��θ� ������
		String saveDir=request.getServletContext().getRealPath("/save");
		File file = new File(saveDir, fName);
		
		//�ΰ����� �ɼ�!!!
		//��û�� ������ mimeType�� �����Ѵ�(������ ���¼���)
		String mimeType = getServletContext().getMimeType(file.toString());
		
		if(mimeType==null){
			response.setContentType("application/octet-stream");
		}
		
		System.out.println("mimeType = " + mimeType);
		
		
		//������ �� �����̸������� �ѱ����ڵ�����
		if (request.getHeader("user-agent").indexOf("Trident") == -1) {// IE�� �ƴѰ��
			System.out.println(1);
			fName = new String(file.getName().getBytes("UTF-8"), "8859_1");
		} else {
			System.out.println(2);
			fName = new String(file.getName().getBytes("euc-kr"), "8859_1");
		}
		
		//�������� �ؼ��Ҽ� �ִ� ������ �ؼ����� �ʰ� �ٿ�ε�!!!
		response.setHeader("Content-Disposition", "attachment;filename=\""+ fName + "\";");
				
		//3. �������� �����̸��� �ش��ϴ� ������ �о 
		//Ŭ���̾�Ʈ ���������� �ٿ�ε�(���=����)

		FileInputStream  fi = new FileInputStream(file);
		ServletOutputStream so = response.getOutputStream();
		
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






