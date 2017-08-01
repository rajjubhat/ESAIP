package com.ESAIP.Utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.Logger;

public class ValidateLogin {
	private static final Logger log = Logger.getLogger(ValidateLogin.class);
	/* This method is used to validate the user credentials from database values*/
	public static boolean validate(String email, String password) {
		//String encryptedPassword = EncryptData(password);
		boolean status = verifyUser(email, password);
		return status;
	}
	/*This is used to encrypt the data using SHA Algorithm */
	/*private static String EncryptData(String password) {
		String algorithm = "SHA";
		byte[] passwordInBytes = password.getBytes();

		MessageDigest digester = null;

		try {
			digester = MessageDigest.getInstance(algorithm);
		} catch (Exception e) {
			e.printStackTrace();
		}

		digester.reset();
		digester.update(passwordInBytes);
		byte[] encodedPassword = digester.digest();

		StringBuilder builder = new StringBuilder();
		for (int i = 0; i < encodedPassword.length; i++) {
			if ((encodedPassword[i] & 0xff) < 0x10) {
				builder.append("0");
			}

			builder.append(Long.toString(encodedPassword[i] & 0xff, 16));
		}
		String encPassword = builder.toString();
		return encPassword;
	}*/
	/*This is used to check the values passed with the values in the database*/
	private static boolean verifyUser(String emailId, String encPassword) {
		boolean status = false;
		DBUtil dbUtil = new DBUtil();
		Connection connection = dbUtil.getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		log.info("Login attempted for email: " + emailId);
		try {
			preparedStatement = connection
					.prepareStatement("SELECT User_name FROM users WHERE email_Id=? and password=?");
			preparedStatement.setString(1, emailId);
			preparedStatement.setString(2, encPassword);
			resultSet = preparedStatement.executeQuery();
			status = resultSet.next();
			if (status) {
				log.info("Logged in successfully with emailID: " + emailId);
			} else {
				log.info("Log in failed for emailID: " + emailId);
			}
		} catch (Exception e) {
			log.error("Error creating database connection in ValidateLogin " + e.getMessage());
		} finally {
			dbUtil.closeResource(resultSet, preparedStatement, null, connection);
		}
		return status;
	}

}
