<%@page import="model.DivisionModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.DBData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" href="./css/menubar.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<title>Admin</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins&display=swap"
	rel="stylesheet">

<script type="text/javascript">
	function loadDistricts(str) {
		var xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {

				var o = JSON.parse(this.responseText); // is a javascript object
				json = JSON.stringify(o)

				var ele = document.getElementById('districtsDropDown');
				ele.innerHTML = "";
				for (x in o) {

					ele.innerHTML = ele.innerHTML
							+ '<option value="' + x + '">' + o[x] + '</option>';
				}
				/*
				for (x in o) {
					document.getElementById("divisions").innerHTML += x + o[x]
							+ "</br>";
				}
				 */
			}

		};
		xhttp.open("GET",
				"./dropdown?divisionsId=" + str + "&action=divisions", true);
		xhttp.send();
		//alert("Hello...")

	}
</script>
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
		<div class="search">
			<input class="search-box" placeholder="Type to search"> <input
				type="submit" class="search-button" value="Search">
		</div>
		<div class="menu-items">
			<a class="active" href="index.jsp">Home</a> <a
				href="./admin?action=viewprofile">Profile</a> <a
				href="./admin?action=adminlogout">Logout</a>
		</div>
	</div>



	<c:choose>
		<c:when test="${page == 'sad'}">
		
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
		
	 	</c:when>
	 	
	 	
		<c:otherwise>
		
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

			</ul>
		</div>
	</div>

		
 		</c:otherwise>
	</c:choose>

	<%
		DBData db = new DBData();
		List<DivisionModel>divisionModels = db.getAllDivision();
		request.setAttribute("divi", divisionModels);
	%>


	<div class="container float-right mt-5 "
		style="z-index: 5; position: relative;">
		<hr
			style="-moz-border-bottom-colors: none; -moz-border-image: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; border-color: #EEEEEE -moz-use-text-color #FFFFFF; border-style: solid none; border-width: 3px 0; margin: 10px 0;">
		
		<h1 class="text-center">Add Sub-admin</h1>
<hr
			style="-moz-border-bottom-colors: none; -moz-border-image: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; border-color: #EEEEEE -moz-use-text-color #FFFFFF; border-style: solid none; border-width: 3px 0; margin: 0px 0;">
		<div class=" my-5">
			<form method="post" action="./subadmins">
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputEmail3"
							placeholder="Name" value="${sam.adminName }" required="required" name="sadName">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Phone</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputPassword3"
							placeholder="Phone" value="${sam.adminPhone }" required="required" name="sadPhone">
					</div>
				</div>
				<div class="form-group row">
					<label for="div" class="col-sm-2 col-form-label">Division</label>
					<div class="col-sm-10">
						<select class="form-control" id="div" required="required" name="div" onchange="loadDistricts(this.value)">
						
						<c:if test = "${act == 'update'}">
							<option value="${sam.districtModel.divisionModel.divisionId }" selected="selected">${sam.districtModel.divisionModel.divisionBanglaName }</option>
						</c:if>
						
						<c:forEach items="${divi }" var="divi">
							<option value="${divi.divisionId }">${divi.divisionBanglaName }</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="div" class="col-sm-2 col-form-label">District</label>
					<div class="col-sm-10">
						<select class="form-control" id="districtsDropDown" required="required" name="dis" >
						
						<c:if test = "${act == 'update'}">
							<option value="${sam.districtModel.districtId }" selected="selected">${sam.districtModel.districtBanglaName }</option>
						</c:if>
						
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword4" class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputPassword4"
							placeholder="Password" value="${sam.adminPassword }" required="required" name="sadPass">
					</div>
				</div>
				
				<c:if test = "${act == 'add'}">
				
					<input name="action" type="hidden" value="addAdmin">
				</c:if>
				
				<c:if test = "${act == 'update'}">
					<input name="action" type="hidden" value="updateAdmin">
					<input name="samId" type="hidden" value="${sam.adminId}">
				</c:if>
				
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">Add Sub-Admin </button>
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