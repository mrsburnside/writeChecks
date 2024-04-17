
<!--- The spreadsheet is a quick shortcut to having data to write loop over.  In real life, you willl ikely write a query or stored procedure that gives you the data --->
<cfspreadsheet action="read" src="checkRequests.xlsx" query="requests" excludeHeaderRow="true" headerrow="1">

<!DOCTYPE html>
<html>
<head>
 <title>Check Requests</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <style>
  html {margin: 0px; padding: 0px;}
  body {margin: 0px; padding: 0px;}
  div {font-size: 18px;}
  .check {position: relative; top: 0; left: 0; width: 850px; height: 1000px;}
  .pageBreak {page-break-after: always}
  #checkBackground {z-index: 1; position: absolute; left: 0; top: 0; width: 850px; height: 1000px;}
  #payTo {left: 103px; top:128px; position: absolute; z-index: 2;}
  #amount {left: 704px; z-index: 3; top:126px; width: 75px; text-align: right; position: absolute;}
  #memo {left: 103px; top: 400px; position: absolute; z-index: 4;}
  @media print
  {    
    .no-print
    {
        display: none ;
    }
  }

 </style>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>
 <cfloop query="requests">
  <cfoutput>
  <!--- The draggable feature makes is easier to figure out the position of a new data element from inspect element.  Otherwise, it isn't really needed--->
   <div class="check">
    <div id="checkBackground">
     <img src="businessCheck.jpg" class="no-print"><!--- The check background is visible in the browser but is hidden on print --->
     <div class="d" id="payTo">#Requests.payTo#<br>
                     #Requests.address1#<br>
                     #Requests.address2#<br>
                     #Requests.address3#<br>
     </div>
     <div class="d" id="amount">#numberFormat(Requests.amount, "9.00")#</div>
     <div class="d" id="memo">#Requests.memo#</div>
     <div class="pageBreak"></div><!--- the page-break css makes each check a new page --->
   </div>
  </div>
  </cfoutput>
 </cfloop>

 <script>
  $( function() {
    $(".d").draggable();
   } );
 </script>
</body>
</html>