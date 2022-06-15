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
		if (session.getAttribute("adminlogin") == "false" || session.getAttribute("adminlogin") == null) {
			//	request.getRequestDispatcher("admin-login.jsp");
			System.out.println(session.getAttribute("adminlogin"));
			response.sendRedirect("admin-login.jsp");

		} else {
	%>


	<div id="navbar">

		<div class="logo">
			KachaBazar.com <a href="./Homepage.jsp">View Page</a>
		</div>
		
		
<select onChange="window.location.href=this.value" class="form-control float-right" style="width: 10%">
	<option value="#">sub-site</option>
	<option value="./customers?action=login">Customer site</option>
	<option value="./sellers?action=login">Seller site</option>
	<option value="./deliveries?action=view">Delivery site</option>
	<option value="sub-admin-login.jsp">sub-admin site</option>
</select>


		<div class="menu-items">

			<a href="./admin?action=viewprofile">Profile</a> <a
				href="./admin?action=adminlogout">Logout</a>
		</div>
	</div>



	<div class="wrapper-box">
		<div class="side-bar">
			<h2>Menu</h2>
			<ul>
				<li class="options-div" id="order"><a class="options"
					href="#order">Orders</a>
					<div class="sub-menu">
						<a href="./orders?action=view">Inventory Orders</a> <a
							href="seller_orders.jsp">Seller Orders</a>
					</div></li>
				<li class="options-div" id="product"><a class="options"
					href="#product">Products</a>
					<div class="sub-menu">
						<a href="./products?action=new">Add Products</a> <a
							href="./products?action=view">View Products</a>
					</div></li>
				<li class="options-div" id='category'><a class="options"
					href="#category">Category</a>
					<div class="sub-menu">
						<a href="./categories?action=new">Add Category</a> <a
							href="Category.jsp">View Category</a> 
					</div></li>

				<li class="options-div" id="subcat"><a class="options"
					href="#subcat">Sub-Category</a>
					<div class="sub-menu">
						<a class="options"
							href="./subcategories?action=new&page=admin">Add Sub-category</a> <a
							href="./subcategories?action=view&page=admin">View Sub-category</a>
					</div></li>

				<li class="options-div" id="sellers"><a class="options"
					href="#sellers">Sellers</a>
					<div class="sub-menu">
						<a href="./sellers?action=new&page=admin">Add Sellers</a> <a
							href="./sellers?action=view&page=admin">View Sellers</a>
					</div></li>
				<li class="options-div"><a class="options"
					href="./customers?action=view&page=admin">Customers</a></li>
				<li class="options-div" id="deliverer"><a class="options"
					href="#deliverer">Delivery Persons</a>
					<div class="sub-menu">
						<a href="./deliveries?action=add&page=admin">Add Deliverers</a> <a
							href="./deliveries?action=view&page=admin">View Deliverers</a>
					</div></li>

				<li class="options-div" id="area"><a class="options"
					href="#area">Areas</a>
					<div class="sub-menu">
						<a href="./areas?action=divPage&page=admin">Division</a> <a
							href="./areas?action=disPage&page=admin">District</a> <a
							href="./areas?action=upaPage&page=admin">Upazilla</a> <a
							href="./areas?action=uniPage&page=admin">Union</a>
					</div></li>
					
				<li class="options-div" id="subadmin"><a class="options"
					href="view-sub-admin.jsp">Sub Admin</a>
					
					</li>
					<li class="options-div" id="android"><a class="options"
					href="./android?action=getDetails">Android</a>
					
					</li>

			</ul>
		</div>
	</div>


	

	




<div class="container float-right mt-5"
		style="z-index: 5; position: relative;">
		<div class=" my-5">
			<form class="" method="post"
				action="./android?action=submit" id="form">
				<div class="form-group mx-sm-3 mb-2">
					
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="email" name="email" required="required" value="${android.androidemail }" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="text" name="phone" required="required" value="${android.androidPhone }" class="form-control">
						</div>
					</div>
					
					<div class="form-group row">						
						<div class="col-sm-10">
							<input type="text" name="version" required="required" value="${android.androidVersion }" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="text" name="copyright" required="required" value="${android.androidCopyRight }" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<textarea rows="10" cols="96" name="desc" required="required">${android.androidAboutDescription }</textarea>
						</div>
					</div>
					
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">Submit</button>
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