package com.db.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import com.mysql.jdbc.exceptions.MySQLDataException;

/**
 * Servlet implementation class GameInput
 */
@WebServlet("/GameInput")
public class GameInput extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

	private static String name = null;
	private static String consoleName = null;
	private static String developer = null;
	private static String publisher = null;
	private static String genre = null;
	private static String condition = null;
	private static String[] boxItems = null;
	private static String marketPrice = null;
	private static String currentMarketValue = null;
	private static String playStatus = null;
	private static String sellingStatus = null;
	private static String transaction_date = null;
	private static String itemStatus = null;
	private static String billNumber = null;
	private static String release_num = null;

	private static String developerId = null;
	private static String transactionId = null;
	private static String genreId = null;
	private static String publisherId = null;
	private static String conditionId = null;
	private static String consoleId = null;
	private static String gameId = null;

	private static String insertIntoDeveloper = null;
	private static String insertIntoGameTransaction = null;
	private static String insertIntoPublisher = null;

	private static String retreiveDeveloperId = null;
	private static String retreiveTransactionId = null;
	private static String retreiveGenreId = null;
	private static String retreivePublisherId = null;
	private static String retreiveConditionId = null;
	private static String retriveConsoleId = null;
	private static String retriveGameId = null;
	private static String insertIntoGame = null;
	private static String insertIntoConsole_VG = null;
	private static String insertIntoDev_VG = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GameInput() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();

		name = request.getParameter("name").trim();
		consoleName = request.getParameter("consoleName").trim();
		developer = request.getParameter("developer").trim();
		publisher = request.getParameter("publisher").trim();
		genre = request.getParameter("genre").trim();
		condition = request.getParameter("condition").trim();
		boxItems = request.getParameterValues("boxitem");
		marketPrice = request.getParameter("marketPrice").trim();
		currentMarketValue = request.getParameter("currentMarketPrice").trim();
		playStatus = request.getParameter("playStatus").trim();
		sellingStatus = request.getParameter("sellingStatus").trim();
		transaction_date = request.getParameter("transaction_date").trim();
		billNumber = request.getParameter("billing_number").trim();
		release_num = request.getParameter("release_num").trim();

		itemStatus = boxItems[0];

		for (int i = 1; i < boxItems.length; i++) {
			itemStatus = itemStatus + boxItems[i].trim();
		}

		insertIntoDeveloper = "insert into developer (dev_name) values ('"
				+ developer + "')";
		insertIntoGameTransaction = "insert into game_transaction (trans_date,bill_num) values ('"
				+ transaction_date + "','"+billNumber+"')";
		insertIntoPublisher = "insert into publisher (pub_name) values ('"
				+ publisher + "')";

		retreiveDeveloperId = "SELECT dev_id FROM developer ORDER BY dev_id DESC LIMIT 1";
		retreiveTransactionId = "select trans_id from game_transaction ORDER BY trans_id DESC LIMIT 1";
		retreiveGenreId = "select genre_id from genre where genre_name = '"
				+ genre + "'";
		retreivePublisherId = "select pub_id from publisher ORDER BY pub_id DESC LIMIT 1";
		retreiveConditionId = "select cdtn_id from game_condition where condition_type = '"
				+ condition + "'";
		retriveConsoleId = "select console_id from console where console_name= '"
				+ consoleName + "'";
		retriveGameId = "select game_id from game ORDER BY game_id DESC LIMIT 1";

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/vg908", "root", "root");
			Statement stm = con.createStatement();

			stm.executeUpdate(insertIntoDeveloper);
			stm.executeUpdate(insertIntoGameTransaction);
			stm.executeUpdate(insertIntoPublisher);

			ResultSet rs1 = stm.executeQuery(retreiveDeveloperId);
			while (rs1.next()) {
				developerId = rs1.getString("dev_id");
			}

			ResultSet rs2 = stm.executeQuery(retreiveTransactionId);
			while (rs2.next()) {
				transactionId = rs2.getString("trans_id");
			}

			ResultSet rs3 = stm.executeQuery(retreiveGenreId);
			while (rs3.next()) {
				genreId = rs3.getString("genre_id");
			}

			ResultSet rs4 = stm.executeQuery(retreivePublisherId);
			while (rs4.next()) {
				publisherId = rs4.getString("pub_id");
			}

			ResultSet rs5 = stm.executeQuery(retreiveConditionId);
			while (rs5.next()) {
				conditionId = rs5.getString("cdtn_id");
			}

			ResultSet rs6 = stm.executeQuery(retriveConsoleId);
			while (rs6.next()) {
				consoleId = rs6.getString("console_id");
			}

			insertIntoGame = "insert into game (title,game_status,sell_status,item_status,price,market_value,trans_id,genre_id,pub_id,cdtn_id) values ('"
					+ name
					+ "',"
					+ "'"
					+ playStatus
					+ "','"
					+ sellingStatus
					+ "','"
					+ itemStatus
					+ "','"
					+ marketPrice
					+ "','"
					+ currentMarketValue
					+ "','"
					+ transactionId
					+ "','"
					+ genreId
					+ "','"
					+ publisherId
					+ "','"
					+ conditionId
					+ "')";

			stm.executeUpdate(insertIntoGame);

			ResultSet rs7 = stm.executeQuery(retriveGameId);
			while (rs7.next()) {
				gameId = rs7.getString("game_id");
			}

			insertIntoConsole_VG = "insert into console_vg values ('"
					+ consoleId + "','" + gameId + "','" + release_num + "')";
			insertIntoDev_VG = "insert into dev_vg values ('" + developerId
					+ "','" + gameId + "')";

			stm.executeUpdate(insertIntoConsole_VG);

			stm.executeUpdate(insertIntoDev_VG);

			con.close();

			RequestDispatcher rd = request
					.getRequestDispatcher("index.jsp?id1=1");
			rd.forward(request, response);

		} catch (MySQLDataException e) {
			out.println("Internal Server Error");
		}
		catch (Exception e) {
			out.println("Internal Server Error");
		}

	}
}
