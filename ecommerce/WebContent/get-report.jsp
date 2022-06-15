<%@page import="model.OrderSellerProductModel"%>
<%@page import="controller.OrderFromSeller"%>
<%@page import="model.OrdersModel"%>
<%@page import="model.DeliveryPersonModel"%>
<%@page import="model.SellerModel"%>
<%@page import="model.CustomerModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.DBData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<!-- 
<script src="javascript/jquery.js"></script>
<script>
	$(document).ready(function() {
		$('#dd1').change(function() {
			fillOptions('dd2', this);
		});
		$('#dd2').change(function() {
			fillOptions('dd3', this);
		});
	});
	function fillOptions(ddId, callingElement) {
		var dd = $('#' + ddId);
		$.getJSON(
				'dropdown?dd=' + ddId + '&val=' + $(callingElement).val(),
				function(opts) {
					$('>option', dd).remove(); // Clean old options first.
					if (opts) {
						$.each(opts, function(key, value) {
							dd.append($('<option/>').val(key).text(value));
						});
					} else {
						dd.append($('<option/>').text("Please select parent"));
					}
				});
	}
</script>

 -->


<head>
<link rel="stylesheet" href="./css/menubar.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4-4.1.1/jq-3.3.1/dt-1.10.20/b-1.6.1/b-flash-1.6.1/datatables.min.js"></script>
<title>Admin</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
	rel="stylesheet">
</head>
<body>

	<%
		session = request.getSession();
		if (session.getAttribute("samlogin") == "false" || session.getAttribute("samlogin") == null) {
			//	request.getRequestDispatcher("admin-login.jsp");
			System.out.println(session.getAttribute("adminlogin"));
			response.sendRedirect("sub-admin-login.jsp");

		} else {
	%>


	<div id="navbar">

		<div class="logo">
			KachaBazar.com <a href="./Homepage.jsp">View Page</a>
		</div>


		<div class="menu-items">
			<a
				href="./subadmins?action=sadlogout">Logout</a>
		</div>
	</div>



	<div class="wrapper-box">
		<div class="side-bar">
			<h2>Menu</h2>
			<ul>
				<li class="options-div" id="order"><a class="options"
					href="#order">Orders</a>
					<div class="sub-menu">
						<a href="./orders?action=viewsad">Inventory Orders</a> <a
							href="sad-seller-orders.jsp">Seller Orders</a>
					</div></li>
				
				<li class="options-div" id="sellers"><a class="options"
					href="#sellers">Sellers</a>
					<div class="sub-menu">
						<a href="./sellers?action=new&page=sad">Add Sellers</a> <a
							href="./sellers?action=view&page=sad">View Sellers</a>
					</div></li>
				<li class="options-div"><a class="options"
					href="./customers?action=view&page=sad">Customers</a></li>
				<li class="options-div" id="deliverer"><a class="options"
					href="#deliverer">Delivery Persons</a>
					<div class="sub-menu">
						<a href="./deliveries?action=add&page=sad">Add Deliverers</a> <a
							href="./deliveries?action=view&page=sad">View Deliverers</a>
					</div></li>

				<li class="options-div" id="area"><a class="options"
					href="#area">Areas</a>
					<div class="sub-menu">
						<a href="./areas?action=divPage&page=sad">Division</a> <a
							href="./areas?action=disPage&page=sad">District</a> <a
							href="./areas?action=upaPage&page=sad">Upazilla</a> <a
							href="./areas?action=uniPage&page=sad">Union</a>
					</div></li>
					
				<li class="options-div" id="report"><a class="options"
					href="get-report.jsp">Report Generate</a>
					</li>

			</ul>
		</div>
	</div>




	<div class="container float-right my-5"
		style="z-index: -1; position: relative;">

		<div class=" my-3">

			<form action="./ordertable" method="post">
				<div class="row my-3">
					<div class="col">

						<input class="form-control" name="reportMonth"
							placeholder="Enter number of the month">
					</div>
				</div>

				<div class="row my-3">
					<div class="col">

						<input class="form-control" name="reportYear"
							placeholder="Enter number of the year">
					</div>
				</div>
				<input type="hidden" value="getReport"  name="action"> 

				<div class="row my-3">
					<div class="col">

						<button name="submit" type="submit"
							class="btn btn-primary d-block">Submit</button>

					</div>
				</div>



			</form>

		</div>
	</div>


	<%
		}
	%>

</body>
</html>