package kosta.controller;

import kosta.dto.UserDTO;
import kosta.service.UserService;
import kosta.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginController implements Controller {
    private UserService userService = new UserServiceImpl();

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return null;
    }

    public ModelAndView login(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //두개의 전송되는 값을 받는다.
        String id = request.getParameter("userId");
        String pwd = request.getParameter("pwd");
//        String message = "ㅅㅊ";
        //서비스 호출
        UserDTO user = userService.login(new UserDTO(id, pwd));
//        PointDTO pointCheck = userService.birthdayCheck(user.getUserId());
//        if (pointCheck == null) {
//            message = userService.birthdayPoint(user);
//            userService.insertBirthday(user);
//        }

        //로그인 성공하면 세션에 정보를 저장  - ${loginUser} / ${loginName}
        HttpSession session = request.getSession();
        session.setAttribute("loginDogName", user.getDogName());
        session.setAttribute("loginDogBirthday", user.getDogBirthday());
        session.setAttribute("loginEmail", user.getUserEmail());
        session.setAttribute("loginPhone", user.getUserPhone());
        session.setAttribute("loginAddr", user.getUserAddr());
        session.setAttribute("loginPoint", user.getUserPoint());
        session.setAttribute("loginProfile", user.getUserProfile());
        session.setAttribute("loginUser", user.getUserId());
        session.setAttribute("loginPwd", user.getUserPwd());

//        request.setAttribute("message", message);

        ModelAndView mv = new ModelAndView("index.jsp");
        return mv;
    }

    public ModelAndView searchId(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userPhone = request.getParameter("userPhone");
        String userEmail = request.getParameter("userEmail");

        UserDTO user = new UserDTO();
        user.setUserPhone(userPhone);
        user.setUserEmail(userEmail);

        String searchId = userService.searchId(user);
        request.setAttribute("searchId", searchId);


        return new ModelAndView("jongmintest.jsp");
    }

    public ModelAndView searchPwd(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPhone = request.getParameter("userPhone");
        String userEmail = request.getParameter("userEmail");

        UserDTO user = new UserDTO();
        user.setUserId(userId);
        user.setUserPhone(userPhone);
        user.setUserEmail(userEmail);

        String searchPwd = userService.searchPwd(user);
        request.setAttribute("searchPwd", searchPwd);


        return new ModelAndView("jongmintest.jsp");
    }

    /**
     * 로그아웃
     */
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        //모든세션의 정보를 삭제
        request.getSession().invalidate();

        return new ModelAndView("index.jsp", true);
    }

}
