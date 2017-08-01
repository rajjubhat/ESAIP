package com.ESAIP.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ESAIP.Bean.Defects;
import com.ESAIP.Bean.MasterPlan;
import com.ESAIP.Utils.ExcelUtil;
import com.ESAIP.Utils.Execute;
import com.ESAIP.Utils.FetchData;
import com.ESAIP.Utils.UpdateData;
import com.ESAIP.Utils.ValidateLogin;

/* This class will act as a  servlet controller for the application*/
@WebServlet("/ServletController")
public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(ServletController.class);

	public ServletController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			log.error("Exception in doGet method of ServletController class: " + e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			log.error("Exception in doPost method of ServletController class: " + e);
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uri = request.getRequestURI();
		RequestDispatcher rd = null;
		response.setContentType("text/html");

		/* This is used to check the login credentials from Database */
		if (uri.contains("login.do")) {
			String clientIp = request.getRemoteAddr();
			Execute.updateProperty("ClientIP", clientIp);
			String serverIp = Inet4Address.getLocalHost().getHostAddress();
			Execute.updateProperty("ServerIP", serverIp);
			String emailId = request.getParameter("emailid").trim();
			String password = request.getParameter("password").trim();
			boolean status = ValidateLogin.validate(emailId, password);
			if (status) {
				response.sendRedirect("jsp/fetch.do");
			} else {
				request.setAttribute("error", "Please enter valid e-mail ID or Password.");
				rd = request.getRequestDispatcher("index.jsp");
				try {
					rd.include(request, response);
				} catch (ServletException e) {
					log.info("Exception in login.do method of ServletController class: " + e);
				}
			}
		}

		/* This is used to fetch the master plan */
		if (uri.contains("fetch.do")) {
			request.getSession().setAttribute("list", FetchData.fetchMasterplan());
			response.sendRedirect("dashboard.jsp");
		}

		/* This is used to fetch the run plan */
		if (uri.contains("runplan.do")) {
			request.getSession().setAttribute("runplanlist", FetchData.fetchMasterplan());
			response.sendRedirect("runplan.jsp");
		}

		/* This is used to create the new Run plan */
		if (uri.contains("create.do")) {
			String ip = request.getRemoteAddr();
			ArrayList<MasterPlan> runPlans = new ArrayList<MasterPlan>();
			int length = Integer.parseInt(request.getParameter("length"));
			for (int i = 1; i <= length; i++) {
				MasterPlan runPlan = new MasterPlan();
				runPlan.setId(request.getParameter("id" + i));
				runPlan.setBusinessRequirement(request.getParameter("businessRequirement" + i));
				runPlan.setDescription(request.getParameter("description" + i));
				runPlan.setImpactedBRs(request.getParameter("impactedBRs" + i));
				runPlan.setIncludeImpactedBRs(request.getParameter("includeImpactedBRs" + i));
				runPlan.setModules(request.getParameter("modules" + i));
				runPlan.setModulesInclude(request.getParameter("modulesInclude" + i));
				runPlan.setTestCases(request.getParameter("testCases" + i));
				runPlan.setTestCasesInclude(request.getParameter("testCasesInclude" + i));
				runPlan.setTestCaseId(request.getParameter("testCaseId" + i));
				runPlan.setCriticality(request.getParameter("criticality" + i));
				runPlans.add(runPlan);
			}
			String runPlan = UpdateData.createRunPlan(runPlans, ip);
			response.sendRedirect("generate.do?filelocation=" + runPlan);
		}

		/* This is used to fetch the execution plan */
		if (uri.contains("generate.do")) {
			String fileLocation = request.getParameter("filelocation");
			request.getSession().setAttribute("executiondata", FetchData.fetchExcecutionPlan(fileLocation));
			request.getSession().setAttribute("runplans", FetchData.getFilesList("runplans"));
			request.getSession().setAttribute("newnode", Execute.getProperty("DownloadNewNodeserver"));
			request.getSession().setAttribute("version", Execute.getProperty("LatestNoderserverVersion"));
			response.sendRedirect("execute.jsp");
		}

		/* This is used to fetch the list of files in run plan folder */
		if (uri.contains("filedetails.do")) {
			request.getSession().setAttribute("filesList", FetchData.getFilesList("runplans"));
			response.sendRedirect("filesdropdown.jsp");
		}

		/*
		 * This is used to provide the files required for selenium grid
		 * execution
		 */
		if (uri.contains("download.do")) {
			ExcelUtil util = new ExcelUtil();
			String baseLocation = util.getFolderLocation();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String fileName = Execute.getProperty("LatestNoderserverVersion") + ".exe";
			String filepath = baseLocation + "\\src\\Repository\\resources\\";
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			FileInputStream fileInputStream = new FileInputStream(filepath + fileName);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		}

		/* This is used to call the execution plans */
		if (uri.contains("execute.do")) {
			String fileLocation = request.getParameter("filelocation");
			String fileName = fileLocation.substring(fileLocation.lastIndexOf("\\") + 1);
			Execute.updateProperty("RunplanFilename", fileName);
			Execute.updateProperty("NodeServerRunning", "");
			Execute.updateProperty("ProgressStatus", "0");
			Execute.updateProperty("StopExecution", "No");
			Execute.updateProperty("ResultFilename", "");
			Execute.updateProperty("NodeServerRunningMessage", "");
			Execute.updateProperty("StopExecutionMessage", "");
			Execute.executeTestCase(fileLocation);
			response.sendRedirect("process.do");
		}

		/* This is used to fetch the list of files in results folder */
		if (uri.contains("results.do")) {
			request.getSession().setAttribute("resultList", FetchData.getFilesList("results"));
			response.sendRedirect("result.jsp");
		}
		/* This is used to update the progress of the test case execution */
		if (uri.contains("process.do")) {
			request.getSession().setAttribute("resultstatus", Execute.getProperty("ProgressStatus"));
			request.getSession().setAttribute("nodeStatus", Execute.getProperty("NodeServerRunning"));
			request.getSession().setAttribute("stopStatus", Execute.getProperty("StopExecution"));
			request.getSession().setAttribute("stopMessage", Execute.getProperty("StopExecutionMessage"));
			String nodeMessage = Execute.getProperty("NodeServerRunningMessage");
			request.getSession().setAttribute("nodeMessage", Execute.getMessage(nodeMessage));
			request.getSession().setAttribute("runplan", FetchData.runPLanLocation());
			request.getSession().setAttribute("resultfile", FetchData.resultFileLocation());
			response.sendRedirect("executionprogress.jsp");
		}
		/* This is used to download the selected result file */
		if (uri.contains("save.do")) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String filepath = request.getParameter("filelocation");
			String filename = filepath.substring(filepath.lastIndexOf("\\"));
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			FileInputStream fileInputStream = new FileInputStream(filepath);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
		}
		/* This is used to download log files */
		if (uri.contains("logs.do")) {
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			String logFile = FetchData.getLogFile(request.getParameter("filelocation"));
			String filename = logFile.substring(logFile.lastIndexOf("\\") + 1);
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			FileInputStream fileInputStream = new FileInputStream(logFile);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.flush();
			out.close();
		}

		/* This is used to stop the execution */
		if (uri.contains("stop.do")) {
			Execute.updateProperty("StopExecution", "Yes");
		}
		/* This is used to fetch the results from the file */
		if (uri.contains("display.do")) {
			String fileLocation = request.getParameter("filelocation");
			request.getSession().setAttribute("resultFileList", FetchData.getFilesList("results"));
			request.getSession().setAttribute("result", FetchData.fetchResultData(fileLocation));
			request.getSession().setAttribute("UsedRunPlan", FetchData.fetchExcecutionPlan(fileLocation));
			request.getSession().setAttribute("defectsize", FetchData.fetchDefectData(fileLocation).size());
			response.sendRedirect("resultdisplay.jsp");
		}
		/*
		 * This is used to fetch the file location of results to view in defects
		 * tab
		 */
		if (uri.contains("location.do")) {
			request.getSession().setAttribute("defectFiles", FetchData.getFilesList("results"));
			response.sendRedirect("defects.jsp");
		}
		
		/*
		 * This is used fetch the defects details All the column numbers are n-1
		 * as of sheet in excel column 10 is log defect column 11 is
		 * reproducibility column 12 is severity column 13 is priority column 14
		 * is assigned to
		 */
		if (uri.contains("defects.do")) {
			String fileLocation = request.getParameter("filelocation");
			Execute.updateProperty("StopExecution", "No");

			request.getSession().setAttribute("defectfiles", FetchData.getFilesList("results"));
			request.getSession().setAttribute("defects", FetchData.fetchDefectData(fileLocation));
			request.getSession().setAttribute("logDefect", FetchData.fetchDefectDropdown(fileLocation, 10));
			request.getSession().setAttribute("reproducibilityTypes", FetchData.fetchDefectDropdown(fileLocation, 11));
			request.getSession().setAttribute("severityTypes", FetchData.fetchDefectDropdown(fileLocation, 12));
			request.getSession().setAttribute("priorityTypes", FetchData.fetchDefectDropdown(fileLocation, 13));
			request.getSession().setAttribute("assignToTypes", FetchData.fetchDefectDropdown(fileLocation, 14));

			response.sendRedirect("defectdetails.jsp");
		}

		/*
		 * This is used to update the defect to Defect logging tool
		 */
		if (uri.contains("data.do")) {
			String fileLocation = request.getParameter("filelocation");
			String fileName = fileLocation.substring(fileLocation.lastIndexOf("\\") + 1);
			ArrayList<Defects> defects = new ArrayList<Defects>();
			int length = Integer.parseInt(request.getParameter("length"));
			for (int i = 1; i <= length; i++) {
				Defects defect = new Defects();
				defect.setId(request.getParameter("id" + i));
				defect.setTestCaseid(request.getParameter("testCaseid" + i));
				defect.setTestCaseName(request.getParameter("testCaseName" + i));
				defect.setLogDefect(request.getParameter("logDefect" + i));
				defect.setSummary(request.getParameter("summary" + i));
				defect.setDescription(request.getParameter("description" + i));
				defect.setReproducibility(request.getParameter("reproducibility" + i));
				defect.setSeverity(request.getParameter("severity" + i));
				defect.setPriority(request.getParameter("priority" + i));
				defect.setAssignTo(request.getParameter("assignTo" + i));
				defect.setStepsToReproduce(request.getParameter("stepsToReproduce" + i));
				defect.setAdditionalInformation(request.getParameter("additionalInformation" + i));
				defect.setUploadFilePath(request.getParameter("uploadFilePath" + i));
				defect.setDefectUrl(request.getParameter("defecturl" + i));
				defect.setDefectID(request.getParameter("defectID" + i));
				defect.setLoggedDate(request.getParameter("loggeddate" + i));
				defects.add(defect);
			}
			UpdateData.updateDefects(defects, fileLocation);
			Execute.updateProperty("DefectFilename", fileName);
			Execute.updateProperty("DefectProgressStatus", "0");
			Execute.updateProperty("StopExecution", "No");
			Execute.updateProperty("DefectProgressMessage", "");
			Execute.logDefect(fileLocation);
			response.sendRedirect("progress.do");
		}

		/*
		 * This method is used to update the changes made in defect sheet
		 */
		if (uri.contains("update.do")) {
			String fileLocation = request.getParameter("filelocation");
			ArrayList<Defects> defects = new ArrayList<Defects>();
			int length = Integer.parseInt(request.getParameter("length"));
			for (int i = 1; i <= length; i++) {
				Defects defect = new Defects();

				defect.setId(request.getParameter("id" + i));
				defect.setTestCaseid(request.getParameter("testCaseid" + i));
				defect.setTestCaseName(request.getParameter("testCaseName" + i));
				defect.setLogDefect(request.getParameter("logDefect" + i));
				defect.setSummary(request.getParameter("summary" + i));
				defect.setDescription(request.getParameter("description" + i));
				defect.setReproducibility(request.getParameter("reproducibility" + i));
				defect.setSeverity(request.getParameter("severity" + i));
				defect.setPriority(request.getParameter("priority" + i));
				defect.setAssignTo(request.getParameter("assignTo" + i));
				defect.setStepsToReproduce(request.getParameter("stepsToReproduce" + i));
				defect.setAdditionalInformation(request.getParameter("additionalInformation" + i));
				defect.setUploadFilePath(request.getParameter("uploadFilePath" + i));
				defect.setDefectUrl(request.getParameter("defecturl" + i));
				defect.setDefectID(request.getParameter("defectID" + i));
				defect.setLoggedDate(request.getParameter("loggeddate" + i));
				defects.add(defect);
			}
			UpdateData.updateDefects(defects, fileLocation);
			response.sendRedirect("defects.do?filelocation=" + fileLocation);
		}

		/* This is used to update the progress of the defect logging */
		if (uri.contains("progress.do")) {
			request.getSession().setAttribute("defectstatus", Execute.getProperty("DefectProgressStatus"));
			request.getSession().setAttribute("stopExecution", Execute.getProperty("StopExecution"));
			String defectProgressMessage = Execute.getProperty("DefectProgressMessage");
			request.getSession().setAttribute("defectmessage", Execute.getMessage(defectProgressMessage));
			request.getSession().setAttribute("defectfile", FetchData.defectFileLocation());
			response.sendRedirect("defectprogress.jsp");
		}

		/* Log out removes all attributes */
		if (uri.contains("logout.do")) {
			request.getSession().invalidate();
			response.sendRedirect("/ESAIP/index.jsp");
		}

	}

}
