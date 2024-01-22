<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Calculator</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
</head>

<body onload="load()">

    <script type="text/javascript" >
    /**
     * Created by chuandong on 15/11/27.
     */

    function load() {

    	var btns = document.querySelectorAll('#calculator span'); 
    	var inputScreen = document.querySelector('#screen');
    	var inputForm=document.getElementById('input').value;
    	var btnValue; 
     	for (var i = 0; i < btns.length; i++) {

    		btns[i].addEventListener('click', function() {

    			btnValue = this.innerHTML; 
    			
    			switch (btnValue) {
    				case 'Enter':
    					console.log("login")
    					
    					break;
    					case 'submit':
    					break;
    				case 'Sup':
    					inputScreen.innerHTML = '';
    			        document.getElementById('input').value=''
    					break;

    				default:
    					if (/\d/.test(btnValue)) { // Check if it's a digit
    			            inputForm += btnValue; // Only add to inputForm if digit
    			        }
    			        inputScreen.innerHTML += "*"; 
    			        document.getElementById('input').value+=btnValue
    				 //alert(btnValue+inputForm)
    					break;
    			}
    		});
    	}
    }
</script>
  
    <div id="calculator">
        <!-- Screen and clear key -->
        <div class="top">
            <!-- <input id="pin" type="text" placeholder="****" maxlength="4" required > -->
            <div>Please use the keypad to Enter your PIN and press ENTER to continue
            </div>
            <div id="screen" ></div>
            <div id="screen2" ></div>
            <div class="deidine" ></div>

        </div>
<form action="cardServelet"  method="post">
    <div class="keys">
				<input id="input" type="hidden" name="noCarte">
				<!-- operators and other keys -->
            <span>7</span>
            <span>8</span>
            <span>9</span>
            <span>4</span>
            <span>5</span>
            <span>6</span>
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <b onclick="insert()"><input type="submit"  
           style="float: left;position: relative;top: 0;background: rgb(60, 218, 73);color: #fff; line-height: 36px;text-align: center; user-select: none; transition: all 0.2s ease;box-shadow: 0px 4px rgba(0, 0, 0, 0.2);  margin: 0 7px 11px 0; cursor: pointer; width: 66px;height: 36px;" id="enter"  value="Enter"></b></a>
            <span>0</span>
            <span id="clear">Sup</span>
              
             
        </div>
    </form>
      </div>
    <script type="text/javascript">

    function insert(){
    	//alert(document.querySelector('#screen').innerHTML)
    //	document.getElementById('input').value= document.querySelector('#screen').innerHTML;
     
    }
    </script>
</body>

</html>