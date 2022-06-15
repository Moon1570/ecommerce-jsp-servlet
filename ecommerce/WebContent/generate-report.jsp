<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	<!-- 
	content of this area will be the content of your PDF file 
	-->
	<a href="#" class="btn btn-primary float-right" onclick="HTMLtoPDF()">Download PDF</a>
	<div id="HTMLtoPDF" class="container">



		<h3>${report }</h3>
		<hr
			style="-moz-border-bottom-colors: none; -moz-border-image: none; -moz-border-left-colors: none; -moz-border-right-colors: none; -moz-border-top-colors: none; border-color: #EEEEEE -moz-use-text-color #FFFFFF; border-style: solid none; border-width: 3px 0; margin: 10px 0;">

		<table class="table table-hover text-center">


			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col" >Inventory Report</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Total Orders = ${totalOrders }</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Total Sales = ${totalSales }BDT</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Completed Orders = ${CompleteOrders }</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>Incomplete Orders = ${cancellerOrders }</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>Total Online Payment(${opCount }) = ${op}BDT</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td>Total COD(${codCount }) = ${cod }BDT</td>
				</tr>

			</tbody>
		</table>
		
		<table class="table table-hover text-center">


			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col" >Seller Orders Report</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Total Orders = ${stotalOrders }</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Total Sales = ${stotalSales }BDT</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Completed Orders = ${sCompleteOrders }</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td>Incomplete Orders = ${scancellerOrders }</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td>Total Online Payment(${sopCount }) = ${sop}BDT</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td>Total COD(${scodCount }) = ${scod }BDT</td>
				</tr>

			</tbody>
		</table>



	</div>

	<!-- here we call the function that makes PDF -->
	

	<!-- these js files are used for making PDF -->
	<script src="javascript/jpdf.js"></script>
	<script src="javascript/jquery.js"></script>
	<script src="javascript/HTMLtoPDF.js"></script>
</body>
</html>