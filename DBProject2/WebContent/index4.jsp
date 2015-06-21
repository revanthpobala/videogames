<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<html>

	<head>
		<script src="https://code.jquery.com/jquery-2.1.3.min.js">
		</script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
		</script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/paper/bootstrap.min.css" />
		<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/annyang/1.6.0/annyang.min.js"></script> -->
		<script>
			/* function speech()
			{
				if (annyang)
				{
					var queries = {
						'one': function()
						{
							answer1();
							$.getJSON("Task4Servlet",
							{
								"query1": "firstQuery"
							}, function(result)
							{
								$("#div_Result1").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th  class='danger'>Title</th><th class='danger'>Count</th></table>"
								);
								$.each(result, function(i, data)
								{
									window.console.log(result);
									$.each(data, function(i, value)
									{
										var table = $("#div_Result1").children();
										table.append("<tr class='success' ><td>" + value.title +
											"</td><td>" + value.count + "</td></tr>");
									});
								});
							});
						},
						'two': function()
						{
							answer2();
							$.getJSON("Task4Servlet",
							{
								"query2": "secondQuery"
							}, function(result)
							{
								$("#div_Result2").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Count</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result2").children();
										table.append("<tr class='success' ><td>" + value.title +
											"</td><td>" + value.count + "</td></tr>");
									});
								});
							});
						},
						'three': function()
						{
							answer3();
							$.getJSON("Task4Servlet",
							{
								"query3": "thirdQuery"
							}, function(result)
							{
								$("#div_Result3").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Total Cost</th><th class='danger'>Console Name</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result3").children();
										table.append("<tr class='success' ><td>" + value.total_cost +
											"</td><td>" + value.console_name + "</td></tr>");
									});
								});
							});
						},
						'four': function()
						{
							answer4();
							$.getJSON("Task4Servlet",
							{
								"query4": "fourthQuery"
							}, function(result)
							{
								$("#div_Result4").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Completeness</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result4").children();
										table.append("<tr class= 'success' ><td>" + value.title +
											"</td><td>" + value.completeness + "</td></tr>");
									});
								});
							});
						},
						'five': function()
						{
							answer5();
							$.getJSON("Task4Servlet",
							{
								"query5": "fifthQuery"
							}, function(result)
							{
								$("#div_Result5").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Market Value</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result5").children();
										table.append("<tr class= 'success' ><td>" + value.title +
											"</td><td>" + value.market_value + "</td></tr>");
									});
								});
							});
						},
						'six': function()
						{
							answer6();
							$.getJSON("Task4Servlet",
							{
								"query6": "sixthQuery"
							}, function(result)
							{
								$("#div_Result6").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Market Value</th><th class='danger'>Price</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result6").children();
										table.append("<tr class='success' ><td>" + value.title +
											"</td><td>" + value.market_value + "</td><td>" + value.price +
											"</td></tr>");
									});
								});
							});
						},
						'seven': function()
						{
							answer7();
							$.getJSON("Task4Servlet",
							{
								"query7": "seventhQuery"
							}, function(result)
							{
								$("#div_Result7").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result7").children();
										table.append("<tr class='success' ><td>" + value.title +
											"</td></tr>");
									});
								});
							});
						},
						'eight': function()
						{
							answer8();
							$.getJSON("Task4Servlet",
							{
								"query8": "eighthQuery"
							}, function(result)
							{
								$("#div_Result8").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result8").children();
										table.append("<tr class='success'><td>" + value.title +
											"</td></tr>");
									});
								});
							});
						},
						'nine': function()
						{
							answer9();
							$.getJSON("Task4Servlet",
							{
								"query9": "ninthQuery"
							}, function(result)
							{
								$("#div_Result9").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Month</th><th class='danger'>Year</th><th class='danger'>Monthly Expenditure</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result9").children();
										table.append("<tr class='success' ><td>" + value.mon +
											"</td><td>" + value.yr + "</td><td>" + value.mon_ex +
											"</td></tr>");
									});
								});
							});
						},
						'ten': function()
						{
							answer10();
							$.getJSON("Task4Servlet",
							{
								"query10": "tenthQuery"
							}, function(result)
							{
								$("#div_Result10").append(
									"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Highest Increase</th><th class='danger'>Increase</th></table>"
								);
								$.each(result, function(i, data)
								{
									$.each(data, function(i, value)
									{
										var table = $("#div_Result10").children();
										table.append("<tr class='success' ><td>" + value.highest_increase +
											"</td><td>" + value.increase + "</td></tr>");
									});
								});
							});
						},
						'cancel' : function(){
							$('button').click( function (){alert("clicked");}).modal('hide');
						}
					};
					annyang.addCommands(queries);
					annyang.start(
					{
						autoRestart: true,
						continuous: true
					});
					annyang.debug();
					annyang.setLanguage('en-US');
				}
			}

 */			function answer1()
			{
				$("#answeri").modal('show');
				
			}

			function answer2()
			{
				$("#answerii").modal('show');
			}

			function answer3()
			{
				$("#answeriii").modal('show');
			}

			function answer4()
			{
				$("#answeriv").modal('show');
			}

			function answer5()
			{
				$("#answerv	").modal('show');
			}

			function answer6()
			{
				$("#answervi	").modal('show');
			}

			function answer7()
			{
				$("#answervii	").modal('show');
			}

			function answer8()
			{
				$("#answerviii	").modal('show');
			}

			function answer9()
			{
				$("#answerix	").modal('show');
			}

			function answer10()
			{
				$("#answerx	").modal('show');
			}
		</script>
		<script>
			$(document).ready(function()
			{
				$(
					"#answer1,#answer2,#answer3,#answer4,#answer5,#answer6,#answer7,#answer8,#answer9,#answer10"
				).click(function()
				{
					$('#div_Result1').empty();
					$('#div_Result2').empty();
					$('#div_Result3').empty();
					$('#div_Result4').empty();
					$('#div_Result5').empty();
					$('#div_Result6').empty();
					$('#div_Result7').empty();
					$('#div_Result8').empty();
					$('#div_Result9').empty();
					$('#div_Result10').empty();
					if ($(event.target).attr('id') == 'answer1')
					{
						$.getJSON("Task4Servlet",
						{
							"query1": "firstQuery"
						}, function(result)
						{
							$("#div_Result1").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th  class='danger'>Title</th><th class='danger'>Count</th></table>"
							);
							$.each(result, function(i, data)
							{
								window.console.log(result);
								$.each(data, function(i, value)
								{
									var table = $("#div_Result1").children();
									table.append("<tr class='success' ><td>" + value.title +
										"</td><td>" + value.count + "</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer2')
					{
						$.getJSON("Task4Servlet",
						{
							"query2": "secondQuery"
						}, function(result)
						{
							$("#div_Result2").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Count</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result2").children();
									table.append("<tr class='success' ><td>" + value.title +
										"</td><td>" + value.count + "</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer3')
					{
						$.getJSON("Task4Servlet",
						{
							"query3": "thirdQuery"
						}, function(result)
						{
							$("#div_Result3").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Total Cost</th><th class='danger'>Console Name</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result3").children();
									table.append("<tr class='success' ><td>" + value.total_cost +
										"</td><td>" + value.console_name + "</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer4')
					{
						$.getJSON("Task4Servlet",
						{
							"query4": "fourthQuery"
						}, function(result)
						{
							$("#div_Result4").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Completeness</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result4").children();
									table.append("<tr class= 'success' ><td>" + value.title +
										"</td><td>" + value.completeness + "</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer5')
					{
						$.getJSON("Task4Servlet",
						{
							"query5": "fifthQuery"
						}, function(result)
						{
							$("#div_Result5").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Market Value</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result5").children();
									table.append("<tr class= 'success' ><td>" + value.title +
										"</td><td>" + value.market_value + "</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer6')
					{
						$.getJSON("Task4Servlet",
						{
							"query6": "sixthQuery"
						}, function(result)
						{
							$("#div_Result6").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th><th class='danger'>Market Value</th><th class='danger'>Price</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result6").children();
									table.append("<tr class='success' ><td>" + value.title +
										"</td><td>" + value.market_value + "</td><td>" + value.price +
										"</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer7')
					{
						$.getJSON("Task4Servlet",
						{
							"query7": "seventhQuery"
						}, function(result)
						{
							$("#div_Result7").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result7").children();
									table.append("<tr class='success' ><td>" + value.title +
										"</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer8')
					{
						$.getJSON("Task4Servlet",
						{
							"query8": "eighthQuery"
						}, function(result)
						{
							$("#div_Result8").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Title</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result8").children();
									table.append("<tr class='success'><td>" + value.title +
										"</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer9')
					{
						$.getJSON("Task4Servlet",
						{
							"query9": "ninthQuery"
						}, function(result)
						{
							$("#div_Result9").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Month</th><th class='danger'>Year</th><th class='danger'>Monthly Expenditure</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result9").children();
									table.append("<tr class='success' ><td>" + value.mon +
										"</td><td>" + value.yr + "</td><td>" + value.mon_ex +
										"</td></tr>");
								});
							});
						});
					}
					else if ($(event.target).attr('id') == 'answer10')
					{
						$.getJSON("Task4Servlet",
						{
							"query10": "tenthQuery"
						}, function(result)
						{
							$("#div_Result10").append(
								"<table style='width:100%'class='table table-striped table-hover danger'><tr><th class='danger'>Highest Increase</th><th class='danger'>Increase</th></table>"
							);
							$.each(result, function(i, data)
							{
								$.each(data, function(i, value)
								{
									var table = $("#div_Result10").children();
									table.append("<tr class='success' ><td>" + value.highest_increase +
										"</td><td>" + value.increase + "</td></tr>");
								});
							});
						});
					}
				});
			});
		</script>
	</head>

	<body style="background-color:#D7D7D7;" onload="speech();">
		<!-- Header -->
		<div class="navbar navbar-inverse">
			<div class="navbar-header" style="background-color:transparent;">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<center><a class="navbar-brand" style="font-size:25px;" href="index.jsp">Videogame</a> </center>
			</div>
			<div class="navbar-collapse collapse navbar-inverse-collapse">
				<ul class="nav navbar-nav"> </ul>
				<form class="navbar-form navbar-right"> </form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"> <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Questions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp">Home</a></li>
							<li class="divider"> </li>
							<li><a href="index3.jsp">Question 2</a></li>
						</ul>
					</li>
				</ul>
				</li>
				</ul>
			</div>
		</div>
		<!-- Header end -->
		<center>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>1) The number of unique games per system (exclude the duplicates) </h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer1" onclick="answer1();">Result</button>
						</center>
						<div class="modal" id="answeri">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result1"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>2) A list with the duplicate games in the collection (each duplicate game should
appear once and next to this we want to know the total number of copies)
</h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer2" onclick="answer2();">Result</button>
						</center>
						<div class="modal" id="answerii" aria-hidden="true" style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result2"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-1"></div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>3) The total cost of the collection based on the current value, grouped by console
 </h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer3" onclick="answer3();">Result</button>
						</center>
						<div class="modal" id="answeriii" aria-hidden="true" style="display: none;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result3"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>4) The complete games and the games missing something (box and/or manual) </h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer4" onclick="answer4();">Result</button>
						</center>
						<div class="modal" id="answeriv">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result4"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>5) The top 100 most expensive videogames (based on the current market value)
</h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer5" onclick="answer5();">Result</button>
						</center>
						<div class="modal" id="answerv">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result5"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="jumbotron">
					<center>
						<h4>6) The games the collector purchased for a price lower than current market price
 </h4> </center>
					<br>
					<br>
					<center>
						<button class="btn btn-primary" id="answer6" onclick="answer6();">Result</button>
					</center>
					<div class="modal" id="answervi">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<center>
										<h4 class="modal-title">Result</h4></center>
								</div>
								<div class="modal-body">
									<div class="col-lg-12" id="div_Result6"> </div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>7) A list of the videogames that the collector wants to keep</h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer7" onclick="answer7();">Result</button>
						</center>
						<div class="modal" id="answervii">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result7"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="jumbotron">
					<center>
						<h4>8) A list of the videogames that the collector wants to play
 </h4> </center>
					<br>
					<br>
					<center>
						<button class="btn btn-primary" id="answer8" onclick="answer8();">Result</button>
					</center>
					<div class="modal" id="answerviii">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<center>
										<h4 class="modal-title">Result</h4></center>
								</div>
								<div class="modal-body">
									<div class="col-lg-12" id="div_Result8"> </div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>9) The total money that the collector has spent every month
</h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer9" onclick="answer9();">Result</button>
						</center>
						<div class="modal" id="answerix">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result9"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="jumbotron">
						<center>
							<h4>10) The game that has the highest increase in value (current value minus money
paid) for and what is this increase</h4> </center>
						<br>
						<br>
						<center>
							<button class="btn btn-primary" id="answer10" onclick="answer10();">Result</button>
						</center>
						<div class="modal" id="answerx">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<center>
											<h4 class="modal-title">Result</h4></center>
									</div>
									<div class="modal-body">
										<div class="col-lg-12" id="div_Result10"> </div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</center>
	</body>

	</html>