package com.weiyin.cztqt.util;

import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 读取properties
 * @author Administrator
 *
 */
public class PropertiesUtil {

	private static final Logger log = Logger.getLogger(PropertiesUtil.class);
	
	private static Properties properties = new Properties();; 
	
	public static Properties getProperties(String pPath)
    {
//        Properties p = null;
        try
        {
            InputStream is = PropertiesUtil.class.getResourceAsStream(pPath);
            if (is == null)
            {
                log.error("properties文件不存在 ");
            }

//            p = new Properties();
            properties.load(is);
        }
        catch (Exception e)
        {
        	log.error("加载properties出现异常,异常信息"+e.getMessage(),e);
        }
        return properties;
    }
	
	public static String getConfig(String key){
		String configItem = properties.getProperty(key);
		if(configItem != null){
			return configItem;
		}
		return "";
	}
	
	public static void main(String[] args) {
		Properties p = PropertiesUtil.getProperties("/config/mail.properties");
		System.out.println(getConfig("password"));
	}
}
