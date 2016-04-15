package com.weiyin.cztqt.util;

import java.util.Random;

import org.apache.log4j.Logger;

/**
 * 随机产生字符
 * @author Administrator
 *
 */
public class RandomUtil {

	 private static Logger logger = Logger.getLogger(Random.class); 
	
	public static String getRandom(int length){
			String base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";  
		    Random random = new Random();  
		    StringBuffer sb = new StringBuffer();  
		    try {
		    	for (int i = 0; i <5; i++) {  
		    		int number = random.nextInt(base.length());  
		    		sb.append(base.charAt(number));  
		    	}  
			} catch (Exception e) {
				logger.error("产生随机数异常,异常信息"+e.getMessage(), e);
			}
		    return sb.toString();
		
	}
}
