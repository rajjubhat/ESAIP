package com.ESAIP.Utils;

import java.io.IOException;

import org.apache.log4j.Logger;

/* This Util class is used to execute the jar files for running selenium code and Mantis defect logging code*/
public class Execute {
	private static final Logger log = Logger.getLogger(Execute.class);

	/*
	 * This method executeTestCase() is used to start the selenium testing for
	 * given run plan
	 */
	public static void executeTestCase(String fileLocation) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		try {
			log.info("Executed the Run Plans of file: " + fileLocation);
			String cmd = "cmd.exe /c cd\\ & Taskkill /im excel.exe & "
					+ baseLocation.substring(0, baseLocation.indexOf("\\")) + " & cd " + baseLocation
					+ " & cd src & java -jar SeleniumTool.jar & pause";
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			log.error("Error while executing selenium jar " + e);
		}

	}

	/*
	 * This method FetchdefectId() is used to log the defect id of the mantis
	 */
	public static void logDefect(String fileLocation) {
		log.info("Defect Id logged for Result file: " + fileLocation);
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		try {
			log.info("Defect id logged for file: " + fileLocation);
			String cmd = "cmd.exe /c cd\\ & Taskkill /im excel.exe & "
					+ baseLocation.substring(0, baseLocation.indexOf("\\")) + " & cd " + baseLocation
					+ " & cd src & java -jar LogDefects.jar & pause";
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			log.error("Error while executing Mantis jar " + e);
		}
	}

	/* Returns value of the defined property */
	public static String getProperty(String propertyName) {
		ExcelUtil util = new ExcelUtil();
		String status = null;
		status = util.getProperty(propertyName);
		return status;
	}

	/* this is used to update the property for the selenium execution */
	public static void updateProperty(String property, String value) {
		ExcelUtil util = new ExcelUtil();
		util.setProperty(property, value);
		log.info(property + " is  set with value: " + value);
	}

}
