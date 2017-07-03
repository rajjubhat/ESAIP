package com.ESAIP.Bean;

import java.io.Serializable;

/* This class is a bean class for the data of defects tab of excel*/
public class Defects implements Serializable {
	private static final long serialVersionUID = 1L;

	private int index;
	private String id;
	private String testCaseid;
	private String testCaseName;
	private String logDefect;
	private String summary;
	private String description;
	private String reproducibility;
	private String Severity;
	private String priority;
	private String assignTo;
	private String stepsToReproduce;
	private String additionalInformation;
	private String uploadFilePath;
	private String defectID;
	private String loggedDate;
	private String defectUrl;
	private String fileLocation;
	private String fileName;

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTestCaseid() {
		return testCaseid;
	}

	public void setTestCaseid(String testCaseid) {
		this.testCaseid = testCaseid;
	}

	public String getTestCaseName() {
		return testCaseName;
	}

	public void setTestCaseName(String testCaseName) {
		this.testCaseName = testCaseName;
	}

	public String getLogDefect() {
		return logDefect;
	}

	public void setLogDefect(String logDefect) {
		this.logDefect = logDefect;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReproducibility() {
		return reproducibility;
	}

	public void setReproducibility(String reproducibility) {
		this.reproducibility = reproducibility;
	}

	public String getSeverity() {
		return Severity;
	}

	public void setSeverity(String severity) {
		Severity = severity;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
	}

	public String getStepsToReproduce() {
		return stepsToReproduce;
	}

	public void setStepsToReproduce(String stepsToReproduce) {
		this.stepsToReproduce = stepsToReproduce;
	}

	public String getAdditionalInformation() {
		return additionalInformation;
	}

	public void setAdditionalInformation(String additionalInformation) {
		this.additionalInformation = additionalInformation;
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public String getDefectID() {
		return defectID;
	}

	public void setDefectID(String defectID) {
		this.defectID = defectID;
	}

	public String getLoggedDate() {
		return loggedDate;
	}

	public void setLoggedDate(String loggedDate) {
		this.loggedDate = loggedDate;
	}

	public String getDefectUrl() {
		return defectUrl;
	}

	public void setDefectUrl(String defectUrl) {
		this.defectUrl = defectUrl;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
