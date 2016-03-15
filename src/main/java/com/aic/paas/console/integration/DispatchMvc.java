package com.aic.paas.console.integration;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aic.paas.frame.cross.bean.ModuInfo;
import com.aic.paas.frame.cross.bean.SysModu;
import com.aic.paas.frame.util.RequestKey;
import com.aic.paas.frame.util.SysFrameUtil;
import com.binary.core.util.BinaryUtils;
import com.binary.framework.bean.User;
import com.binary.framework.exception.ServiceException;
import com.binary.framework.util.ControllerUtils;
import com.binary.framework.web.SessionKey;


@Controller
@RequestMapping("/dispatch")
public class DispatchMvc {
	
	
	private final Pattern NUM_REGX = Pattern.compile("[0-9]+");
	
	
	@Value("${integration.csys.root}")
	String csysRoot;
		
	
	@Value("${integration.cdev.root}")
	String cdevRoot;
	
	
	@Value("${integration.cdep.root}")
	String cdepRoot;
	
	
	
	
	@RequestMapping("/mi/**")
	public String openModuById(HttpServletRequest request, HttpServletResponse response) {
		String url = request.getRequestURI();
		int idx = url.indexOf("/mi/");
		if(idx < 0) throw new ServiceException(" is wrong url '"+url+"'! ");
		String id = url.substring(idx+4).trim();
		
		if(!NUM_REGX.matcher(id).matches()) {
			throw new ServiceException(" is wrong url '"+url+"'! ");
		}
		
		SysModu modu = SysFrameUtil.getModuById(Long.valueOf(id));
		if(modu == null) {
			throw new ServiceException(" not found modu by id '"+id+"'! ");
		}
		
		String mp = modu.getModuParam();
		if(!BinaryUtils.isEmpty(mp)) {
			return forwardParam(request, response, modu, mp);
		}else {
			return "forward:/sys/frame/cross/modu/openModuleById?moduleId="+id;
		}
	}
	
	
	
	
	@RequestMapping("/mc/**")
	public String openModuByCode(HttpServletRequest request, HttpServletResponse response) {
		String url = request.getRequestURI();
		int idx = url.indexOf("/mc/");
		if(idx < 0) throw new ServiceException(" is wrong url '"+url+"'! ");
		String code = url.substring(idx+4).trim();
		
		SysModu modu = SysFrameUtil.getModuByCode(code);
		if(modu == null) {
			throw new ServiceException(" not found modu by code '"+code+"'! ");
		}
		
		String mp = modu.getModuParam();
		if(!BinaryUtils.isEmpty(mp)) {
			return forwardParam(request, response, modu, mp);
		}
		
		return "forward:/sys/frame/cross/modu/openModuleByCode?moduleCode="+code;
	}
	
	
	
	private String forwardParam(HttpServletRequest request, HttpServletResponse response, SysModu modu, String param) {
		ModuInfo info = new ModuInfo();
		info.setModu(modu);
		request.setAttribute(RequestKey.DYNAMIC_MODUINFO_KEY, info);
		return "forward:"+param;
	}
	
	
	
	
	@RequestMapping("/integration/sys")
	public String forward2Sys(HttpServletRequest request, HttpServletResponse response, String fwr) {
		BinaryUtils.checkEmpty(fwr, "fwr");
		fwr = ControllerUtils.formatContextPath(fwr);
		String url = this.csysRoot + fwr;
		request.setAttribute("integration_url", url);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
		String reload = user.getUserId();
		request.setAttribute("reload", reload);
		
		return "forward:/layout/jsp/integration.jsp";
	}
	
	
	
	
	
	
	@RequestMapping("/integration/cdev")
	public String forward2Cdev(HttpServletRequest request, HttpServletResponse response, String fwr) {
		BinaryUtils.checkEmpty(fwr, "fwr");
		fwr = ControllerUtils.formatContextPath(fwr);
		String url = this.cdevRoot + fwr;
		request.setAttribute("integration_url", url);		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
		String reload = user.getUserId();
		request.setAttribute("reload", reload);
		
		return "forward:/layout/jsp/integration.jsp";
	}
	
	
	
	@RequestMapping("/integration/cdep")
	public String forward2Cdep(HttpServletRequest request, HttpServletResponse response, String fwr) {
		BinaryUtils.checkEmpty(fwr, "fwr");
		fwr = ControllerUtils.formatContextPath(fwr);
		String url = this.cdepRoot + fwr;
		request.setAttribute("integration_url", url);
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(SessionKey.SYSTEM_USER);
		String reload = user.getUserId();
		request.setAttribute("reload", reload);
		
		return "forward:/layout/jsp/integration.jsp";
	}
	
	
	

}
