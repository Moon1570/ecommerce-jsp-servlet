package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.AreaDao;
import dao.SubAdminDao;
import model.DistrictModel;
import model.DivisionModel;
import model.SubAdminModel;


public class SubAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SubAdminDao sad = new SubAdminDao();
	AreaDao ad = new AreaDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("getAll")) {
			List<SubAdminModel> sams = sad.getAllSubAdmins();
			com.google.gson.JsonObject gson = new JsonObject();
			JsonArray array = new JsonArray();

			java.util.Iterator<SubAdminModel> it = sams.iterator();
			int count = 0;
			while (it.hasNext()) {
				Object type = (Object) it.next();
				JsonObject item = new JsonObject();
				SubAdminModel sub =  (SubAdminModel) type;
				count++;

				item.addProperty("count", count);
				item.addProperty("id", sub.getAdminId());
				item.addProperty("name", sub.getAdminName());
				item.addProperty("phone", sub.getAdminPhone());
				item.addProperty("pass", sub.getAdminPassword());
				item.addProperty("div", sub.getDistrictModel().getDistrictBanglaName());

				array.add(item);

			}

			gson.add("demo", array); 

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			response.getWriter().write(gson.toString());
		} else if(action.equalsIgnoreCase("deleteSad")){

			int sadId = Integer.parseInt(request.getParameter("sadId"));

			SubAdminModel subAdminModel = sad.getSubAdminById(sadId);
			sad.deleteSubAdmin(subAdminModel);

			request.getRequestDispatcher("/view-sub-admin.jsp").forward(request, response);
		} else if(action.equalsIgnoreCase("updateSad")){

			int sadId = Integer.parseInt(request.getParameter("sadId"));

			SubAdminModel sam = sad.getSubAdminById(sadId);
			
			request.setAttribute("sam", sam);
			request.setAttribute("act", "update");
			request.getRequestDispatcher("/new-sub-admin.jsp").forward(request, response);
		} else if (action.equals("addAdmin")) {
			SubAdminModel sam = new SubAdminModel();
			
			System.out.println("sdadsds");

			request.setAttribute("sam", sam);
			request.setAttribute("act", "add");
			request.getRequestDispatcher("/new-sub-admin.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("sadlogout")) {
			HttpSession session=request.getSession();
			session.removeAttribute("samId");
			session.removeAttribute("samName");
			session.removeAttribute("samDis");
			session.removeAttribute("samlogin");
			request.getRequestDispatcher("/sub-admin-login.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("addAdmin")) {
			String sadName = request.getParameter("sadName");
			String sadPhone = request.getParameter("sadPhone");
			String sadPass = request.getParameter("sadPass");
			int disId = Integer.parseInt(request.getParameter("dis"));
			DistrictModel districtModel = ad.getDistrictById(disId);
			
			SubAdminModel sam = new SubAdminModel();
			sam.setAdminName(sadName);
			sam.setAdminPassword(sadPass);
			sam.setAdminPhone(sadPhone);
			sam.setDistrictModel(districtModel);
			
			sad.saveSubAdmin(sam);
			
			request.getRequestDispatcher("/view-sub-admin.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("updateAdmin")) {
			String sadName = request.getParameter("sadName");
			String sadPhone = request.getParameter("sadPhone");
			String sadPass = request.getParameter("sadPass");
			int disId = Integer.parseInt(request.getParameter("dis"));
			DistrictModel districtModel = ad.getDistrictById(disId);
			int samId = Integer.parseInt(request.getParameter("samId"));
			
			SubAdminModel sam = sad.getSubAdminById(samId);
			sam.setAdminName(sadName);
			sam.setAdminPassword(sadPass);
			sam.setAdminPhone(sadPhone);
			sam.setDistrictModel(districtModel);			
			sad.updateSubAdmin(sam);
			
			request.getRequestDispatcher("/view-sub-admin.jsp").forward(request, response);
		} else if(action.equalsIgnoreCase("adminlogin")) {
			
			String name = request.getParameter("adminName");
			String pass = request.getParameter("adminPassword");
			
			SubAdminModel adminModel = sad.getSubAdminByName(name);
			if(adminModel.getAdminName()==null)
			{
				request.setAttribute("message", "Account id Invalid...");
				request.getRequestDispatcher("/sub-admin-login.jsp").forward(request, response);
			}
			else if (name.equalsIgnoreCase(adminModel.getAdminName()) && pass.equalsIgnoreCase(adminModel.getAdminPassword())) {
				int aid = adminModel.getAdminId();
				HttpSession session=request.getSession();
				session.setAttribute("samId", aid);
				session.setAttribute("samName", adminModel.getAdminName());
				session.setAttribute("samDis", adminModel.getDistrictModel().getDistrictId());
				session.setAttribute("samlogin", "true");
				
				request.getRequestDispatcher("/sad-index.jsp").forward(request, response);
			
			}
			
			else {
				request.setAttribute("message", "name or password is invalid...");
				request.setAttribute("action", "login");
				request.getRequestDispatcher("/sub-admin-login.jsp").forward(request, response);
			}
		}
	}

}
