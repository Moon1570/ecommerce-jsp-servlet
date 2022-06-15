package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.*;
import org.joda.time.*;
import org.joda.time.format.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.AreaDao;
import dao.DBData;
import model.DivisionModel;
import model.OrderSellerProductModel;
import model.OrdersModel;
import model.ProductModel;


public class OrderTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	DBData db = new DBData(); 
	AreaDao ad = new AreaDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");

		
		
		if (action.equalsIgnoreCase("getSellerOrders")) {
			List<OrderSellerProductModel> orderSellerProductModels = db.getAllOrderFromSeller();

			com.google.gson.JsonObject gson = new JsonObject();
			JsonArray array = new JsonArray();

			java.util.Iterator<OrderSellerProductModel> it = orderSellerProductModels.iterator();
			int count = 0;
			while (it.hasNext()) {
				Object type = (Object) it.next();
				JsonObject item = new JsonObject();
				OrderSellerProductModel sub =  (OrderSellerProductModel) type;
				count++;

				item.addProperty("count", count);
				item.addProperty("id", sub.getOrderId());
				item.addProperty("odate", sub.getOrderDate());
				item.addProperty("edate", sub.getExpectedDeliveryDate().toString());
				if (sub.getDeliveryPersonModel() == null) {
					item.addProperty("delivery", "Not Assigned");
				}else {
					item.addProperty("delivery", sub.getDeliveryPersonModel().getDeliveryPersonFirstName() + " " + sub.getDeliveryPersonModel().getDeliveryPersonLastName());
				}
				item.addProperty("status", sub.getOrderStatus());
				item.addProperty("seller", sub.getSellerModel().getSellerFirstName()+" "+ sub.getSellerModel().getSellerLastName());
				item.addProperty("paytype", sub.getPaymentType());

				array.add(item);

			}

			gson.add("demo", array); 

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			response.getWriter().write(gson.toString());
		} else if(action.equalsIgnoreCase("getInventoryOrders")) {
			List<OrdersModel> orderSellerProductModels = db.getAllOrders();

			com.google.gson.JsonObject gson = new JsonObject();
			JsonArray array = new JsonArray();

			java.util.Iterator<OrdersModel> it = orderSellerProductModels.iterator();
			int count = 0;
			while (it.hasNext()) {
				Object type = (Object) it.next();
				JsonObject item = new JsonObject();
				OrdersModel sub =  (OrdersModel) type;
				count++;

				item.addProperty("count", count);
				item.addProperty("id", sub.getOrderId());
				item.addProperty("odate", sub.getOrderDate());

				if(sub.getExpectedDeliveryDate() == null) {
					item.addProperty("edate", "No Expectation");
				} else {
					item.addProperty("edate", sub.getExpectedDeliveryDate().toString());
				}

				if (sub.getDeliveryPersonModel() == null) {
					item.addProperty("delivery", "Not Assigned");
				}else {
					item.addProperty("delivery", sub.getDeliveryPersonModel().getDeliveryPersonFirstName() + " " + sub.getDeliveryPersonModel().getDeliveryPersonLastName());
				}
				item.addProperty("status", sub.getOrderStatus());
				item.addProperty("paytype", sub.getPaymentType());

				array.add(item);

			}

			gson.add("demo", array); 

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			response.getWriter().write(gson.toString());
		} else if(action.equals("getInventoryOrdersForSubAdmin")) {
			List<OrdersModel> orderSellerProductModels = db.getAllOrders();

			HttpSession session = request.getSession();

			int disId =  (int) session.getAttribute("samDis");


			com.google.gson.JsonObject gson = new JsonObject();
			JsonArray array = new JsonArray();

			java.util.Iterator<OrdersModel> it = orderSellerProductModels.iterator();
			int count = 0;
			while (it.hasNext()) {
				Object type = (Object) it.next();
				OrdersModel sub =  (OrdersModel) type;

				if (sub.getDistrictModel().getDistrictId() == disId) {
					JsonObject item = new JsonObject();

					count++;

					item.addProperty("count", count);
					item.addProperty("id", sub.getOrderId());
					item.addProperty("odate", sub.getOrderDate());

					if(sub.getExpectedDeliveryDate() == null) {
						item.addProperty("edate", "No Expectation");
					} else {
						item.addProperty("edate", sub.getExpectedDeliveryDate().toString());
					}

					if (sub.getDeliveryPersonModel() == null) {
						item.addProperty("delivery", "Not Assigned");
					}else {
						item.addProperty("delivery", sub.getDeliveryPersonModel().getDeliveryPersonFirstName() + " " + sub.getDeliveryPersonModel().getDeliveryPersonLastName());
					}
					item.addProperty("status", sub.getOrderStatus());
					item.addProperty("paytype", sub.getPaymentType());

					array.add(item);
				}

			}

			gson.add("demo", array); 

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			response.getWriter().write(gson.toString()); 
		} else if(action.equalsIgnoreCase("getSellerOrdersForSad")) {
			List<OrderSellerProductModel> orderSellerProductModels = db.getAllOrderFromSeller();

			HttpSession session = request.getSession();

			int disId =  (int) session.getAttribute("samDis");


			com.google.gson.JsonObject gson = new JsonObject();
			JsonArray array = new JsonArray();

			java.util.Iterator<OrderSellerProductModel> it = orderSellerProductModels.iterator();
			int count = 0;
			while (it.hasNext()) {
				Object type = (Object) it.next();
				OrderSellerProductModel sub =  (OrderSellerProductModel) type;

				if (sub.getDistrictModel().getDistrictId() == disId) {
					JsonObject item = new JsonObject();
					count++;

					item.addProperty("count", count);
					item.addProperty("id", sub.getOrderId());
					item.addProperty("odate", sub.getOrderDate());
					item.addProperty("edate", sub.getExpectedDeliveryDate().toString());
					if (sub.getDeliveryPersonModel() == null) {
						item.addProperty("delivery", "Not Assigned");
					}else {
						item.addProperty("delivery", sub.getDeliveryPersonModel().getDeliveryPersonFirstName() + " " + sub.getDeliveryPersonModel().getDeliveryPersonLastName());
					}
					item.addProperty("status", sub.getOrderStatus());
					item.addProperty("seller", sub.getSellerModel().getSellerFirstName()+" "+ sub.getSellerModel().getSellerLastName());
					item.addProperty("paytype", sub.getPaymentType());

					array.add(item);
				}

			}

			gson.add("demo", array); 

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			response.getWriter().write(gson.toString());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("getReport")) {
			
			HttpSession session = request.getSession();

			int disId =  (int) session.getAttribute("samDis");

			String adminName = session.getAttribute("samName").toString();



			int month = Integer.parseInt(request.getParameter("reportMonth"));
			int year = Integer.parseInt(request.getParameter("reportYear"));

			double cod = 0;
			int codCount = 0;

			double op = 0;
			int opCount = 0;

			double total = 0;

			int totalOrders = 0;
			int completeOrders = 0;
			int CancelledOrders = 0;


			List<OrdersModel>  ordersModels = db.getAllOrders();

			java.util.Iterator<OrdersModel> it = ordersModels.iterator();



			while (it.hasNext()) {
				Object type = (Object) it.next();

				OrdersModel sub =  (OrdersModel) type;

				DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd")
						.withLocale(Locale.UK);

				LocalDate date = formatter.parseLocalDate(sub.getOrderDate());

				if (sub.getDistrictModel().getDistrictId() == disId) {
					System.out.println("dis matched" + date.getYear() + " " + date.getMonthOfYear() +" "+ year +" "+ month);

					if(date.getYear() == year) {
							
						System.out.println("year matched "+ date.getMonthOfYear());
						
						if (date.getMonthOfYear()== month) {

							System.out.println("Month Matched");
							totalOrders++;

							

							if (sub.isPaymentStatus()) {
								System.out.println("paid");

								if (sub.getPaymentType().equalsIgnoreCase("COD")) {
									cod = cod + (sub.getOrderQuantity() * Double.parseDouble(sub.getProductModel().getProductPrice()));
									codCount++;
								} else {
									op = op + (sub.getOrderQuantity() * Double.parseDouble(sub.getProductModel().getProductPrice()));
									opCount++;
								}
							}
						}
					}
				}
			}


			total = cod + op;
			completeOrders = opCount +  codCount;
			CancelledOrders = totalOrders - completeOrders;

			request.setAttribute("totalOrders", totalOrders);
			request.setAttribute("totalSales", total);
			request.setAttribute("CompleteOrders", completeOrders);
			request.setAttribute("cancellerOrders", CancelledOrders);

			request.setAttribute("opCount", opCount);
			request.setAttribute("op", op);
			request.setAttribute("codCount", codCount);
			request.setAttribute("cod", cod);
			
			
			
			////////  Seller Order REport
			
			
			double scod = 0;
			int scodCount = 0;

			double sop = 0;
			int sopCount = 0;

			double stotal = 0;

			int stotalOrders = 0;
			int scompleteOrders = 0;
			int sCancelledOrders = 0;


			List<OrderSellerProductModel>  sordersModels = db.getAllOrderFromSeller();

			java.util.Iterator<OrderSellerProductModel> sit = sordersModels.iterator();



			while (sit.hasNext()) {
				Object type = (Object) sit.next();

				OrderSellerProductModel sub =  (OrderSellerProductModel) type;

				DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd")
						.withLocale(Locale.UK);

				LocalDate date = formatter.parseLocalDate(sub.getOrderDate());

				if (sub.getDistrictModel().getDistrictId() == disId) {
					System.out.println("ssdiv matched" + date.getYear() + " " + date.getMonthOfYear() +" "+ year +" "+ month);

					if(date.getYear() == year) {
							
						System.out.println("ssyear matched "+ date.getMonthOfYear());
						
						if (date.getMonthOfYear()== month) {

							System.out.println("ssMonth Matched");
							stotalOrders++;

							

							if (sub.isPaymentStatus()) {
								System.out.println("sspaid");

								if (sub.getPaymentType().equalsIgnoreCase("COD")) {
									scod = scod + (sub.getOrderQuantity() * sub.getSellersProduct().getProductPrice());
									scodCount++;
								} else {
									sop = sop + (sub.getOrderQuantity() * sub.getSellersProduct().getProductPrice());
									sopCount++;
								}
							}
						}
					}
				}
			}

			 LocalDate localDate = new LocalDate();

			stotal = scod + sop;
			scompleteOrders = sopCount +  scodCount;
			sCancelledOrders = stotalOrders - scompleteOrders;

			request.setAttribute("stotalOrders", stotalOrders);
			request.setAttribute("stotalSales", stotal);
			request.setAttribute("sCompleteOrders", scompleteOrders);
			request.setAttribute("scancellerOrders", sCancelledOrders);

			request.setAttribute("sopCount", sopCount);
			request.setAttribute("sop", sop);
			request.setAttribute("scodCount", scodCount);
			request.setAttribute("scod", scod);
			

			request.setAttribute("report", "Report For "+ month +"-"+ year+" From " + adminName + "("+ad.getDistrictById(disId).getDistrictBanglaName()+")" + " created on "+ localDate);

			request.getRequestDispatcher("/generate-report.jsp").forward(request, response);
		}
	}

}
