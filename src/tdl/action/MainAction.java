package tdl.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MainAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String btn = request.getParameter("btn");

		if (btn.equals("LOGOUT")) {
			return mapping.findForward("logout");
		}

		request.getSession();

		return mapping.findForward("gologin");
	}
}
