package kosta.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/*@WebFilter("/front")*/
public class SessionCheckFilter implements Filter {
    public SessionCheckFilter() {
        System.out.println("SessionCheckFilter입니다");
    }

    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("SessionCheckFilter입니다");

        // 사전처리 -> 인증여부를 체크한다.
        String key = request.getParameter("key");
        if (key == null || key.equals("user") || key.equals("board") || key.equals("order") || key.equals("cart")) {
            // 인증된 사용자만 해라... 그래서 확인하기위해 UserController에서 loginUser, loginName을 세션에 저장해놨엇음
            // 여기서 인수로 있는 request는 부모타입이라 세션을 얻기위해 다운캐스팅 해줘야됨
            HttpServletRequest req = (HttpServletRequest) request;
            HttpSession session = req.getSession();
            if (session.getAttribute("loginUser") == null) {
                req.setAttribute("errorMsg", "로그인하고 이용해주세요!!");
                req.getRequestDispatcher("error/error.jsp").forward(request, response);
                return; // 사전처리만 하고 여길 나가야되기 때문에 꼭 return을 해줘야됨
            }
        }
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}
