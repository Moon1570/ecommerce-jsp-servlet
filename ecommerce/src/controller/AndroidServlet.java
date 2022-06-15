package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.DBData;
import model.AndroidModel;


public class AndroidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DBData db = new DBData();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		if (action.equals("getDetails")) {
			AndroidModel androidModel = new AndroidModel();
			androidModel = db.getAndroidDetails();
			request.setAttribute("android", androidModel);
			request.getRequestDispatcher("/android.jsp").forward(request, response);
		} else if(action.equals("getDetailsForApp")) {
			AndroidModel androidModel = new AndroidModel();
			androidModel = db.getAndroidDetails();
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObject = new JSONObject();
			
			try {
				jsonObject.put("copyright", androidModel.getAndroidCopyRight());
				jsonObject.put("version", androidModel.getAndroidVersion());
				jsonObject.put("email", androidModel.getAndroidemail());
				jsonObject.put("phone", androidModel.getAndroidPhone());
				jsonObject.put("desc", androidModel.getAndroidAboutDescription());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			jsonArray.put(jsonObject);
			
			PrintWriter pw = response.getWriter();
			pw.write(jsonArray.toString());
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		if (action.equals("submit")) {
			String email, phone, version, copyright, desc;
			
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			version = request.getParameter("version");
			copyright = request.getParameter("copyright");
			desc = request.getParameter("desc");
			
			AndroidModel android = new AndroidModel();
			
			android.setAndroidAboutDescription(desc);
			android.setAndroidCopyRight(copyright);
			android.setAndroidemail(email);
			android.setAndroidPhone(phone);
			android.setAndroidVersion(version);
			android.setAndroidId(1);
			
			db.updateAndroidDetails(android);
			
			AndroidModel androidModel2 = new AndroidModel();
			androidModel2 = db.getAndroidDetails();
			request.setAttribute("android", androidModel2);
			
			request.getRequestDispatcher("/android.jsp").forward(request, response);
		}
	}

}
