package com.ESAIP.Utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.log4j.Logger;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.ESAIP.Bean.Defects;
import com.ESAIP.Bean.MasterPlan;

/* This util class is used to update the changes from UI to the excel file*/
public class UpdateData {
	private static final Logger log = Logger.getLogger(UpdateData.class);

	/*
	 * This method createRunPlan() is used to create and update a new run plan
	 */
	public static String createRunPlan(ArrayList<MasterPlan> runplan, String ip) {
		FileInputStream inputStream = null;
		Workbook workbook = null;
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		String masterPlanPath = baseLocation + "\\src\\MasterPlan.xlsx";
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy-HH_mm_ss");
		Date date = new Date();
		String runPlanLocation = baseLocation + "\\src\\Repository\\runplans\\Runplan_" + dateFormat.format(date) + "_"
				+ ip + ".xlsx";
		try {
			inputStream = new FileInputStream(new File(masterPlanPath));
			workbook = WorkbookFactory.create(inputStream);
			Sheet sheet = workbook.getSheet("MasterSheet");
			int rowCount = 0;
			for (MasterPlan plan : runplan) {
				Row row = sheet.createRow(++rowCount);
				writeRunPlan(plan, row);
			}
			FileOutputStream outputStream = new FileOutputStream(runPlanLocation);
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
			log.info("New Run plan file created: " + runPlanLocation);
		} catch (IOException | EncryptedDocumentException | InvalidFormatException ex) {
			log.error("Error while creating runplan" + ex);
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing workbook" + e);
				}
			}
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					log.error("Error while closing file input stream" + e);
				}
			}
		}
		UpdateSheet.deleteNoRows(runPlanLocation, "MasterSheet");
		UpdateSheet.deletedupBR(runPlanLocation, "MasterSheet");
		UpdateSheet.setRunFile(runPlanLocation, "Results");
		return runPlanLocation;
	}

	/*
	 * This method writeRunPlan() is used to write the Run PLan to specific row
	 * and column in excel sheet
	 */
	private static void writeRunPlan(MasterPlan plan, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(plan.getId().trim());

		cell = row.createCell(1);
		cell.setCellValue(plan.getBusinessRequirement());

		cell = row.createCell(2);
		cell.setCellValue(plan.getDescription());

		cell = row.createCell(3);
		cell.setCellValue(plan.getImpactedBRs());

		cell = row.createCell(4);
		cell.setCellValue(plan.getIncludeImpactedBRs());

		cell = row.createCell(5);
		cell.setCellValue(plan.getModules());

		cell = row.createCell(6);
		cell.setCellValue(plan.getModulesInclude());

		cell = row.createCell(7);
		cell.setCellValue(plan.getTestCases());

		cell = row.createCell(8);
		cell.setCellValue(plan.getTestCasesInclude());

		cell = row.createCell(9);
		cell.setCellValue(plan.getTestCaseId());

		cell = row.createCell(10);
		cell.setCellValue(plan.getCriticality());
	}

	/*
	 * This method updateDefects() used to update the Defects sheet in results
	 * file
	 */
	public static String updateDefects(ArrayList<Defects> defects, String fileLocation) {
		FileInputStream inputStream = null;
		Workbook workbook = null;
		try {
			inputStream = new FileInputStream(new File(fileLocation));
			workbook = WorkbookFactory.create(inputStream);
			Sheet sheet = workbook.getSheet("Defects");
			int rowCount = 0;
			for (Defects defect : defects) {
				Row row = sheet.createRow(++rowCount);
				writeDefect(defect, row);
			}
			FileOutputStream outputStream = new FileOutputStream(fileLocation);
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
			log.info("Defect details in result file: " + fileLocation + " updated");
		} catch (InvalidFormatException | IOException e) {
			log.error("Error while updating defects" + e);
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (IOException e) {
					log.error("Error while closing work book" + e);
				}
			}
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					log.error("Error while closing input stream" + e);
				}
			}
		}
		return fileLocation;
	}

	/*
	 * This method writeDefect() is used to update the defects in the excel
	 * Sheet
	 */
	private static void writeDefect(Defects defect, Row row) {
		Cell cell = row.createCell(0);
		cell.setCellValue(defect.getId().trim());

		cell = row.createCell(1);
		cell.setCellValue(defect.getTestCaseid());

		cell = row.createCell(2);
		cell.setCellValue(defect.getTestCaseName());

		cell = row.createCell(3);
		cell.setCellValue(defect.getLogDefect());

		cell = row.createCell(4);
		cell.setCellValue(defect.getSummary());

		cell = row.createCell(5);
		cell.setCellValue(defect.getDescription());

		cell = row.createCell(6);
		cell.setCellValue(defect.getReproducibility());

		cell = row.createCell(7);
		cell.setCellValue(defect.getSeverity());

		cell = row.createCell(8);
		cell.setCellValue(defect.getPriority());

		cell = row.createCell(9);
		cell.setCellValue(defect.getAssignTo());

		cell = row.createCell(10);
		cell.setCellValue(defect.getStepsToReproduce());

		cell = row.createCell(11);
		cell.setCellValue(defect.getAdditionalInformation());

		cell = row.createCell(12);
		cell.setCellValue(defect.getUploadFilePath());

		cell = row.createCell(13);
		cell.setCellValue(defect.getDefectID());

		cell = row.createCell(14);
		cell.setCellValue(defect.getLoggedDate());

		cell = row.createCell(15);
		cell.setCellValue(defect.getDefectUrl());
	}
}
