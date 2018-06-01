package tdl.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import tdl.db.LoginCheck;
import tdl.form.UserForm;

public class LoginAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String btn = request.getParameter("gobtn");
		if (btn != null && btn.equals("Sign up")) {
			return mapping.findForward("gosignup");
		}

		UserForm user = (UserForm) form;

		LoginCheck check = new LoginCheck();
		UserForm login = check.checkUserid(user, getDataSource(request));

		if (login.getUid() == 0) {
			ActionMessages errors = new ActionMessages();
            errors.add("not_user", new ActionMessage("tdl.not.user"));
            saveErrors(request, errors);
            return mapping.findForward("gologin");
		}
		System.out.println("login action : "+login.toString());
		request.getSession().setAttribute("user", login);

		return mapping.findForward("gologin");
	}
}
