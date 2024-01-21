<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Index Page</title>

    <!-- External CSS -->
    <link rel="stylesheet" href="style.css" />
  </head>

  <!-- Internal CSS -->
  <style>
    .card {
      position: relative;
      background: linear-gradient(
        30deg,
        rgb(237, 120, 3) 0%,
        rgb(183, 60, 3) 100%
      );
      width: 300px;
      height: 180px;
      margin-top: 100px;
      border-radius: 15px;
      box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
      color: white;
    }

    .card .numberarea {
        position: absolute;
        top:100px;
        left:20px;
        font-size: 20px;
        font-family: 'Courier New', Courier, monospace;
        word-spacing: 1px;
    }

    .card .namearea {
        position:absolute;
        font-size: 15px;
        font-family: 'Courier New', Courier, monospace;
        left: 20px;
        top:130px
    }

    .card .expirydatearea {
        font-family: 'Courier New', Courier, monospace;
        position: absolute;
        top:130px;
        left:160px

    }

    .card .validthru {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        position: absolute;
        top:135px;
        left:120px;
        font-size: 7px;
        color:white;
    }

    .card .banklogo {
        position: absolute;
        top:10px;
        left:20px;
    }

    .logodesign {
        width: 100px;
    }

    .card .simslot {
        position: absolute;
        top:50px;
        right:50px;
    }
  </style>

  <!-- Inline CSS -->
  <body style="background-color: rgb(249, 249, 249)">
    <center>
      <div class="card">

        <div class="numberarea">
            1234 5667 5326 7664
        </div>

        <div class="namearea">
            VIVEK V
        </div>

        <div class="expirydatearea">
            12/26
        </div>

        <div class="validthru">
            valid upto
        </div>

        <div class="simslot">
            <img src="simslot.png" width="60px" alt="">
        </div>

        <div class="banklogo">
            <img src="icici.png" class="logodesign" alt="" srcset="">
        </div>
      </div>
    </center>
  </body>
</html>