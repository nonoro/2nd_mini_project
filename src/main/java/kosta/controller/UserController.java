package kosta.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.dto.OrderDTO;
import kosta.dto.UserDTO;
import kosta.service.UserService;
import kosta.service.UserServiceImpl;

public class UserController implements Controller {
	private static final Map<String, ModelAndView> MAP = new HashMap<>();

    static {
        MAP.put("2022", new ModelAndView("Adimin_sale_2022.jsp"));
        MAP.put("2021", new ModelAndView("Adimin_sale_2021.jsp"));
        MAP.put("2020", new ModelAndView("Adimin_sale_2020.jsp"));
    }
    private UserService userService = new UserServiceImpl();

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // TODO Auto-generated method stub
        return null;
    }
    /////////////////////////////////////////////////////////////////////////////////////

    public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ModelAndView mv = new ModelAndView("myPage.jsp" , false);
        return mv;
    }


    public ModelAndView update(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String dogName = request.getParameter("changedDogName");
        String dogBirthday = request.getParameter("changedDogBirthday");
        String email = request.getParameter("changedEmail");
        String phone = request.getParameter("changedPhone");
        String addr = request.getParameter("changedAddr");
        String pwd = request.getParameter("changedPwd");
        String profile = request.getParameter("changedProfile");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loginUser");


        UserDTO userDTO = null;

        if (profile.equals("") || profile == null) {
            System.out.println(11);
            userDTO = new UserDTO(userId, pwd, email, addr, phone, dogName, dogBirthday);
            userService.updateOfNoneProfile(userDTO);
        } else {
            System.out.println(22);
            userDTO = new UserDTO(userId, pwd, email, addr, phone, profile, dogName, dogBirthday);
            userService.update(userDTO);
            session.setAttribute("loginProfile", userDTO.getUserProfile());
        }



        session.setAttribute("loginDogName", userDTO.getDogName());
        session.setAttribute("loginDogBirthday", userDTO.getDogBirthday());
        session.setAttribute("loginEmail", userDTO.getUserEmail());
        session.setAttribute("loginPhone", userDTO.getUserPhone());
        session.setAttribute("loginAddr", userDTO.getUserAddr());
        session.setAttribute("loginUser", userDTO.getUserId());
        session.setAttribute("loginPwd", userDTO.getUserPwd());
        System.out.println("프로필사진이름 = " + session.getAttribute("loginProfile"));

        ModelAndView mv = new ModelAndView("front?key=user&methodName=myPage", true);

        return mv;
    }


    public ModelAndView updatePwd(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newPwd = request.getParameter("newPwd");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newPwd, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView updateAddr(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newAddr = request.getParameter("newAddr");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newAddr, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView updateEmail(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newEmail = request.getParameter("newEmail");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newEmail, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView updatePhone(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newPhone = request.getParameter("newPhone");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newPhone, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView updateDogName(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newDogName = request.getParameter("newDogName");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newDogName, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView updateDogBirthday(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String newDogBirthday = request.getParameter("newDogBirthday");

        UserDTO user = new UserDTO(userId, userPwd);

        userService.updatePwd(newDogBirthday, user);


        return new ModelAndView("jongmintest.jsp", true);
    }

    public ModelAndView selectPoint(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loginUser");

        UserDTO user = userService.selectPoint(userId);

        request.setAttribute("userPonint", user.getUserPoint());

        return new ModelAndView("jongmintest.jsp");
    }


    /////////////////////////////////////////////////////////////////////////////////////
    /*
     * MANAGEMENT
     */

    /**
    * 가입 회원수조회 및 회원정보 조회(-1은 관리자 아이디 제외)
    * SELECT COUNT(USER_ID)-1 FROM T_USER;
    */
   public ModelAndView userCount(HttpServletRequest request, HttpServletResponse response)

            throws Exception {
         int userCount = userService.userCount();
         List<UserDTO> userList = userService.selectAll();
         System.out.println(userCount);
         request.setAttribute("userCount", userCount);
         request.setAttribute("userList", userList);
         
         
         return new ModelAndView("Admin_userCount.jsp");
      }
    /**
     * 매출액조회(당월 매출)
     * SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '?/?/%';
     */
    public ModelAndView monthSalse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String year = request.getParameter("year");
        String month = request.getParameter("month");

        int monthSalse = userService.monthSalse(Integer.parseInt(year), Integer.parseInt(month));

        request.setAttribute("monthSalse", monthSalse);


        return new ModelAndView("jongmintest.jsp");
    }


    /**
     * 매출액조회(당해 매출)
     * SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER WHERE ORDER_DATE LIKE '?/%';
     */
    public ModelAndView yearSalse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String year = request.getParameter("year");

        List<OrderDTO> yearSalse = userService.yearSalse(Integer.parseInt(year));
        //System.out.println(yearSalse);
        request.setAttribute("yearSalse", yearSalse);


        return MAP.get(year);
    }


    /**
     * 매출액조회(전체 매출)
     * SELECT SUM(ORDER_TOTALPRICE) FROM T_ORDER;
     */
    public ModelAndView allSalse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        int allSalse = userService.allSalse();

        request.setAttribute("allSalse", allSalse);


        return new ModelAndView("jongmintest.jsp");
    }


    /**
     * 상태가 준비중인 상품 리스트업
     * SELECT * FROM T_ORDER WHERE ORDER_COMPLETE = 0;
     
    public ModelAndView readyProduct(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<OrderDTO> list = userService.readyProduct();

        request.setAttribute("readyProductList", list);

        return new ModelAndView("jongmintest.jsp");
    }
*/

    /**
     * 상태가 준비중인 상품의 ORDER_COMPLETE를 배송중으로 변경
     * UPDATE T_ORDRE SET ORDRE_COMPLETE=1 WHERE ORDER_CODE=?
     */
    public ModelAndView updateReady(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String orderCode = request.getParameter("orderCode");

        userService.updateReady(Integer.parseInt(orderCode));

        return new ModelAndView("jongmintest.jsp", true);
    }


}
