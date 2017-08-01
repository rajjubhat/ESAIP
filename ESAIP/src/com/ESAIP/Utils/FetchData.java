package com.ESAIP.Utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.ESAIP.Bean.Defects;
import com.ESAIP.Bean.MasterPlan;
import com.ESAIP.Bean.ResultDetails;
import com.ESAIP.Bean.RunPlan;

/* This Util class is used to fetch data from the excel sheet at specified locations*/
public class FetchData {
	private static final Logger log = Logger.getLogger(FetchData.class);

	/* This method fetchMasterplan() is used to fetch the Master Plan details */
	public static List<MasterPlan> fetchMasterplan() {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		List<MasterPlan> masterPlans = new ArrayList<>();
		String filename = baseLocation + "\\src\\MasterPlan.xlsx";
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream(filename);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheet("MasterSheet");
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				String rowData = "";
				for (int j = 0; j < 11; j++) {
					DataFormatter formatter = new DataFormatter();
					XSSFCell cell = sheet.getRow(i).getCell(j);
					rowData = rowData + formatter.formatCellValue(cell) + " |";
				}

				StringTokenizer st = new StringTokenizer(rowData, "|");
				MasterPlan plan = new MasterPlan();
				plan.setIndex(i);
				plan.setId(st.nextToken().trim());
				plan.setBusinessRequirement(st.nextToken().trim());
				plan.setDescription(st.nextToken().trim());
				plan.setImpactedBRs(st.nextToken().trim());
				plan.setIncludeImpactedBRs(st.nextToken().trim());
				plan.setModules(st.nextToken().trim());
				plan.setModulesInclude(st.nextToken().trim());
				plan.setTestCases(st.nextToken().trim());
				plan.setTestCasesInclude(st.nextToken().trim());
				plan.setTestCaseId(st.nextToken().trim());
				plan.setCriticality(st.nextToken().trim());
				masterPlans.add(plan);
			}
		} catch (IOException e) {
			log.error("Error while fetching Master Plan " + e);
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					log.error("Error while closing file input stream" + e);
				}
			}
		}
		log.info("Masterplan Fetched from location " + filename);
		return masterPlans;
	}

	/*
	 * This method fetchExcecutionPlan() is used to fetch the Run Plan from
	 * specified location
	 */
	public static List<RunPlan> fetchExcecutionPlan(String fileLocation) {
		List<RunPlan> runPlans = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream(fileLocation);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheet("RunplanSheet");
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				String rowData = "";
				for (int j = 0; j < 8; j++) {
					DataFormatter formatter = new DataFormatter();
					XSSFCell cell = sheet.getRow(i).getCell(j);
					rowData = rowData + formatter.formatCellValue(cell) + " |";
				}

				StringTokenizer st = new StringTokenizer(rowData, "|");
				RunPlan plan = new RunPlan();
				plan.setId(st.nextToken().trim());
				plan.setBR(st.nextToken().trim());
				plan.setModule(st.nextToken().trim());
				plan.setTestCase(st.nextToken().trim());
				plan.setTestCaseId(st.nextToken().trim());
				plan.setCriticality(st.nextToken().trim());
				plan.setResult(st.nextToken().trim());
				plan.setTimeTaken(st.nextToken().trim());
				plan.setFileName(fileLocation.substring(fileLocation.lastIndexOf("\\") + 1));
				plan.setFileLocation(fileLocation);
				runPlans.add(plan);
			}
		} catch (IOException e) {
			log.error("Error while fetching Execution Plan" + e);
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					log.error("Error while closing file input Stream" + e);
				}
			}
		}
		log.info("fetched Executionplan from file: " + fileLocation);
		return runPlans;
	}

	/*
	 * This method fetchResultData() is used to fetch the Result data from
	 * specified location
	 */
	public static List<ResultDetails> fetchResultData(String fileLocation) {
		log.info("fetched Result data from file: " + fileLocation);
		List<ResultDetails> result = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream(fileLocation);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheet("Results");
			for (int i = 3; i < sheet.getLastRowNum() + 1; i++) {
				String rowData = "";
				for (int j = 1; j < 3; j++) {
					DataFormatter formatter = new DataFormatter();
					XSSFCell cell = sheet.getRow(i).getCell(j);
					rowData = rowData + formatter.formatCellValue(cell) + " |";
				}

				StringTokenizer st = new StringTokenizer(rowData, "|");
				ResultDetails details = new ResultDetails();
				details.setResultkey(st.nextToken().trim());
				details.setResultvalue(st.nextToken().trim());
				details.setFileLocation(fileLocation);
				details.setFileName(fileLocation.substring(fileLocation.lastIndexOf("\\") + 1));

				result.add(details);
			}
		} catch (Exception e) {
			log.error("Error while fetching Result Data" + e);
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					log.error("Error while closing file input stream" + e);
				}
			}
		}
		return result;
	}

	/*
	 * This method fetchDefectData() is used to fetch the Defect data from
	 * specified location
	 */
	public static List<Defects> fetchDefectData(String fileLocation) {
		log.info("fetched Defect data from file: " + fileLocation);
		List<Defects> defectData = new ArrayList<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream(fileLocation);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheet("Defects");
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				String rowData = "";
				for (int j = 0; j < 16; j++) {
					DataFormatter formatter = new DataFormatter();
					XSSFCell cell = sheet.getRow(i).getCell(j);
					rowData = rowData + formatter.formatCellValue(cell) + " |";
				}
				StringTokenizer st = new StringTokenizer(rowData, "|");
				Defects defect = new Defects();
				defect.setIndex(i);
				defect.setId(st.nextToken().trim());
				defect.setTestCaseid(st.nextToken().trim());
				defect.setTestCaseName(st.nextToken().trim());
				defect.setLogDefect(st.nextToken().trim());
				defect.setSummary(st.nextToken().trim());
				defect.setDescription(st.nextToken().trim());
				defect.setReproducibility(st.nextToken().trim());
				defect.setSeverity(st.nextToken().trim());
				defect.setPriority(st.nextToken().trim());
				defect.setAssignTo(st.nextToken().trim());
				defect.setStepsToReproduce(st.nextToken().trim());
				defect.setAdditionalInformation(st.nextToken().trim());
				defect.setUploadFilePath(st.nextToken().trim());
				defect.setDefectID(st.nextToken().trim());
				defect.setLoggedDate(st.nextToken().trim());
				defect.setDefectUrl(st.nextToken().trim());
				defect.setFileLocation(fileLocation);
				defect.setFileName(fileLocation.substring(fileLocation.lastIndexOf("\\") + 1));
				defectData.add(defect);
			}
		} catch (Exception e) {
			log.error("Error while fetching Defect Data" + e);
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					log.error("Error while closing file input stream" + e);
				}
			}
		}
		log.info("Defect data fetcted from file: " + fileLocation);
		return defectData;
	}

	/*
	 * This method fetchLogDefect() is used to fetch defect table drop down
	 * values
	 */
	public static Map<String, String> fetchDefectDropdown(String fileLocation, int column) {
		Map<String, String> values = new TreeMap<>();
		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		try {
			fis = new FileInputStream(fileLocation);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheet("ListValues");
			for (int i = 1; i < sheet.getLastRowNum() + 1; i++) {
				String rowData = "";
				DataFormatter formatter = new DataFormatter();
				XSSFCell cell = sheet.getRow(i).getCell(column);
				rowData = formatter.formatCellValue(cell);
				if (rowData.trim().length() != 0) {
					values.put(rowData, rowData);
				}

			}
		} catch (IOException e) {
			log.error("Error while fetching Defect Log types" + e);
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					log.error("Error while closing file input stream" + e);
				}
			}
		}
		return values;
	}

	/*
	 * This method getFilesList() is used to fetch the list of files from the
	 * directory
	 */
	public static Map<String, String> getFilesList(String folderPath) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		String folderLocation = baseLocation + "\\src\\Repository\\" + folderPath;
		File folder = new File(folderLocation);
		File[] listOfFiles = folder.listFiles();
		Map<String, String> resultFiles = new TreeMap<String, String>(Collections.reverseOrder());
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				String fileName = listOfFiles[i].getName();
				if (fileName.substring(fileName.lastIndexOf(".")).equalsIgnoreCase(".xlsx")) {
					resultFiles.put(fileName, folderLocation + "\\" + fileName);
				}
			}
		}
		log.info("List of " + folderLocation + " fetched from " + folderLocation);
		return resultFiles;
	}

	/* This is used to get the respective log file for given Result File */
	public static String getLogFile(String resultLocation) {
		String resultFile = resultLocation.substring(resultLocation.lastIndexOf("\\") + 1,
				resultLocation.lastIndexOf("."));
		ExcelUtil util = new ExcelUtil();
		String logsFolder = util.getFolderLocation() + "\\src\\Repository\\Logs\\" + resultFile + ".log";
		return logsFolder;
	}

	/*
	 * This method resultFileLocation is used to get result file location for
	 * result file in properties file
	 */
	public static String resultFileLocation() {
		ExcelUtil util = new ExcelUtil();
		String resultFile = util.getProperty("ResultFilename");
		String location = "";
		if (resultFile.trim().length() != 0) {
			location = util.getFolderLocation() + "\\src\\Repository\\results\\" + resultFile;
		}
		return location;
	}

	/*
	 * This method runPLanLocation is used to get result file location for run
	 * plan file in properties file
	 */
	public static String runPLanLocation() {
		ExcelUtil util = new ExcelUtil();
		String location = util.getFolderLocation() + "\\src\\Repository\\runplans\\"
				+ util.getProperty("RunplanFilename");
		return location;
	}

	/*
	 * This method defectFileLocation is used to get defect file location for
	 * defect plan file in properties file
	 */
	public static String defectFileLocation() {
		ExcelUtil util = new ExcelUtil();
		String location = util.getFolderLocation() + "\\src\\Repository\\results\\"
				+ util.getProperty("DefectFilename");
		return location;
	}
}
