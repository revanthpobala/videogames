package com.db.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class MyGames
 */
@WebServlet("/MyGames")
public class MyGames extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String consoleName = null;
	private static String genre = null;
	private static String retreiveStatement = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyGames() {
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

		consoleName = request.getParameter("consoleName");
		genre = request.getParameter("genre");
		JSONObject myJson = new JSONObject();
		List<JSONObject> gameDetails = new ArrayList<JSONObject>();
		JSONObject gameDetail = null;

		try {
			if (consoleName.equals("none")) {
				retreiveStatement = "select g.title, gt.trans_date as Date_of_purchase , gc.condition_type , g.item_status as completeness, g.price , g.market_value as Current_value , g.sell_status as Preference from game as g , game_transaction as gt, game_condition as gc, console_vg as cvg , console as c ,genre as gn where g.trans_id = gt.trans_id and g.cdtn_id = gc.cdtn_id and c.console_id = cvg.console_id and cvg.game_id = g.game_id and gn.genre_id = g.genre_id and gn.genre_name ='"
						+ genre + "'";
			} else if (genre.equals("none")) {
				retreiveStatement = "select g.title, gt.trans_date as Date_of_purchase , gc.condition_type , g.item_status as completeness, g.price , g.market_value as Current_value , g.sell_status as Preference from game as g , game_transaction as gt, game_condition as gc, console_vg as cvg , console as c ,genre as gn where g.trans_id = gt.trans_id and g.cdtn_id = gc.cdtn_id and c.console_id = cvg.console_id and cvg.game_id = g.game_id and gn.genre_id = g.genre_id and c.console_name ='"
						+ consoleName + "'";
			} else {
				retreiveStatement = "select g.title, gt.trans_date as Date_of_purchase , gc.condition_type , g.item_status as completeness, g.price , g.market_value as Current_value , g.sell_status as Preference from game as g , game_transaction as gt, game_condition as gc, console_vg as cvg , console as c ,genre as gn where g.trans_id = gt.trans_id and g.cdtn_id = gc.cdtn_id and c.console_id = cvg.console_id and cvg.game_id = g.game_id and gn.genre_id = g.genre_id and (c.console_name ='"
						+ consoleName + "' and gn.genre_name ='" + genre + "')";
			}
			Class.forName("com.mysql.jdbc.Driver");// out.println("HI");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/vg908", "root", "root");
			// out.println(con);
			Statement stm = con.createStatement();

			ResultSet rs1 = stm.executeQuery(retreiveStatement);
			while (rs1.next()) {
				gameDetail = new JSONObject();
				gameDetail.put("title", rs1.getString("title"));
				gameDetail.put("date_of_purchase", rs1.getString("Date_of_purchase"));
				gameDetail.put("condition_type", rs1.getString("condition_type"));
				gameDetail.put("completeness", rs1.getString("completeness"));
				gameDetail.put("price", rs1.getString("price"));
				gameDetail.put("current_value", rs1.getString("Current_Value"));
				gameDetail.put("preference", rs1.getString("Preference"));
				gameDetails.add(gameDetail);
			}
			myJson.put("Games", gameDetails);
			out.write(myJson.toString());
		} catch (Exception e) {

		}
	}
}
