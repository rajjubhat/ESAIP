package com.ESAIP.Bean;

import java.io.Serializable;
/* This class is a bean for master plan tab of excel */
public class MasterPlan implements Serializable {
	private static final long serialVersionUID = 1L;

	private int index;
	private String id;
	private String businessRequirement;
	private String description;
	private String impactedBRs;
	private String includeImpactedBRs;
	private String modules;
	private String modulesInclude;
	private String testCases;
	private String testCasesInclude;
	private String TestCaseId;
	private String criticality;
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

	public String getBusinessRequirement() {
		return businessRequirement;
	}

	public void setBusinessRequirement(String businessRequirement) {
		this.businessRequirement = businessRequirement;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImpactedBRs() {
		return impactedBRs;
	}

	public void setImpactedBRs(String impactedBRs) {
		this.impactedBRs = impactedBRs;
	}

	public String getIncludeImpactedBRs() {
		return includeImpactedBRs;
	}

	public void setIncludeImpactedBRs(String includeImpactedBRs) {
		this.includeImpactedBRs = includeImpactedBRs;
	}

	public String getModules() {
		return modules;
	}

	public void setModules(String modules) {
		this.modules = modules;
	}

	public String getModulesInclude() {
		return modulesInclude;
	}

	public void setModulesInclude(String modulesInclude) {
		this.modulesInclude = modulesInclude;
	}

	public String getTestCases() {
		return testCases;
	}

	public void setTestCases(String testCases) {
		this.testCases = testCases;
	}

	public String getTestCasesInclude() {
		return testCasesInclude;
	}

	public void setTestCasesInclude(String testCasesInclude) {
		this.testCasesInclude = testCasesInclude;
	}

	public String getTestCaseId() {
		return TestCaseId;
	}

	public void setTestCaseId(String testCaseId) {
		TestCaseId = testCaseId;
	}

	public String getCriticality() {
		return criticality;
	}

	public void setCriticality(String criticality) {
		this.criticality = criticality;
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
