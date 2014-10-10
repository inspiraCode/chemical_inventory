<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chemicals_List.aspx.cs" Inherits="Chemical_Inventory.Reports.Chemicals_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chemicals List</title>
    <style type="text/css">
        
        .CSSTableGenerator {
	margin:0px;padding:0px;
	width:770px;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
	
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
	
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
	
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}.CSSTableGenerator table{
    border-collapse: collapse;
        border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.CSSTableGenerator tr:last-child td:last-child {
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
}
.CSSTableGenerator table tr:first-child td:first-child {
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}
.CSSTableGenerator table tr:first-child td:last-child {
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
}.CSSTableGenerator tr:last-child td:first-child{
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
}.CSSTableGenerator tr:hover td{
	
}
.CSSTableGenerator tr:nth-child(odd){ background-color:#e5e5e5; }
.CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
	vertical-align:middle;
	
	
	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
}.CSSTableGenerator tr:last-child td{
	border-width:0px 1px 0px 0px;
}.CSSTableGenerator tr td:last-child{
	border-width:0px 0px 1px 0px;
}.CSSTableGenerator tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.CSSTableGenerator tr:first-child td{
		background:-o-linear-gradient(bottom, #cccccc 5%, #b2b2b2 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #b2b2b2) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #b2b2b2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#b2b2b2");	background: -o-linear-gradient(top,#cccccc,b2b2b2);

	background-color:#cccccc;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:11px;
	font-family:Arial;
	font-weight:bold;
	color:#000000;
}
.CSSTableGenerator tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #cccccc 5%, #b2b2b2 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #b2b2b2) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #b2b2b2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#b2b2b2");	background: -o-linear-gradient(top,#cccccc,b2b2b2);

	background-color:#cccccc;
}
.CSSTableGenerator tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.CSSTableGenerator tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
    </style>

    <script src="../scripts/jQuery/jquery-1.10.2.js" type="text/javascript"></script>
</head>
<body>

   <div class="CSSTableGenerator" style="clear: both;margin-left: auto;margin-right: auto;">
        <table id="tableChemicals">
                <tr>
                    <td>
                        #
                    </td>
                    <td>
                        ID
                    </td>
                    <td>
                        Chemical Name
                    </td>
                    <td>
                        Part Number
                    </td>
                    <td>
                        Health
                    </td>
                    <td>
                        Flammability
                    </td>
                    <td>
                        Reactivity
                    </td>
                    <td>
                        PPE
                    </td>
                    <td>
                        Container
                    </td>
                    <td>
                        Status
                    </td>
                    <td>
                        Creation Date
                    </td>
                </tr>
        </table>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            load();
        });
        function load() {
            getChemicals();
        }

        var Chemicals;
        function getChemicals() {
            Chemicals = opener.filteredData;
            refreshForm();
            window.document.close();
            window.print();
            return true;
        }

        function loadChemicalsList() {

            var strChemicalsList = '';

            for (var j = 0; j < Chemicals.length; j++) {
                var current = Chemicals[j];
                strChemicalsList += '<tr><td>' + (j + 1) + '</td>' +
'    <td align="center"  > ' +
'        <label>' + current[0] + '</label> ' +
'    </td> ' +
'    <td align="center"  > ' +
'        <label>' + current[1] + '</label> ' +
'    </td> ' +
'    <td  > ' +
'        <label>' + current[2] + '</label> ' +
'    </td> ' +
'    <td>' + current[3] +
'    </td> ' +
'    <td align="center"  > ' + current[4] +
'    </td> ' +
'    <td align="right"  > ' + current[5] +
'    </td> ' +
'    <td align="right"  > ' + current[6] +
'    </td> ' +
'    <td align="center"  >' + current[9] +
'    </td> ' +
'    <td  > ' + current[10] +
'    </td> ' +
'    <td> ' + current[11] +
'    </td></tr>';
            }


            jQuery("#tableChemicals").append(strChemicalsList);
        }


        function refreshForm() {

            var scrollPosition = jQuery("body").scrollTop();
            loadChemicalsList();
            jQuery("body").scrollTop(scrollPosition);
        }
    </script>
</body>
</html>
