//package interceptor;
//
////import net.sf.json.JSONObject;
//import net.sf.json.JSONObject;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * ��¼����������
// * @author llq
// *
// */
//public class LoginInterceptor implements HandlerInterceptor{
//
//	@Override
//	public void afterCompletion(HttpServletRequest arg0,
//			HttpServletResponse arg1, Object arg2, Exception arg3)
//			throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
//			Object arg2, ModelAndView arg3) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
//			Object arg2) throws Exception {
//		// TODO Auto-generated method stub
//		String url = request.getRequestURI();
//		//System.out.println("������������url = " + url);
//		Object user = request.getSession().getAttribute("user");
//		if(user == null){
//			//��ʾδ��¼���ߵ�¼״̬ʧЧ
//			System.out.println("δ��¼���¼ʧЧ��url = " + url);
//			if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
//				//ajax����
//				Map<String, String> ret = new HashMap<String, String>();
//				ret.put("type", "error");
//				ret.put("msg", "��¼״̬��ʧЧ��������ȥ��¼!");
//				response.getWriter().write(JSONObject.fromObject(ret).toString());
//				return false;
//			}
//			response.sendRedirect(request.getContextPath() + "/jsp/tologin");
//			return false;
//		}
//		return true;
//	}
//
//}
