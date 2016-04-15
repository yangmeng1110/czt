package com.weiyin.cztqt.util;

public class StringUtils {

	/**
	 * 如果字符串为空，则为空
	 * @param str
	 * @return
	 */
	public static String replaceNullString(String str){
		if(str == null ) return "";
	           else return str;
	}
}
