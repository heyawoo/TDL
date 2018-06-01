package tdl.form;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	String loginPath = "/pages/Login.jsp";

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = (HttpSession) req.getSession();

		String url = req.getRequestURI();
		UserForm info = (UserForm)session.getAttribute("user");
		ArrayList<String> avoid_urls = mkAvoidList();



		for (String avoid : avoid_urls) {
			if (url.endsWith(avoid)) {
//				System.out.println("avoid url "+url);
				chain.doFilter(req, res);
	        	return;
			}
		}

		if(session == null || info == null){
//			System.out.println("redirect to login rul " +url);
			res.sendRedirect(req.getContextPath() + loginPath);
			return;
		}

		chain.doFilter(req, res);
		return;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	public ArrayList<String> mkAvoidList(){
		ArrayList<String> list = new ArrayList<>();

		list.add("Login.jsp");
		list.add("Main.jsp");
		list.add("Signup.jsp");
		list.add("signup.do");
		list.add("signupcheck.do");
		list.add("login.do");
		list.add(".js");
		list.add(".png");
		list.add(".css");

		return list;
	}

}
