<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<html>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<head>
		<script src="https://code.jquery.com/jquery-2.1.3.min.js">
		</script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
		</script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/annyang/1.6.0/annyang.min.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/paper/bootstrap.min.css" />
		<script>
			/* function speech()
			{
				if (annyang)
				{
					var mainpage = {
						'register': function()
						{
							show_form();
						},
						'Two': function()
						{
							console.log("question 2");
							var url = 'http://localhost:8080/DBProject2/index3.jsp'; //question 2 url
							$.getJSON(url);
						},
						'Three': function()
						{
							var url = 'http://localhost:8080/DBProject2/index2.jsp'; //question 2 url
							$.getJSON(url);
						},
						'home': function()
						{
							var url = 'http://localhost:8080/DBProject2/index.jsp';
							$.getJSON(url);
						},
						'validate': function()
						{
							validateForm(); 
						},
						'reset': function()
						{
							reset();
						},
						'cancel': function()
						{
							cancel();
						}
					};
					annyang.addCommands(mainpage);
					annyang.start(
					{
						autoRestart: false,
						continuous: true
					});
					annyang.debug();
					annyang.setLanguage('en-IN');
				}
			} */
			$('#carousel').carousel(
			{
				interval: 2000
			})

			function show_form()
			{
				$('#myModal').modal('show', function()
				{
					$('#name').focus();
				});
				$(this).fadeOut();
			}

			function reset()
			{
				document.getElementById("form_videogame").reset();
			}

			function cancel()
			{
				$('#myModal').modal('hide').slideUp("slow");
			}
			
			var tagWhitelist_ = {
					'A': true,
					'B': true,
					'BODY': true,
					'BR': true,
					'DIV': true,
					'EM': true,
					'HR': true,
					'I': true,
					'IMG': true,
					'P': true,
					'SPAN': true,
					'STRONG': true
				};
				var attributeWhitelist_ = {
					'href': true,
					'src': true
				};

				function sanitizeHtml(input) {
					var iframe = document.createElement('iframe');
					if (iframe['sandbox'] === undefined) {
						alert('Your browser does not support sandboxed iframes. Please upgrade to a modern browser.');
						return '';
					}
					iframe['sandbox'] = 'allow-same-origin';
					iframe.style.display = 'none';
					document.body.appendChild(iframe); // necessary so the iframe contains a document
					iframe.contentDocument.body.innerHTML = input;

					function makeSanitizedCopy(node) {
						if (node.nodeType == Node.TEXT_NODE) {
							var newNode = node.cloneNode(true);
						} else if (node.nodeType == Node.ELEMENT_NODE && tagWhitelist_[node.tagName]) {
							newNode = iframe.contentDocument.createElement(node.tagName);
							for (var i = 0; i < node.attributes.length; i++) {
								var attr = node.attributes[i];
								if (attributeWhitelist_[attr.name]) {
									newNode.setAttribute(attr.name, attr.value);
								}
							}
							for (i = 0; i < node.childNodes.length; i++) {
								var subCopy = makeSanitizedCopy(node.childNodes[i]);
								newNode.appendChild(subCopy, false);
							}
						} else {
							newNode = document.createDocumentFragment();
						}
						return newNode;
					};
					resultElement = makeSanitizedCopy(iframe.contentDocument.body);
					document.body.removeChild(iframe);
					return resultElement.innerHTML;
					
					resultElement = msg;
				};

			function validateForm()
			{
				var name = sanitizeHtml(document.getElementById('name').value);
				var curr_value =sanitizeHtml(document.getElementById('curr_market').value.match(/^\d+(\.\d+)?$/));
				var market_value = sanitizeHtml(document.getElementById('market_price').value.match(/^\d+(\.\d+)?$/));
				var developer = sanitizeHtml(document.getElementById('developer').value);
				var publisher = sanitizeHtml(document.getElementById('publisher').value);
				var transaction_num = sanitizeHtml(document.getElementById('transaction_num').value.match("[0-9]"));
				var release = sanitizeHtml(document.getElementById('release_num').value.match("[0-9]"));
				name = name.trim();
				market_value = market_value.trim();
				developer= developer.trim();
				publisher = publisher.trim();
				transaction = transaction_num.trim();
				release = release.trim();  
				if (name && curr_value && market_value && developer && publisher && transaction_num && release)
				{
					
					var checkRadioValidator = RadioValidator();
					var check = checkDate();
				}
				else
				{
					alert("Input all values correctly");
					return false;
				}
				if (!(check && checkRadioValidator))
					return false;
			}

			function RadioValidator()
			{
				var ShowAlert = '';
				var AllFormElements = window.document.getElementById("form_videogame").elements;
				for (i = 0; i < AllFormElements.length; i++)
				{
					if (AllFormElements[i].type == 'radio')
					{
						var ThisRadio = AllFormElements[i].name;
						var ThisChecked = 'No';
						var AllRadioOptions = document.getElementsByName(ThisRadio);
						for (x = 0; x < AllRadioOptions.length; x++)
						{
							if (AllRadioOptions[x].checked && ThisChecked == 'No')
							{
								ThisChecked = 'Yes';
								break;
							}
						}
						var AlreadySearched = ShowAlert.indexOf(ThisRadio);
						if (ThisChecked == 'No' && AlreadySearched == -1)
						{
							ShowAlert = ShowAlert + ThisRadio + ' not filled\n';
						}
					}
				}
				if (ShowAlert != '')
				{
					alert(ShowAlert);
					return false;
				}
				else
				{
					return true;
				}
			}

			function checkDate()
			{
				var transaction = document.getElementById('transaction').value;
				if (transaction.match("[0-9]{4}-[0-9]{2}-[0-9]{2}"))
				{
					return true;
				}
				else
				{
					alert('Invalid date format!');
					return false;
				}
			}
		</script>
		<style type="text/css">
			#eventForm .form-control-feedback {
				top: 0;
				right: -15px;
			}
		</style>
	</head>
<body onload="speech();">
	<!-- Header -->
	<div class="navbar navbar-inverse">
		<div class="navbar-header" style="background-color:transparent;">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
			<center><a class="navbar-brand" style="font-size:25px;" href="index.jsp">Videogame</a> </center>
		</div>
		<% String b="1" ; if (b.equals(request.getParameter( "id1"))) { out.println( "<html> <head> <script> alert('Successfully Submitted'); </script> </head> </html>"); } %>
			<div class="navbar-collapse collapse navbar-inverse-collapse">
				<ul class="nav navbar-nav"> </ul>
				<form class="navbar-form navbar-right">
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"> <a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">My Collections<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="index3.jsp">Consoles & Genre</a></li>
							<li class="divider"> </li>
							<li><a href="index2.jsp">Queries</a></li>
						</ul>
					</li>
				</ul>
				</li>
				</ul>
			</div>
	</div>
	<!-- Header end -->
	<!--body-->
	<div id="myCarousel" class="carousel slide" data-ride="carousel" z=-1>
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active"> <img class="first-slide" style="height:70%; width:100%" src="http://shop.pcguru.hu/custom/gurushop/image/cache/w900h500wt1/termekek_jatek/fifa15/screenek/fifa-15-screenshot-4.jpg?lastmod=1428664168.1417007108" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
					</div>
				</div>
			</div>
			<div class="item"> <img class="second-slide" src="http://gradly.net/wp-content/uploads/2013/07/gta-5.jpg" style="height:70%; width:100%" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
					</div>
				</div>
			</div>
			<div class="item"> <img class="third-slide" style="height:70%; width:100%" src="http://www.vgamerz.com/wp-content/uploads/2015/01/8watchdogs.jpg" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
	</div>
	<!-- /.carousel -->
	<br>
	<br>
	<br>
	<div class="jumbotron z=5" style="background-color:#ECEFF1;">
		<center>
			<h2> <b> Featured Games </b> </h2>
			<br>
			<div class="row">
				<br>
				<br>
				<div class="list-group-separator"></div>
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Mortal Kombat</h3> </div>
						<div class="panel-body">
							<center>
								<div class="row-picture"> <img class="circle" src="http://www.jeuxdepc.fr/wp-content/uploads/2015/04/Download-PC-Mortal-Kombat-X.png" alt="icon"> </div>
							</center>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Legents of Dota</h3> </div>
						<div class="panel-body">
							<center>
								<div class="row-picture"> <img class="circle" src="https://www.epicwar.com/assets/p/826/206329.jpg" alt="icon"> </div>
							</center>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Farcry 4</h3> </div>
						<div class="panel-body">
							<center>
								<div class="row-picture"> <img class="circle" src="http://fc08.deviantart.net/fs71/f/2014/135/3/2/farcry_4___icon_by_blagoicons-d7iglxw.png" alt="icon"> </div>
							</center>
						</div>
					</div>
				</div>
			</div>
	</div>
	</div>
	</div>
	<center>
		<button type="button" class="btn btn-primary btn-lg" id="reg" onclick="show_form();"> Register a new Game </button>
	</center>
	<!--body end-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Modal for form filling Start -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-image : teal;">
					<center>
						<h2 class="modal-title">Videogame</h2> </center>
				</div>
				<br>
				<div class="modal-body">
					<form method="POST" action="./GameInput" id="form_videogame" onsubmit="return validateForm()">
						<div class="form-group">
							<input class="form-control floating-label" name="name" id="name" type="text" placeholder="Name"> </div>
						<div class="form-group">
							<input class="form-control floating-label" name="developer" id="developer" type="text" placeholder="Developer"> </div>
						<div class="form-group">
							<input class="form-control floating-label" name="publisher" id="publisher" type="text" placeholder="Publisher"> </div>
						<div class="form-group">
							<input class="form-control floating-label" name="release_num" id="release_num" type="text" placeholder="Release Number"> </div>
						<center> </center>
						<br>
						<div class="form-group console">
							<label class="col-lg-2 control-label">
								<h5>
									<b> Console 
								</h5> </b>
							</label>
							<div class="col-lg-10">
								<br>
								<br>
								<div class="radio">
									<label>
										<input type="radio" name="consoleName" id="home_video_game" value="Home video game"> Home video game </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="consoleName" id="mint" value="Handheld game"> Handheld game </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="consoleName" id="Microconsoles" value="Microconsoles"> Microconsoles </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="consoleName" id="dedicated_consoles" value="Dedicated consoles"> Dedicated consoles </label>
								</div>
							</div>
						</div>
						<div class="form-group genre">
							<label class="col-lg-2 control-label">
								<h5> <b>Genre </b></h5> </label>
							<div class="col-lg-10">
								<br>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="platformer" value="Platformer"> Platformer </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="arcade" value="Arcade"> Arcade </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="RPG" value="RPG"> RPG </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="strategy" value="Strategy"> Strategy </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="action-adv" value="Action-Adventure"> Action-Adventure </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="beat" value="Beat em up"> Beat 'em up </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="shooter" value="Shooter"> Shooter </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="adventure" value="Adventure"> Adventure </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="sports" value="Sports"> Sports </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="genre" id="family" value="Family"> Family </label>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group condition">
							<label class="col-lg-2 control-label">
								<h5> <b> Condition </h5> </b>
							</label>
							<div class="col-lg-10">
								<br>
								<br>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="brandnew" value="Brand New"> Brand New </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="mint" value="Mint"> Mint </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="very_good" value="Very Good"> Very Good </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="good" value="Good"> Good </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="acceptable" value="Acceptable"> Acceptable </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="condition" id="poor" value="Poor"> Poor </label>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group items">
							<label class="col-lg-2 control-label">
								<h5><b> Box Items </b></h5></label>
							<div class="col-lg-10">
								<br>
								<br>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="boxitem" id="catridge" value="c" checked="true"> Cartridge </label>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="boxitem" id="instruction" value="i"> Instruction Manual </label>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="boxitem" id="pkg_box" value="b"> Packaging Box </label>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group ">
							<label class="control-label"><b><h5>Price</h5></b></label>
							<div class="input-group"> <span class="input-group-addon">$</span>
								<input type="text" id="market_price" class="form-control" name="marketPrice" placeholder="Price"> </div>
							<br>
							<div class="form-group">
								<label class="control-label"><b><h5>Market Value</h5></b></label>
								<br>
								<div class="input-group"> <span class="input-group-addon">$</span>
									<input type="text" class="form-control" id="curr_market" name="currentMarketPrice" placeholder="Market Value"> </div>
								<br> </div>
						</div>
						<div class="form-group game_play">
							<label class="col-lg-2 control-label">
								<h5><b> Game Play </b></h5></label>
							<div class="col-lg-10">
								<br>
								<br>
								<div class="radio">
									<label>
										<input type="radio" name="playStatus" id="playing" value="playing"> Dude! I'm Playing </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="playStatus" id="played" value="played"> Done! Completed </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="playStatus" id="will_play" value="will_play"> Ahh!! I haven't played it. </label>
								</div>
							</div>
						</div>
						<div class="form-group sell">
							<label class="col-lg-2 control-label">
								<h5><b> Selling Status </b></h5></label>
							<div class="col-lg-10">
								<br>
								<br>
								<div class="radio">
									<label>
										<input type="radio" name="sellingStatus" id="keep" value="keep"> I love the game and I wanna keep it. </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="sellingStatus" id="myt_sell" value="might sell"> I am not sure but I might sell it. </label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="sellingStatus" id="will_sell" value="will_sell"> It's not a game! I am selling it </label>
								</div>
							</div>
						</div>
						<div class="form-group">

							<label class="control-label">
								<h4>Billing Number</h4></label>
							<div class="input-group"> <span class="input-group-addon"></span>
								<input class="form-control floating-label" name="billing_number" id="transaction_num" type="text" placeholder="Billing Number"> </div>
							</span>
						</div>
						<label class="control-label">
							<h4>Billing Date</h4></label>
						<div class="input-group"> <span class="input-group-addon"></span>
							<input type="text" class="form-control" placeholder="Billing Date YYYY-MM-DD" id="transaction" name="transaction_date">
							</span>
						</div>
				</div>
				<div class="modal-footer"> <a href="javascript:void(0)" class="btn btn-primary " data-toggle="tooltip" data-placement="right" title="Reset" id="reset" onclick="reset();" data-original-title="Reset">Reset</a> <a href="javascript:void(0)" class="btn btn-danger " data-toggle="tooltip" data-placement="right" title="cancel" id="cancel" onclick="cancel();" data-original-title="Cancel">Cancel</a>
					<input type="submit" class="btn btn-success " data-toggle="tooltip" data-placement="right" title="" id="submit" data-original-title="Submit">
					</a>
				</div>
			</div>
			</form>
		</div>
	</div>

	<!-- Modal end -->
	<!--footer-->
	<footer class="footer">
		<div class="container">
			<center>
				<p class="text-muted">&copy Team 908.</p>
			</center>
		</div>
	</footer>
	<!--footer end-->
	<script>
		//validation script
	</script>
	</body>

	</html>