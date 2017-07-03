package com.ESAIP.Bean;

import java.io.Serializable;
/* This class is the bean class for the results tab of excel */
public class ResultDetails implements Serializable {
	private static final long serialVersionUID = 1L;

	private String resultkey;
	private String resultvalue;
	private String fileName;
	private String fileLocation;

	public String getResultkey() {
		return resultkey;
	}

	public void setResultkey(String resultkey) {
		this.resultkey = resultkey;
	}

	public String getResultvalue() {
		return resultvalue;
	}

	public void setResultvalue(String resultvalue) {
		this.resultvalue = resultvalue;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

}
