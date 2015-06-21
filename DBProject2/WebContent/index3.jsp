<html>

<head>
    <script src="https://code.jquery.com/jquery-2.1.3.min.js">
    </script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
    </script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/paper/bootstrap.min.css" />
    <script>
    
        $(document).ready(function() {
            $("#button").click(function() {
            	 $("#Result_div").empty();
                $("#test").modal("show").slideDown("slow");

                var console = $('#consoleName').val();
              
                var genre = $('#genre').val();
                
                $.getJSON("MyGames", {
                    "consoleName": console,
                    "genre": genre
                }, function(result) {
                	
					//$('#Result').empty();
					var a ="<table style='font-size:13px;' class='table table-striped table-hover'><tr><th >Title</th><th>Date Of Purchase</th><th>Condition Type</th><th>Completeness</th><th>Price</th><th>Current Value</th><th>Preference</th></table>";
                    $("#Result_div").append(a);
                    
					
                    var length = $("#Result_div").children().length;
					window.console.log(length);

                    $.each(result,function(i, data) {
                    	window.console.log(data);
                        $.each(data, function(j, value) {                       
                        	var table1 = $("#Result_div").children();
                            table1.append("<tr class='success' style='font-size:10px;'><td>" + value.title + "</td><td>" + value.date_of_purchase + "</td><td>" + value.condition_type + "</td><td>" + value.completeness + "</td><td>" + value.price + "</td><td>" + value.current_value + "</td><td>" + value.preference + "</td></tr>");                       	
                        });
                    });
                });
            });
        });
    </script>
</head>

<body style="background-color: #D7D7D7;" >

 
    <!-- Header -->
    <div class="navbar navbar-inverse">
        <div class="navbar-header" style="background-color: transparent;">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <center> <a class="navbar-brand" style="font-size: 25px;" href="index.jsp">Videogame</a> </center>
        </div>
        <div class="navbar-collapse collapse navbar-inverse-collapse">
            <ul class="nav navbar-nav"> </ul>
            <form class="navbar-form navbar-right">
                </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Questions<b
class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="divider"></li>
                        <li><a href="index2.jsp">Queries</a></li>
                    </ul>
                </li>
            </ul>
            </li>
            </ul>
        </div>
    </div>
    <!-- Header end-->
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div class="row">
                    <div class="jumbotron" style="height: 100%; width: 100%; " >
                        <center>
                            <h4>Search</h4> </center>
                        <br>
                        <br>
                        <br>
                        <div class="col-lg-10">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="col-lg-5"> Console:
                                        <select id="consoleName">
                                            <option id="option_none" value="none">None</option>
                                            <option id="option1" selected="selected" value="Home Video Game">Home Video Game&nbsp&nbsp</option>
                                            <option id="option2" value="Handheld Game">Handheld Game&nbsp&nbsp</option>
                                            <option id="option3" value="Microconsoles">Microconsoles&nbsp&nbsp</option>
                                            <option id="option4" value="Dedicated consoles">Dedicated consoles&nbsp&nbsp</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-5">
                                        Category:
                                        <select id="genre">
                                            <option id="category_option1" value="none" selected="selected">None&nbsp&nbsp&nbsp&nbsp&nbsp</option>
                                            <option id="category_option2" value="Arcade">Arcade&nbsp&nbsp</option>
                                            <option id="category_option3" value="Platformer">Platformer&nbsp&nbsp</option>
                                            <option id="category_option4" value="Arcade">Arcade&nbsp&nbsp</option>
	 										<option id="category_option5" value="RPG">RPG&nbsp&nbsp</option>
											<option id="category_option6" value="Strategy">Strategy&nbsp&nbsp</option>
											<option id="category_option7" value="Action-Adventure">Action-Adventure&nbsp&nbsp</option>
											<option id="category_option8" value="Beat em up">Beat em up&nbsp&nbsp</option>
											<option id="category_option9" value="Shooter">Shooter&nbsp&nbsp</option>
											<option id="category_option10" value="Adventure">Adventure&nbsp&nbsp</option>
											<option id="category_option11" value="Sports">Sports&nbsp&nbsp</option>
											<option id="category_option12" value="Family">Family&nbsp&nbsp</option>
                                        </select>
                                    </div>

                                    <div class="col-lg-2">
                                        <a id="button" class="btn btn-primary glyphicon glyphicon-search"></a>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
        <div class="col-lg-2"></div>
        <div class="modal" id="test">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <center>
                            <h4 class="modal-title">Result</h4> </center>
                    </div>
                    <div class="modal-body" >
                        <div id="Result_div"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
			<!--footer-->
			<footer class="footer">
				<div class="container">
					<center>
						<p class="text-muted"> <b>&copy Team 908. </b></p>
					</center>
				</div>
			</footer>
			<!--footer end-->
		
        ​