package com.ESAIP.Listner;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.PropertyConfigurator;

import com.ESAIP.Utils.ExcelUtil;
import com.ESAIP.Utils.Execute;

/**
 * Application Life cycle Listener implementation class ApplicationListner Used
 * for initializing logger
 *
 */
@WebListener
public class ApplicationListner implements ServletContextListener {
	public ApplicationListner() {
	}

	public void contextInitialized(ServletContextEvent event) {
		ExcelUtil util = new ExcelUtil();
		String baseLocation = util.getFolderLocation();
		String drive = baseLocation.substring(0, baseLocation.indexOf("\\"));
		String folder = baseLocation + "\\src\\Repository\\resources";
		String port = "3966";
		Execute.updateProperty("ServerPort", port);
		String cmd = "cmd.exe /c cd\\ & " + drive + " & cd " + folder + " & java -jar HubServer.jar -port " + port
				+ " -role hub -nodeTimeout 1000 &  pause";
		try {
			Runtime.getRuntime().exec(cmd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		ServletContext ctx = event.getServletContext();
		String prefix = ctx.getRealPath("/");
		String file = "WEB-INF" + System.getProperty("file.separator") + "classes"
				+ System.getProperty("file.separator") + "log4j.properties";
		PropertyConfigurator.configure(prefix + file);
	}

	public void contextDestroyed(ServletContextEvent event) {
	}

}
