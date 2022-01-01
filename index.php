<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/f520d024f2.js" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="css/stylesIndex.css">
    <title>Welcome</title>
</head>
<body>
    <section>
        <header class="blurred-bg">
            <img class="header-logo" src="img/nav-brand.png">
        </header>
        <video src="mp4/mountains.mp4" autoplay loop muted></video>
        <section class = "container">
            <!-- 
                <nav class="navbar sticky-top">
                <div class="container-fluid">
                    <button class="navbar-toggler" id = 'navbar-toggler' type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="material-icons nav-toggler-icon" id="nav-toggler-icon">menu</span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarToggler">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About</a>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                            <button class="btn" id="login-search-btn" type="submit"><span class="material-icons">search</span></button>
                        </form>
                    </div>
                </div>
            </nav>
            -->
            <div class="userActions-ctr">
                <div class="card" data-tilt data-tilt-glare data-tilt-max-glare="0.4" data-tilt-scale="1.1">
                    <div class="card-body">
                        <h1 class="card-title">Existing Users</h1>
                        <a href="#" class="btn card-text">Login</a>
                        <span class="material-icons">login</span>
                    </div>
                </div>

                <div class="card" data-tilt data-tilt-glare data-tilt-max-glare="0.5" data-tilt-scale="1.1">
                    <div class="card-body">
                        <h1 class="card-title">New Users</h1>
                        <a href="#" class="btn card-text">Create Account</a>
                        <span class="material-icons">person_add</span>
                    </div>
                </div>
            </div>
            <footer>
                <div><i class="fab fa-facebook"></i></div>
                <div><i class="fab s fa-instagram"></i></div>
                <div><i class="fab fa-twitter"></i></div>
                <div><i class="fab f fa-youtube"></i></div>
            </footer>
        </section>
    </section>


    <script type="text/javascript" src="js/vanilla-tilt.js"></script>
    <script type="text/javascript">
        VanillaTilt.init(document.querySelector(".card"), {
            max: 25,
            speed: 400,
            glare:true,
            "max-glare": 1,
            easing: "cubic-bezier(.03,.98,.52,.99)",
        });
        
    </script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery UI library -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 

    <script type="text/javascript" src="js/navbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
</body>
</html>