package com.aic.paas.console.integration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aic.paas.frame.cross.bean.SysOp;
import com.aic.paas.frame.cross.peer.SysFramePeer;
import com.binary.framework.bean.User;
import com.binary.framework.util.ControllerUtils;
import com.binary.framework.web.SessionKey;
import com.binary.sso.client.SsoClientConfiguration;


@Controller
@RequestMapping("/authority")
public class AuthorityMvc {
	
			
	@Autowired
	SysFramePeer sysFramePeer;
	
	@Autowired
	SsoClientConfiguration ssoConfiguration;
	
	
	
	/**
	 * 验证是否登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/verifyLogin")
	public String verifyLogin(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
				
		//用户已登录
		if(user != null) {
//			//如果需要用户修改密码
//			if(Boolean.TRUE.equals(session.getAttribute(ErrorCode.LOGIN_UPDATE_PWD.toString()))) {
//				session.removeAttribute(ErrorCode.LOGIN_UPDATE_PWD.toString());
//				return "redirect:/uppwd.jsp";
//			}else {
//				return "redirect:"+ssoConfiguration.getNoBeforeUrl();
//			}
			return "redirect:"+ssoConfiguration.getNoBeforeUrl();
		}
		//用户未登录
		else {
			return "forward:/sso/client/auth/notLogin";
		}
	}
	
	
	
	
	
	
	/**
	 * 获取当前登录用户信息
	 * @return
	 */
	@RequestMapping("/getLoginUser")
	public void getLoginUser(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
			Long userId = user.getId();
			SysOp op = sysFramePeer.getOpById(userId);
			ControllerUtils.returnJson(request, response, op);
			return ;
		}
		ControllerUtils.returnJson(request, response, null);
	}
	
	
	
	
	/**
	 * 获取当前登录用户信息
	 * @return
	 */
	@RequestMapping("/getLoginOp")
	public void getLoginOp(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
			ControllerUtils.returnJson(request, response, user);
			return ;
		}
		ControllerUtils.returnJson(request, response, null);
	}
	
	
	
	/**
	 * 系统登录
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
		}catch(Exception e) {
		}
		
		String url = ssoConfiguration.getInvalidateSessionUrl("/index.jsp");
		
		return "redirect:"+url;
	}
	
	
	
	
	
	
}
