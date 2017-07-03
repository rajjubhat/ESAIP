package com.ESAIP.Utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/* This util class is used  to make the changes in the data while updating to the excel sheet*/
public class UpdateSheet {
	private static final Logger log = Logger.getLogger(UpdateSheet.class);

	/*
	 * This method deleteNoRows() is used to remove the rows with drop down
	 * select No
	 */
	public static void deleteNoRows(String Filename, String Sheetname) {
		try {
			int br = 1;
			int brinclude = 4;
			int module = 5;
			int modinclude = 6;
			int testcase = 7;
			int tcinclude = 8;
			int tcid = 9;
			int criticality = 10;

			String BR = "", BRinclude = "", Mod = "", Modinclude = "", TC = "", TCinclude = "", TcId = "",
					Criticality = "";
			String tempBR = "", tempBRinclude = "", tempMod = "", tempModinclude = "";

			int rowCount = 0;
			FileInputStream inputStream = null;
			FileOutputStream outputStream = null;
			Workbook workbook = null;
			Sheet sheet = null;
			Sheet tempDeletesheet = null;
			File file = new File(Filename);

			inputStream = new FileInputStream(file);

			workbook = new XSSFWorkbook(inputStream);
			sheet = workbook.getSheet(Sheetname);
			Row addrow = null;
			rowCount = sheet.getLastRowNum() - sheet.getFirstRowNum();

			if (workbook.getSheet("TempDelete") == null) {
				workbook.createSheet("TempDelete");

			}
			XSSFCellStyle style = (XSSFCellStyle) workbook.createCellStyle();
			style.setBorderBottom(XSSFCellStyle.BORDER_MEDIUM);
			style.setBorderTop(XSSFCellStyle.BORDER_MEDIUM);
			style.setBorderRight(XSSFCellStyle.BORDER_MEDIUM);
			style.setBorderLeft(XSSFCellStyle.BORDER_MEDIUM);
			XSSFColor blackcolor = new XSSFColor(new java.awt.Color(0, 0, 0));

			style.setBottomBorderColor(blackcolor);
			style.setRightBorderColor(blackcolor);
			style.setTopBorderColor(blackcolor);
			style.setLeftBorderColor(blackcolor);
			style.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
			style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			XSSFFont font = (XSSFFont) workbook.createFont();
			font.setBold(true);
			style.setFont(font);

			XSSFCellStyle style2 = (XSSFCellStyle) workbook.createCellStyle();
			style2.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			style2.setBorderTop(XSSFCellStyle.BORDER_THIN);
			style2.setBorderRight(XSSFCellStyle.BORDER_THIN);
			style2.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			style2.setBottomBorderColor(blackcolor);
			style2.setRightBorderColor(blackcolor);
			style2.setTopBorderColor(blackcolor);
			style2.setLeftBorderColor(blackcolor);
			style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
			style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			style2.setWrapText(true);

			tempDeletesheet = workbook.getSheet("TempDelete");

			Row firstRow = tempDeletesheet.createRow(0);

			for (int i = 0; i <= 7; i++) {
				firstRow.createCell(i);
			}

			firstRow.getCell(0).setCellValue("SlNo");
			firstRow.getCell(1).setCellValue("BR");
			firstRow.getCell(2).setCellValue("Module");
			firstRow.getCell(3).setCellValue("Testcase");
			firstRow.getCell(4).setCellValue("TestcaseID");
			firstRow.getCell(5).setCellValue("Criticality");
			firstRow.getCell(6).setCellValue("Results");
			firstRow.getCell(7).setCellValue("Time Taken");

			firstRow.getCell(0).setCellStyle(style);
			firstRow.getCell(1).setCellStyle(style);
			firstRow.getCell(2).setCellStyle(style);
			firstRow.getCell(3).setCellStyle(style);
			firstRow.getCell(4).setCellStyle(style);
			firstRow.getCell(5).setCellStyle(style);
			firstRow.getCell(6).setCellStyle(style);
			firstRow.getCell(7).setCellStyle(style);

			int k = 1;

			for (int i = 1; i <= rowCount; i++) {

				try {
					Row row = sheet.getRow(i);
					BR = row.getCell(br).getStringCellValue();
					BRinclude = row.getCell(brinclude).getStringCellValue();
					Mod = row.getCell(module).getStringCellValue();
					Modinclude = row.getCell(modinclude).getStringCellValue();
					TC = row.getCell(testcase).getStringCellValue();
					TCinclude = row.getCell(tcinclude).getStringCellValue();
					TcId = row.getCell(tcid).getStringCellValue();
					Criticality = row.getCell(criticality).getStringCellValue();

					if ((row.getCell(br).getCellType() == Cell.CELL_TYPE_BLANK) || (BR.equalsIgnoreCase(""))) {
						BR = tempBR;
					}

					if ((!BRinclude.equalsIgnoreCase("Yes")) && (!BRinclude.equalsIgnoreCase("No"))) {
						BRinclude = tempBRinclude;
					}

					if ((row.getCell(module).getCellType() == Cell.CELL_TYPE_BLANK) || (Mod.equalsIgnoreCase(""))) {
						Mod = tempMod;
					}

					if ((!Modinclude.equalsIgnoreCase("Yes")) && (!Modinclude.equalsIgnoreCase("No"))) {
						Modinclude = tempModinclude;
					}

					if (BRinclude.equalsIgnoreCase("Yes")) {
						if (Modinclude.equalsIgnoreCase("Yes")) {
							if (TCinclude.equalsIgnoreCase("Yes")) {
								tempDeletesheet.createRow(k);
								addrow = tempDeletesheet.getRow(k);

								addrow.createCell(0).setCellValue("#" + k);
								addrow.createCell(1).setCellValue(BR);
								addrow.createCell(2).setCellValue(Mod);
								addrow.createCell(3).setCellValue(TC);
								addrow.createCell(4).setCellValue(TcId);
								addrow.createCell(5).setCellValue(Criticality);
								addrow.createCell(6).setCellValue("Norun");
								addrow.createCell(7).setCellValue("N/A");

								addrow.getCell(0).setCellStyle(style2);
								addrow.getCell(1).setCellStyle(style2);
								addrow.getCell(2).setCellStyle(style2);
								addrow.getCell(3).setCellStyle(style2);
								addrow.getCell(4).setCellStyle(style2);
								addrow.getCell(5).setCellStyle(style2);
								addrow.getCell(6).setCellStyle(style2);
								addrow.getCell(7).setCellStyle(style2);
								k++;

							}
						}

					}

					else {

					}
					tempBR = BR;
					tempMod = Mod;
					tempBRinclude = BRinclude;
					tempModinclude = Modinclude;

				} catch (Exception e) {
					log.error("Error while deleting rows: " + e.getMessage());
					e.printStackTrace();
				}
				tempDeletesheet.autoSizeColumn(0);
				tempDeletesheet.autoSizeColumn(1);
				tempDeletesheet.autoSizeColumn(2);
				tempDeletesheet.autoSizeColumn(3);
				tempDeletesheet.autoSizeColumn(5);
				tempDeletesheet.autoSizeColumn(6);
				tempDeletesheet.autoSizeColumn(7);

			}

			inputStream.close();
			outputStream = new FileOutputStream(file);
			workbook.write(outputStream);
			outputStream.close();
			workbook.close();
			sheet = null;
			workbook = null;

		} catch (Exception e) {
			log.error("Error while deleting no rows " + e);
		}

	}

	/*
	 * This method deletedupBR() is used to delete the multiple rows with same
	 * BR name
	 */
	public static void deletedupBR(String Filename, String Sheetname) {
		try {
			int br = 1;
			int module = 2;

			String OldSheetname = "TempDelete";
			String BR = "", Mod = "";
			String tempBR = "", tempMod = "";

			int rowCount = 0;
			FileInputStream inputStream = null;
			FileOutputStream outputStream = null;
			Workbook workbook = null;
			Sheet sheet = null;

			File file = new File(Filename);

			inputStream = new FileInputStream(file);

			workbook = new XSSFWorkbook(inputStream);
			sheet = workbook.getSheet(OldSheetname);

			rowCount = sheet.getLastRowNum() - sheet.getFirstRowNum();

			for (int i = 1; i <= rowCount; i++) {

				try {
					Row row = sheet.getRow(i);
					BR = row.getCell(br).getStringCellValue();

					Mod = row.getCell(module).getStringCellValue();

					if (BR.equalsIgnoreCase(tempBR)) {
						row.getCell(br).setCellValue("");
					}
					if (Mod.equalsIgnoreCase(tempMod)) {
						row.getCell(module).setCellValue("");
					}

					tempBR = BR;
					tempMod = Mod;

				} catch (Exception e) {
					log.error("Error while deleting duplicate br " + e);
				}
			}

			try {
				workbook.removeSheetAt(workbook.getSheetIndex(Sheetname));
			} catch (Exception e) {
				log.error("Error while removing the temp sheet " + e);
			}
			try {
				workbook.setSheetName(workbook.getSheetIndex("TempDelete"), "RunplanSheet");
				inputStream.close();
				outputStream = new FileOutputStream(file);
				workbook.write(outputStream);
				outputStream.close();
			} catch (Exception e) {
				log.error("Error while closing input and output stream " + e);
			}
			workbook.close();
		} catch (IOException e) {
			log.error("Error while deleting duplicate br " + e);
		}
	}

	/*
	 * This method setRunFile() is used to set the run file name in the results
	 * sheet of excel
	 */
	public static void setRunFile(String fileName, String sheetName) {
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		Workbook workbook = null;
		Sheet sheet = null;

		File file = new File(fileName);

		try {
			inputStream = new FileInputStream(file);
			workbook = new XSSFWorkbook(inputStream);
			sheet = workbook.getSheet(sheetName);
			Row r = sheet.getRow(3);
			Cell c = r.getCell(2);
			if (c == null) {
				c = r.createCell(3, Cell.CELL_TYPE_STRING);
			}
			c.setCellValue(fileName.substring(fileName.lastIndexOf("\\") + 1));
			sheet.autoSizeColumn(2);
			inputStream.close();
			outputStream = new FileOutputStream(file);
			workbook.write(outputStream);
			outputStream.close();

		} catch (Exception e) {
			log.error("Error while setting run file" + e);
		}

	}

}
