package com.ESAIP.Utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/* This Util class is used to fetch the properties from .properties file*/
public class ExcelUtil {
	private static final Logger log = Logger.getLogger(ExcelUtil.class);

	/*
	 * This method getFileLocation() is used to fetch the folder location of src
	 * folder
	 */
	public String getFolderLocation() {
		Properties prop = null;
		prop = new Properties();
		InputStream inStr = this.getClass().getClassLoader().getResourceAsStream("ExcelData.properties");
		try {
			prop.load(inStr);
		} catch (IOException e) {
			log.error("Error fetching the properties file");
		}
		return prop.getProperty("folderlocation");
	}

	/* This is used to set the values required for selenium testing */
	public void setProperty(String property, String value) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		try {
			FileInputStream fis = new FileInputStream(baseLocation + "\\src\\Progress\\Progress.properties");
			Properties prop = null;
			prop = new Properties();
			prop.load(fis);
			fis.close();
			FileOutputStream fos = new FileOutputStream(baseLocation + "\\src\\Progress\\Progress.properties");
			prop.setProperty(property, value);
			prop.store(fos, null);
		} catch (IOException e) {
			log.error("Exception setting property in ExcelDataUtil class: " + e);
		}
	}

	/* This is used to fetch the values set by selenium testing */
	public String getProperty(String propertyName) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		Properties prop = null;
		prop = new Properties();
		try {
			prop.load(new FileInputStream(baseLocation + "\\src\\Progress\\Progress.properties"));
		} catch (IOException e) {
			log.error("Error fetching the properties file: " + e);
		}
		return prop.getProperty(propertyName);
	}

	/* This is used to fetch the values set by selenium testing */
	public String getMessage(String propertyName) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		Properties prop = null;
		prop = new Properties();
		try {
			prop.load(new FileInputStream(baseLocation + "\\src\\Progress\\Messages.properties"));
		} catch (IOException e) {
			log.error("Error fetching the properties file: " + e);
		}
		return prop.getProperty(propertyName);
	}

}
