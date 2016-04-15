package com.weiyin.cztqt.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * servlet工具类
 * 
 * @author Administrator
 * 
 */
public final class HttpServletUtils {
	/**
	 * 从请求里解析出键值对
	 * 
	 * @param fields
	 * @param req
	 * @return
	 */
	public static Map<String, Object> parseReqToSearchCondition(
			String[] fields, HttpServletRequest req) {
		Map<String, Object> searchCdtns = new HashMap<String, Object>();
		if (null != fields) {
			for (String str : fields) {
				searchCdtns.put(str, req.getParameter(str));
			}
		}
		return searchCdtns;
	}

	/**
	 * 从请求里解析出键值对
	 * 
	 * @param fields
	 * @param req
	 * @return
	 */
	public static Map<String, String> parseReqToEntry(String[] fields,
			HttpServletRequest req) {
		Map<String, String> searchCdtns = new HashMap<String, String>();
		if (null != fields) {
			for (String str : fields) {
				searchCdtns.put(str, req.getParameter(str));
			}
		}
		return searchCdtns;
	}

}
