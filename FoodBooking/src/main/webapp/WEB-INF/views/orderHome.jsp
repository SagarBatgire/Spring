<%@page import="com.project.model.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Contact V1</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor_order/bootstrap/css_order/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts_order/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor_order/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor_order/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor_order/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css_order/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css_order/main.css">
<!--===============================================================================================-->

<script>
	function fun(obj)
	{
		console.log(obj.options[obj.selectedIndex].id+" selected!");
		if(obj.options[obj.selectedIndex].id!="pizza")
			{
				console.log("in Fun() value: "+obj.value);
				console.log("name Test "+obj.name);
				var input = document.createElement("input");
				
				var type = document.createAttribute("type");
				type.value = "text";
				var placeHolder = document.createAttribute("placeholder");
				placeHolder.value=obj.value;
				var className=document.createAttribute("class");
				className.value="input1";
				var name=document.createAttribute("name");
				name.value="menuItem";
				var id=document.createAttribute("id");
				id.value=obj.options[obj.selectedIndex].id;
				
				
				input.setAttributeNode(type);
				input.setAttributeNode(placeHolder);
				input.setAttributeNode(className);
				input.setAttributeNode(id);
				input.setAttributeNode(name);
				document.getElementById("mealDiv").appendChild(input);
				
				var lineBreak = document.createElement("br");
				document.getElementById("mealDiv").appendChild(lineBreak);
				
				document.getElementsByName(obj.name)[0].selectedIndex.disabled="true";
				document.getElementById("foodImage").src="/controller/resources/images/"+obj.options[obj.selectedIndex].id+".png";
			}
	}
	
	function getImage(obj)
	{
		
		console.log("click!");
		console.log(obj.options[obj.selectedIndex].name+" selected!");
		
	}
	
	function getMenu()
	{
		/* console.log(document.getElementsByName("menuItem")[0].id);
		console.log(document.getElementsByName("menuItem").length); */
		
		var n=document.getElementsByName("menuItem").length;
		console.log("n= "+n);
		var i=0;
		var data="";
		for(i=0;i<n;i++)
			{
			data+=document.getElementsByName("menuItem")[i].id+",";
			console.log(document.getElementsByName("menuItem")[i].id);
			}
			
		
		var xhttp=new XMLHttpRequest();
		xhttp.open("POST", "/controller/uploadMenu", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("data="+data);
		
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4) {
		      console.log("ajax response: "+this.responseText);
		      if(this.responseText=="done")
		    	  {
		    	  	document.getElementById("menuHeading").innerText="Menu Uploaded Successfully!";
		    	  }
		    }
		  };
		  
	}
</script>
</head>
<body>
	<div class="container-login100"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/food.jpg');">
		<div class="container-contact1">
			<div class="contact1-pic js-tilt" data-tilt>
				<img id="foodImage"
					src="${pageContext.request.contextPath}/resources/images/pizza.png"
					alt="IMG">
			</div>

			<div class="contact1-pic js-tilt" data-tilt id="mealDiv">
				<form method="GET" action="#">
					<span class="contact1-form-title" id="menuHeading"> Menu
						Contents </span>
					<div class="container-contact1-form-btn">
						<button class="contact1-form-btn">
							<span onClick="getMenu()"> Upload Menu <i
								class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</span>
						</button>

					</div>
					<br>
				</form>
			</div>

			<form class="contact1-form validate-form">
				<span class="contact1-form-title"> Upload Menu Details </span>

				<h4>Rice</h4>
				<div class="wrap-input1 validate-input"
					data-validate="Subject is required">
					<select class="input1" name="rice" onChange="fun(this)">
						<option id="pizza" class="input1" type="text" name="rice"
							placeholder="Subject">Select</option>
						<%
						ArrayList<Food>foodList=(ArrayList<Food>)request.getAttribute("foodList");
						for(Food food:foodList)
						{
							if(food.getCatId()==1)
							{
					%>

						<option id=<%=food.getFoodId() %> class="input1" type="text" name="rice"
							placeholder="Subject"><%=food.getFoodName() %></option>

						<%		}
							
							
						}
					%>

					</select> <span class="shadow-input1"></span>
				</div>


				<h4>Dal</h4>
				<div class="wrap-input1 validate-input"
					data-validate="Subject is required">
					<select class="input1" name="dal" onChange="fun(this)">
						<option id="pizza" class="pizza" type="text" name="subject"
							placeholder="Subject">Select</option>
						<%
						
						for(Food food:foodList)
						{
							if(food.getCatId()==2)
							{
					%>

						<option id=<%=food.getFoodId() %> class="input1" type="text" name="rice"
							placeholder="Subject"><%=food.getFoodName() %></option>

						<%		}
						}
					%>
					</select> <span class="shadow-input1"></span>
				</div>

			</form>
		</div>
	</div>




	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor_order/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor_order/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor_order/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor_order/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor_order/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>

	</script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/js_order/main.js"></script>

</body>
</html>
