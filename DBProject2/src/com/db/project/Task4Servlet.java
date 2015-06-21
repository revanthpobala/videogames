package com.db.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class Task4Servlet
 */
@WebServlet("/Task4Servlet")
public class Task4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String retreiveStatement = null;
	
	private static String query1;
	private static String query2;
	private static String query3;
	private static String query4;
	private static String query5;
	private static String query6;
	private static String query7;
	private static String query8;
	private static String query9;
	private static String query10;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Task4Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		query1 = request.getParameter("query1");
		query2 = request.getParameter("query2");
		query3 = request.getParameter("query3");
		query4 = request.getParameter("query4");
		query5 = request.getParameter("query5");
		query6 = request.getParameter("query6");
		query7 = request.getParameter("query7");
		query8 = request.getParameter("query8");
		query9 = request.getParameter("query9");
		query10 = request.getParameter("query10");

		JSONObject myJson = new JSONObject();
		JSONObject task4Query = null;
		List<JSONObject> queries = new ArrayList<JSONObject>();

		try {
			Class.forName("com.mysql.jdbc.Driver");// out.println("HI");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/vg908", "root", "root");
			// out.println(con);
			Statement stm = con.createStatement();
			if (!(query1==null)) {
				retreiveStatement = "select distinct  title , count(title)count   from game group by title having count>0 ";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					task4Query.put("count", rs1.getString("count"));
					queries.add(task4Query);
				}
			} else if (!(query2==null)) {
				retreiveStatement = "select distinct  title , count(title)count   from game group by title having count>1";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					task4Query.put("count", rs1.getString("count"));
					queries.add(task4Query);
				}
			} else if (!(query3==null)) {
				retreiveStatement = "select sum(market_value)total_cost , console_name from console as c , game as g   , console_vg as cv where c.console_id = cv.console_id and cv.game_id = g.game_id group by console_name";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("total_cost", rs1.getString("total_cost"));
					task4Query.put("console_name",
							rs1.getString("console_name"));
					queries.add(task4Query);
				}
			} else if (!(query4==null)) {
				retreiveStatement = "select title , item_status as completeness from  game as g";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					task4Query.put("completeness",
							rs1.getString("completeness"));
					queries.add(task4Query);
				}
			} else if (!(query5==null)) {
				retreiveStatement = "select title , market_value from game as g   order by market_value desc limit 100";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					task4Query.put("market_value",
							rs1.getString("market_value"));
					queries.add(task4Query);
				}
			} else if (!(query6==null)) {
				retreiveStatement = "select title, market_value, price  from game as g  where price < market_value order by price";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					task4Query.put("market_value",
							rs1.getString("market_value"));
					task4Query.put("price", rs1.getString("price"));
					queries.add(task4Query);
				}
			} else if (!(query7==null)) {
				retreiveStatement = "select title from game  where sell_status = 'wants to keep'";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					queries.add(task4Query);
				}
			} else if (!(query8==null)) {
				retreiveStatement = "select title from game  where game_status = 'wants to play'";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("title", rs1.getString("title"));
					queries.add(task4Query);
				}
			} else if (!(query9==null)) {
				retreiveStatement = "SELECT MONTH(trans_date) as mon,YEAR(trans_date) as yr, SUM(price) as Monthly_Expenditure FROM game as g, game_transaction as gt Where gt.trans_id = g.trans_id GROUP BY MONTH(trans_date),year(trans_date) ORDER BY YEAR(trans_date)";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("mon", rs1.getString("mon"));
					task4Query.put("yr", rs1.getString("yr"));
					task4Query.put("mon_ex",
							rs1.getString("Monthly_Expenditure"));
					queries.add(task4Query);
				}
			} else if (!(query10==null)) {
				retreiveStatement = "select title as Highest_Increased_game , (market_value - price) as Increase_Is_Of from game as g group by title having Increase_Is_Of>0 order by Increase_Is_Of desc limit 1";
				ResultSet rs1 = stm.executeQuery(retreiveStatement);
				while (rs1.next()) {
					task4Query = new JSONObject();
					task4Query.put("highest_increase",
							rs1.getString("Highest_Increased_game"));
					task4Query.put("increase", rs1.getString("Increase_Is_Of"));
					queries.add(task4Query);
				}
			}

			myJson.put("Games", queries);
			out.write(myJson.toString());
		} catch (Exception e) {

		}
	}

}
