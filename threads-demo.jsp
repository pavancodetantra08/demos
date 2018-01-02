<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/font-awesome-animation.min.css" rel="stylesheet">
<link href="/css/jquery-ui.css" rel="stylesheet">

<script src="/js/jquery-latest.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-ui-all.js"></script>


<!-- <link href="https://learn.codetantra.com/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://learn.codetantra.com/css/font-awesome.min.css" rel="stylesheet">
<link href="https://learn.codetantra.com/css/font-awesome-animation.min.css" rel="stylesheet">
<link href="https://learn.codetantra.com/css/jquery-ui.css" rel="stylesheet">

<script src="https://learn.codetantra.com/js/bootstrap.js"></script>
<script src="https://learn.codetantra.com/js/jquery-latest.js"></script>
<script src="https://learn.codetantra.com/js/jquery-ui-all.js"></script> -->

<title>live-threads-demo.jsp</title>

<style>

#slider-range-max label {
    position: absolute;
    width: 20px;
    margin-left: -10px;
    text-align: center;
    margin-top: 15px;
}

.thread-box {
	/* border: 1px solid lightgray; */
	/* border-radius: 8px; */
	display: inline-block;
	position: relative;
	/* padding: 10px;
	margin: 30px 10px 10px 10px; */
}

.opacity40 {
	opacity: 0.4 !important;
}

p {
	font-size: 90%;
}

.label-float-left {
	float: left;
}

.vertical-main-thread {
	margin-top: 40px;
	margin-bottom: 40px;
	display: inline-block;
	width: 100px;
	height: 30px;
	-webkit-transform: rotate(+90deg);
	transform: rotate(+90deg);
}

.vertical-thread {
	margin-top: 40px;
	margin-bottom: 40px;
	display: inline-block;
	width: 100px;
	height: 25px;
	-webkit-transform: rotate(+90deg);
	transform: rotate(+90deg);
}

.progress-bar-striped {
	-webkit-transform: rotate(+180deg);
	transform: rotate(+180deg);
}

.vertical-main-thread, .vertical-thread {
	box-shadow: inset 0px 4px 6px #ccc;
}

.progress-bar {
	box-shadow: inset 0px 4px 6px rgba(100, 100, 100, 0.6);
}

.pulsate {
	-webkit-animation: pulsate 1s linear infinite;
	-moz-animation: pulsate 1s linear infinite;
	-ms-animation: pulsate 1s linear infinite;
	animation: pulsate 1s linear infinite;
}

@keyframes "pulsate" {
 0% {
    color: rgba(0, 0, 0, 1);
 }
 90% {
    color: rgba(0,0,0,0.0);
 }
 100% {
    color: rgba(0,0,0,1.0);
 }

}

@-moz-keyframes pulsate {
 0% {
   color: rgba(0, 0, 0, 1);
 }
 90% {
   color: rgba(0,0,0,0.0);
 }
 100% {
   color: rgba(0,0,0,1.0);
 }

}

@-webkit-keyframes "pulsate" {
 0% {
   color: rgba(0, 0, 0, 1);
 }
 90% {
   color: rgba(0,0,0,0.0);
 }
 100% {
   color: rgba(0,0,0,1.0);
 }

}

@-ms-keyframes "pulsate" {
 0% {
   color: rgba(0, 0, 0, 1);
 }
 90% {
   color: rgba(0,0,0,0.0);
 }
 100% {
   color: rgba(0,0,0,1.0);
 }
}

#divT1 {
	margin-top: 20px;
}

#divT2 {
	margin-top: 39px;
}

#divT3 {
	margin-top: 59px;
}

#divT4 {
	margin-top: 80px;
}


.gear-icon {
	font-size: 5em;
	margin: 34px 0;
}

.panel {
	display: inline-block;
}

.thread-div {
	text-align: center;
	margin-top: 40px;
}

.thread-priority-css {
	border: 1px solid;
	border-radius: 4px;
	display: inline-block;
	height: 25px;
	line-height: 25px;
	width: 30px;
}

.visibility-hidden {
	visibility: hidden !important;
}

.ui-effects-transfer {
	border: 2px dotted #337ab7;
}

</style>

</head>

<body>

	<div>
		<div class='row'>
			<div>
				<div class='col-sm-3'>
					<p>
						<label>Number of Threads:</label> <input type="text"
							id="numOfThreads" name="numOfThreads" readonly
							style="border: 0; font-weight: bold;">
					</p>
					<div id="slider-range-max"></div>
				</div>

				<div class='col-sm-9' style='margin-top: 15px'>
					<button type="button" class="btn btn-primary btn-sm"
						id='startAllThreadsButton'>Start Threads</button>
				</div>
			</div>
		</div>
		<div class='col-sm-12'>
			<div class='container'>
				<div class='col-sm-offset-2 col-sm-8'>
				<div class='row thread-div'>
					<%
						for (int i = 1; i <= 2; i++) {
					%>
					<div class='thread-box col-sm-6 visibility-hidden' id='threadBox<%=i%>'>
						<div class='text-center'>
							<div>
								<h4>
									<span class='label label-default' id='thread<%=i%>Label'>T<sub><%=i%></sub></span>
								</h4>
							</div>
							<div class="progress vertical-thread">
								<div class="progress-bar progress-bar-primary" style="width: 0%;"
									id='progressBarThread<%=i%>'></div>
							</div>
							<div>
								<h4>
									<span class='thread-priority-css' contenteditable='true' maxlength='1' id='thread<%=i%>Priority'><%=i%></span>
								</h4>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<div class='row thread-div'>
					<%
						for (int i = 5; i <= 6; i++) {
					%>
					<div class='thread-box col-sm-3 visibility-hidden' id='threadBox<%=i%>'>
						<div class='text-center'>
							<div>
								<h4>
									<span class='label label-default' id='thread<%=i%>Label'>T<sub><%=i%></sub></span>
								</h4>
							</div>
							<div class="progress vertical-thread">
								<div class="progress-bar progress-bar-primary" style="width: 0%;"
									id='progressBarThread<%=i%>'></div>
							</div>
							<div>
								<h4>
									<span class='thread-priority-css' contenteditable='true' maxlength='1' id='thread<%=i%>Priority'><%=i%></span>
								</h4>
							</div>
						</div>
					</div>
						<%
							if (i == 5) {
						%>
						<div class='col-sm-6'>
							<span class="fa fa-cog gear-icon visibility-hidden" id="gearIcon"></span>
						</div>
						<%
							}
						%>
					<%
						}
					%>
				</div>
				<div class='row thread-div'>
					<%
						for (int i = 3; i <= 4; i++) {
					%>
					<div class='thread-box col-sm-6 visibility-hidden' id='threadBox<%=i%>'>
						<div class='text-center'>
							<div>
								<h4>
									<span class='label label-default' id='thread<%=i%>Label'>T<sub><%=i%></sub></span>
								</h4>
							</div>
							<div class="progress vertical-thread">
								<div class="progress-bar progress-bar-primary" style="width: 0%;"
									id='progressBarThread<%=i%>'></div>
							</div>
							<div>
								<h4>
									<span class='thread-priority-css' contenteditable='true' maxlength='1' id='thread<%=i%>Priority'><%=i%></span>
								</h4>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
		</div>
	</div>
	
<script>

Array.prototype.equals = function (array) {
    // if the other array is a falsy value, return
    if (!array)
        return false;

    // compare lengths - can save a lot of time 
    if (this.length != array.length)
        return false;

    for (var i = 0, l=this.length; i < l; i++) {
        // Check if we have nested arrays
        if (this[i] instanceof Array && array[i] instanceof Array) {
            // recurse into the nested arrays
            if (!this[i].equals(array[i]))
                return false;       
        }           
        else if (this[i] != array[i]) { 
            // Warning - two different object instances will never be equal: {x:20} != {x:20}
            return false;   
        }           
    }       
    return true;
}   

	var sliderValue = 2;

	var threadProgressBarWidth;
	var threadProgressBarSetInterval = [];

	var priorityArr = [];
	var priorityMap = {};

	$(document).ready(function() {

		$(function() {
			$("#slider-range-max").slider({
				range : "max",
				min : 1,
				max : 6,
				value : 2,
				slide : function(event, ui) {
					$("#numOfThreads").val(ui.value);
					sliderValue = $("#numOfThreads").val();
					showThreadBoxes();
				}
			});
			var per = 0; 
			for (var i = 1; i <= 6; i++) {
				var el = $('<label>'+ i +'</label>').css('left', per + '%');
			  	per = per + (100 / 5);
			    $( "#slider-range-max" ).append(el);
			  }
			$("#numOfThreads").val($("#slider-range-max").slider("value"));
			showThreadBoxes();
		});

		$("#startAllThreadsButton").click(function() {
			if ($("#startAllThreadsButton").hasClass('reset')) {
				location.reload();
				return;
			}
			threadProgressBarWidth = [ 0, 20, 20, 20, 20, 20, 20];
			$('#slider-range-max').slider('disable');
			$(this).text('Reset Threads').addClass('reset btn-warning');
			//showThreadBoxes();
			for (var i = 1; i <= sliderValue; i++) {
				//priorityArr.push({threadIndex: [i], priority: parseInt($('#thread'+ i +'Priority').text())});
				priorityArr.push(parseInt($('#thread'+ i +'Priority').text()));
				if (priorityMap.hasOwnProperty(parseInt($('#thread'+ i +'Priority').text()))) {
					priorityMap[parseInt($('#thread'+ i +'Priority').text())].push(i);
				} else {
					priorityMap[parseInt($('#thread'+ i +'Priority').text())] = [i];
				}
			}
			priorityArr = Array.from(new Set(priorityArr));
			priorityArr.sort();
			//priorityArr.sort(function(a, b) { return a.priority - b.priority});
			$('#gearIcon').removeClass('visibility-hidden').addClass('fa-spin');
			startThreads();
		});
		
		$("[contenteditable=true]").keydown(function(e) {
			if (e.which === 13) {
				e.preventDefault();
			}
			var max = $(this).attr("maxlength");
			if ($.inArray(e.keyCode, [46, 8, 9, 27, 37, 39]) !== -1) {
				return;
			}
			if (((e.shiftKey) || (e.keyCode < 48 || e.keyCode > 57)) && ((e.keyCode < 96) || (e.keyCode > 105))) {
				e.preventDefault();
			}
			
			if ($(this).text().length >= max) {
				e.preventDefault();
			}
						
		});

	});

	function showThreadBoxes() {
		$('.thread-box').addClass('visibility-hidden');
		for (var i = 1; i <= sliderValue; i++) {
			$('#threadBox' + i).removeClass('visibility-hidden');
		}
	}

	function startThreads() {
		var priorityLevel = parseInt(90 / priorityArr.length);
		var threadIndex = 0; 
		threadProgressBarSetInterval[0] = setInterval(function() {
			if (threadProgressBarWidth[0] == priorityLevel) {
				for (var i = 0; i < priorityMap[priorityArr[threadIndex]].length; i++) {
					threadStart(priorityMap[priorityArr[threadIndex]][i]);
				}
				//priorityArr.shift();
				priorityLevel += parseInt(90 / priorityArr.length);
				threadIndex++;
			}
			if (threadProgressBarWidth[0] == 100) {
				mainThreadEnd();
			}
			if (threadProgressBarWidth[0] < 100) {
				threadProgressBarWidth[0] += 1;
			}
			checkAllThreadsEnded();
		}, 100);
	}

	function threadStart(threadIndex) {
		$('#gearIcon').effect( "transfer", { to: $('#thread' + threadIndex + 'Label') }, 1000, function() {
			$("#progressBarThread" + threadIndex).css("width", "10%");
			$("#thread" + threadIndex + "Label").removeClass("label-default").addClass("label-primary");
			$("#progressBarThread" + threadIndex).addClass("progress-bar-striped");
			threadProgressBarSetInterval[threadIndex] = setInterval(function() {
				$("#progressBarThread" + threadIndex).css("width", threadProgressBarWidth[threadIndex] + "%");
				if (threadProgressBarWidth[threadIndex] == 100) {
					threadEnd(threadIndex);
				}
				threadProgressBarWidth[threadIndex] += 10;
				checkAllThreadsEnded();
			}, randomIntFromInterval(1000, 5000));
		});
	}

	function mainThreadEnd() {
		clearInterval(threadProgressBarSetInterval[0]);
	}

	function threadEnd(threadIndex) {
		$("#progressBarThread" + threadIndex).removeClass("progress-bar-striped");
		clearInterval(threadProgressBarSetInterval[threadIndex]);
	}
	
	function checkAllThreadsEnded() {
		var arr = [100, 20, 20, 20, 20, 20, 20]
		for (var end = 1; end <= sliderValue; end++) {
			arr[end] = 110;
			if (threadProgressBarWidth.equals(arr)) {
				$('#gearIcon').removeClass('fa-spin');
			}
		}
	}
	
	function randomIntFromInterval(min,max) {
		return Math.floor(Math.random()*(max-min+1)+min);
	}

</script>
</body>
</html>