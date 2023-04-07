package roomie.common.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component("interceptor")
public class Interceptor implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
    
        System.out.println("session : "+  session.getAttribute("MEM_ID"));
        
        
        	if (session.getAttribute("MEM_ID") == null && request.getParameter("MEM_ID") == null ) {
        		//Controller 진입전 Interceptor 로 MEM_iD를 확인하여 값이 없으면 다시 로그인창으로 이동
        		//처음 login창으로 이동시 session, request 값은 없으므로 login.ya controller 는 interceptor에 제외되었고
        		//login성공시 넘어가는 session 값은 없으므로 request.getParameter 값으로 넘겨받는 MEM_ID 값의 유무를 확인하여
        		//MEM_ID 값이 있으면 그대로 진행(true) 없으면 login 창으로 재이동함
            	System.out.println("MEM_ID 값이 없어 로그인창으로 이동");
            	
            	//request.redirect()는 실행후 어떠한 이벤트도 발생할수 없기에 window.location.href 사용하여
            	//alert창을 먼저 띄우고 redirect 하는 로직임
            	HttpServletResponse responses = (HttpServletResponse) response;
            	  String script = "<script>alert('로그인을 해주세요.'); window.location.href='" + request.getContextPath() + "/login.ya" + "';</script>";
            	  response.setContentType("text/html;charset=UTF-8");
            	  PrintWriter out = responses.getWriter();
            	  out.print(script);
                return false;
            } else {
            	System.out.println("Interceptor 로그인 확인");
        	return true;
        }
	}
}
