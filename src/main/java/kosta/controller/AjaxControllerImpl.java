package kosta.controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kosta.dto.UserDTO;
import kosta.service.UserService;
import kosta.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AjaxControllerImpl implements AjaxController {

    UserService userService = new UserServiceImpl();

    @Override
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void join(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String saveDir = request.getServletContext().getRealPath("/save");
        int maxSize = 1024 * 1024 * 100;
        String encoding = "UTF-8";

        //		<!--업로드할땐 무조건 form태그에 enctype="multipart/form-data 여야 하고 서블릿에서 무조건 request로 받는게아닌 MultiPartRequest로 받아야됨-->
        MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

        String userAddr = "";
        //전송된 데이터 받기
        String userId = m.getParameter("id");
        String userPwd = m.getParameter("pwd");
        String userEmail = m.getParameter("email");

        String addr = m.getParameter("addr");
        String addrDetail = m.getParameter("addrDetail");

        userAddr = addr + " " + addrDetail;
        String userPhone = m.getParameter("phone");
        String userProfile = m.getFilesystemName("profile");
        String dogName = m.getParameter("dogName");
        String dogBirthday = m.getParameter("dogBirthday");

        System.out.println(userAddr);
        System.out.println(userProfile);


        UserDTO user = new UserDTO(userId, userPwd, userEmail, userAddr, userPhone, userProfile, dogName, dogBirthday, 0);

        userService.join(user);

        PrintWriter out = response.getWriter();
        out.println("회원가입 성공!");

    }

    /**
     * 아디중복체크
     */
    public void idCheck(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");

        boolean result = userService.idCheck(id);


        PrintWriter out = response.getWriter();

        if (result) {
            out.println("중복입니다.");
        } else {
            out.println("사용가능합니다.");
        }

    }

}
