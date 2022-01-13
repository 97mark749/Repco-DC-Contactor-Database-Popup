<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/f520d024f2.js" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="css/stylesPopup.css">
    <!--<link rel="stylesheet" href="css/stylesLogin.css">-->

    <title>DC Electrical Contactor Search Database: Repco Inc</title>
</head>
<body>
    
<?php 
    require_once('config.php');    
?>

    <!-- Modals -->
    <div class="modal" id="popup-window-one" data-bs-backdrop= "static" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Repco DC Contactor Search</h5>
                    <a class="modal_close btn-close" id = "close-search-x" onclick="clear_form()" aria-label="Close"></a>
                </div>
                <div class="modal-switch">
                    <h6 id="modal-switch-txt">Use Our Contactor Builder</h6>
                    <i id="modal-switch-btn" class = "material-icons" data-bs-target="#popup-window-two" data-bs-toggle="modal">engineering</i>
                </div>
                <form id="form" class="basic-form">
                    <div class="modal-body">
                        <div class="table-container" id="result" name="contactor-info">
                        <h2 id="errorMessage"></h2>
                            <!-- Contactor Values -->
                        </div>
                        <div class="results-container">
                            <div class="results-box" id="repcoResult">
                                <!-- Repco Replacement Navigation -->
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer" id="modalOne-footer">
                        <div class="searchbox-ctr">
                            <div>
                                <div class=" search-icon" tabindex="1"><i id ="search-me" class="material-icons">search</i></div>
                                <input id = 'search' class="toggle-item insert-box" onkeyup="validate_input()" type="text" placeholder="Insert OEM Number">
                                <div id="suggestions">
                                    <!-- Values inserted Via AJAX -->
                                </div>
                            </div>
                        </div>
                        <div class="footer-btn-group">
                            <button type="button" id ='submit' class="btn btn-sm btn-danger footer-btn" disabled>Submit</button>
                            <button type="button" id = 'close' onclick="clear_form()" class="btn btn-sm footer-btn" >Close</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="modal" id="popup-window-two" data-bs-backdrop= "static" aria-hidden="true" aria-labelledby="ModalLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Repco DC Contactor Search</h5>
                    <a class="modal_close btn-close" id = "close-cross-ref-x" onClick="reset_form()" aria-label="Close"></a>
                </div>
                <div class="modal-body" id="cross-ref-body">
                    <div class="spec-selection">
                        <h6 id="cross-ref-header">Please Select Manufacturer & Series:</h6>
                        <form class="spec-selectors">
                            <select id="selectManufacturer" class="btn dropdown-btn dropdown-toggle dropdown-button-man" data-bs-toggle="dropdown" data-bs-display="static" aria-expand="false" onChange="set_dropdowns()" onmousedown="reset_form()" required>
                                <option id='NoneSelector' value="None" selected disabled hidden>Manufacturer</option>
                                <option id='GeneralElectricSelector' value="General Electric" class="dropdown-item">General Electric</option>
                                <option id='CutlerHammerSelector' value="Cutler Hammer" class="dropdown-item">Cutler Hammer</option>
                                <option id='ClarkSelector' value="Clark" class="dropdown-item">Clark</option>
                                <option id='BCHSelector' value="BCH" class="dropdown-item">BCH</option>
                            </select>
                            <select id="selectSeries" class="btn dropdown-btn dropdown-toggle dropdown-button" data-bs-toggle="dropdown" data-bs-display="static" aria-expand="false" onchange="set_remaining_dropdowns()" required disabled>
                                <!-- Will Be Populated From php Document -->
                            </select>
                    </form>
                    </div>
                    <div class="cross-ref-main-content">
                        <form id="dropdown-nav-container" class="dropdown-nav-container">
                            <div id="remaining-dropdowns" class="dropdown-area">
                                <!-- Will Be Populated From php Document -->
                            </div>
                        </form>
                        <div class="card dropdown-nav-results">
                            <div class="card-header">
                                <h6 class="card-title">Search Results<span id='arrow'>&#8594;</span><span>Select Correct Number</span></h6>
                            </div>
                            <div id="results-body" class="card-body dropdown-results-body">
                                <!-- Will Be Populated From php Document -->
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id='cross-ref-footer'>
                    <!-- Create a new button class for this -->
                    <button type="button" id = 'submit-search' class = "btn btn-sm footer-btn tt" onclick="print_filtered_nums()" data-bs-toggle = "tooltip" data-bs-placement = "top" data-bs-offset = '[0,7]' data-bs-trigger = 'hover' data-bs-html = "true" title = "<b>Verify</b> Selections <b>Before</b> Submitting!" disabled >Submit</button>
                    <button type="button" id = 'search-switch-btn'  class="btn btn-sm footer-btn" data-bs-target="#popup-window-one" data-bs-toggle="modal" onclick="reset_form()">Go Back</button>
                    <button type="button" id = 'reset-form-btn'  class="btn btn-sm footer-btn tt" data-bs-toggle = "tooltip" data-bs-placement = "top" data-bs-offset = '[0,7]' data-bs-trigger = 'hover' data-bs-html = "true" title = "Are You Sure? " onclick="reset_form()">Reset</button>
                    <button type="button" id = 'close-cross-ref'  class="btn btn-sm footer-btn"  onclick="reset_form()">Close</button>
                </div>
            </div>
        </div>
    </div> 


    <div class="modal" id="popup-window-three" data-bs-backdrop= "static" aria-hidden="true" aria-labelledby="ModalTogglePDF" tabindex="-1">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="data-sheet-title"><!-- Assigned By jQuery --></h5>
                    <a class="modal_close btn-close" id = "close-data-sheet-x" aria-label="Close"></a>
                </div>
                <div class="modal-body" id="data-sheet-body">
                    <!-- Will Be Populated Through Ajax -->
                </div>
                <div class="modal-footer" id='data-sheet-footer'>
                    <!-- Create a new button class for this -->
                    <div>
                        <p>View Our Replacement: </p>
                        <i id="data-sheet-nav-arrow" class="material-icons" onclick="navToReplacement()">east</i>
                    </div>
                    <button type="button" id = 'close-data-sheet' class="btn btn-sm footer-btn" >Close</button>
                </div>
            </div>
        </div>
    </div>



    <div class="container-fluid main-container">
        <form class="window-container" method = "post">
            <!-- Button trigger modal -->
            <button type="button" name='open_search' action="start_conn()" class="popup-btn btn" data-bs-toggle="modal" data-bs-target="#popup-window-one">
                <p>Search Contactors</p>
            </button>
        </form>
    </div>



    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery UI library -->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> 
    <script type="text/javascript" src="js/scriptsOne.js"></script>
    <script type="text/javascript" src="js/scriptsTwo.js"></script>
    <script type="text/javascript" src="js/scriptsThree.js"></script>
    
    <script type="text/javascript" src="js/autocomplete.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script>
        const tooltips = document.querySelectorAll('.tt');
        tooltips.forEach(t => {
            new bootstrap.Tooltip(t);
        })
    </script>
    </body>
    </html> 