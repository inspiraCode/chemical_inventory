<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chemicals.aspx.cs" Inherits="Chemical_Inventory.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chemical Inventory</title>
    <link rel="stylesheet" href="scripts/jQuery/themes/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="scripts/dataTable/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="scripts/icheck/skins/square/grey.css" />
    <link rel="stylesheet" type="text/css" href="scripts/alertify/alertify.core.css" />
    <link rel="stylesheet" type="text/css" href="scripts/alertify/alertify.default.css" />
    <link rel="stylesheet" type="text/css" href="scripts/clockpicker/jquery-clockpicker.min.css" />
    <link rel="stylesheet" type="text/css" href="scripts/handsontable/jquery.handsontable.full.css" />
    <link rel="stylesheet" type="text/css" href="scripts/chosen/chosen.css" />
    <style type="text/css">
        body
        {
            font-family: Verdana, Arial, sans-serif;
            font-size: 12px;
        }
        
        
        .MainTitle
        {
            font-size: 40px;
            margin: auto;
            width: 420px;
            display: block;
        }
        
        .Overlay
        {
            display: none;
            position: fixed;
            min-height: 100%;
            min-width: 100%;
            z-index: 5000;
            background-color: black;
            filter: alpha(opacity =                                           50);
            opacity: 0.3;
            top: 0;
            left: 0;
        }
    </style>
    <script src="scripts/jQuery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.button.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.dialog.min.js" type="text/javascript"></script>
    <script src="scripts/jQuery/ui/jquery.ui.tabs.min.js" type="text/javascript"></script>
    <script src="scripts/dataTable/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="scripts/icheck/icheck.min.js" type="text/javascript"></script>
    <script src="scripts/alertify/alertify.min.js" type="text/javascript"></script>
    <script src="scripts/clockpicker/jquery-clockpicker.min.js" type="text/javascript"></script>
    <script src="scripts/handsontable/jquery.handsontable.full.js" type="text/javascript"></script>
    <script src="scripts/utils/validator.js" type="text/javascript"></script>
    <script src="scripts/chosen/chosen.jquery.js" type="text/javascript"></script>
</head>
<body>
    <%--<form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>
    <div id="divContanier">
    </div>
    <script type="text/javascript">
        jQuery(function () {
            jQuery(window).resize(function () {
                centerPleaseWait();
            });
            centerPleaseWait();
            getResources();
        });

        var Chemicals;
        function getResources() {
            getChemicals();
        }

        function getChemicals() {
            jQuery.getJSON('<%= ResolveUrl("~/WebServices/Catalogs.aspx") %>?cmd=read&catalog=chemicals', function (result) {
                Chemicals = result;
                readCallBack();
            });
            return true;
        }

        var readCounter = 0;
        function readCallBack() {
            readCounter++;
            if (readCounter == 1) {
                readCounter = 0;
                load();
                jQuery("#divImgEmail").hide();
            }
        }
        function load() {
            populateChemicals();
        }

        function populateChemicals() {
            try {
                $('#tableChemicals').dataTable().destroy();
            } catch (e) {
                //This try is just for remove the table if exists
            }
            var arrChemicalsAdapter = [];
            for (var i = 0; i < Chemicals.length; i++) {
                var current = Chemicals[i];
                var arrCells = [
                        current.ID,
                        current.ChemicalName,
                        current.PartNumber,
                        current.Health,
                        current.Flammability,
                        current.Reactivity,
                        current.PPE,
                        '<img src="Images/excel-icon.png" alt="ExcelFile" onclick="on_ExcelFile_click('
								+ current.ID + ',this);return false;"'
								+ ' style="height:48px;cursor:pointer;" />',
                        '<img src="Images/folder-icon.png" alt="ProviderFile" onclick="on_ProviderFile_click('
								+ current.ID + ',this);return false;"'
								+ ' style="height:48px;cursor:pointer;" />',
                        current.Container,
                        current.Status,
                        current.CreateDate,
                        '<img src="images/delete-icon.png" alt="Delete" onclick="on_deleteChemical_click('
							+ current.ID
							+ ',afterDeleteChemicalr);return false;"'
							+ ' style="height:30px;cursor:pointer;" />',
					    '<img src="images/edit-icon.png" alt="Edit" onclick="on_editChemical_click('
							+ current.ID + ',this);return false;"'
							+ ' style="height:30px;cursor:pointer;" />'
                      ];
                arrChemicalsAdapter.push(arrCells);

            }
            $('#divContanier')
					.html(
							'<table cellpadding="0" cellspacing="0" border="0" class="display" id="tableChemicals" style="text-align:center;"></table>');

            $('#tableChemicals')
					.dataTable(
							{
							    stateSave: true,
							    paging: true,
							    "data": arrChemicalsAdapter,
							    "columns": [{
							        "title": "ID"
							    }, {
							        "title": "Chemical Name"
							    }, {
							        "title": "Part Number"
							    }, {
							        "title": "Health"
							    }, {
							        "title": "Flammability"
							    }, {
							        "title": "Reactivity"
							    }, {
							        "title": "PPE"
							    }, {
							        "title": "Excel File",
							        "orderable": false
							    }, {
							        "title": "Provider File",
							        "orderable": false
							    }, {
							        "title": "Container"
							    }, {
							        "title": "Status"
							    }, {
							        "title": "Creation Date"
							    }, {
							        "title": ""
							    }, {
							        "title": ""
							    },
                        ],
							    "order": [0, 'asc']

							});

							jQuery("table th").eq(3).css("color", "white");
							jQuery("table th").eq(3).css("background-color", "blue");
							jQuery("table th").eq(4).css("color", "white");
							jQuery("table th").eq(4).css("background-color", "red");
							jQuery("table th").eq(5).css("color", "white");
							jQuery("table th").eq(5).css("background-color", "gold");

        }




        function centerPleaseWait() {
            jQuery('#divImgEmail').css(
					"top",
					(jQuery(window).height() / 2)
							- (jQuery('#divImgEmail').outerHeight() / 2));
            jQuery('#divImgEmail').css(
					"left",
					(jQuery(window).width() / 2)
							- (jQuery('#divImgEmail').outerWidth() / 2));

        }


        function getChemicalByID(idChemical) {
            for (var i = 0; i < Chemicals.length; i++) {
                if (Chemicals[i].id == idChemical)
                    return Chemicals[i];
            }
            return null;
        }
        //        function on_deleteChemical_click(idChemical, source) {
        //            for (var i = 0; i < Chemicals.length; i++) {
        //                if (idChemical == Chemicals[i].id) {
        //                    Chemicals.splice(i, 1);
        //                    break;
        //                }
        //            }
        //            populateChemicals();
        //        }
        //        function on_editChemical_click(idChemical, source) {
        //            event.preventDefault();
        //            var chemicalToUpdate = getChemicalByID(idChemical);
        //            if (chemicalToUpdate == null) {
        //                alertify
        //						.alert("An error has occurried. Please refresh the page and try again.");
        //                return;
        //            }
        //            jQuery("#btnEditChemical").prop("disabled", false);
        //            jQuery("#btnCancelEditChemical").prop("disabled", false);

        //            jQuery("#lblChemicalName").text(chemicalToUpdate.name);
        //            jQuery("#txtChemicalPhone").val(chemicalToUpdate.cellPhone);
        //            // 			jQuery("#txtChemicalEmail").val(chemicalToUpdate.email);
        //            jQuery("#txtChemicalWeeklyGoal").val(chemicalToUpdate.weeklyGoal);
        //            jQuery("#btnEditChemical").unbind("click").click(function () {
        //                updateChemical(chemicalToUpdate, afterEditChemical);
        //            });

        //            jQuery("#divDialog_EditChemical").dialog({
        //                autoOpen: true,
        //                width: 520,
        //                modal: true,
        //                closeOnEscape: true,
        //                title: "Actualizar Agente"
        //            });
        //        }
        //        function updateChemical(chemicalToUpdate, onSuccess) {
        //            if (validate()) {
        //                jQuery("#btnEditChemical").prop("disabled", true);
        //                jQuery("#btnCancelEditChemical").prop("disabled", true);

        //                chemicalToUpdate.name = jQuery("#lblChemicalName").text();
        //                chemicalToUpdate.cellPhone = jQuery("#txtChemicalPhone").val();
        //                // 				chemicalToUpdate.email = jQuery("#txtChemicalEmail").val();
        //                chemicalToUpdate.weeklyGoal = jQuery("#txtChemicalWeeklyGoal")
        //						.val();
        //                chemicalToUpdate.sms = jQuery(
        //						'[idchemical="' + chemicalToUpdate.id + '"]')
        //						.is(":checked");

        //                var to = '/SMS_Sales_Settings/GatewayServlet?cmd=chemicalUpdate';

        //                jQuery("#divImgEmail").css("display", "block");
        //                jQuery.ajax({
        //                    type: "POST",
        //                    url: to,
        //                    data: JSON.stringify(chemicalToUpdate),
        //                    contentType: "application/json;charset=utf-8",
        //                    dataType: "json",
        //                    success: function (response) {
        //                        //response = jQuery.parseJSON(response);
        //                        if (response.errorThrown === true) {
        //                            try {
        //                                onFail();
        //                            } catch (e) {
        //                            }
        //                            alertify.alert(response.responseDescription);
        //                        } else {
        //                            try {
        //                                onSuccess(chemicalToUpdate);
        //                            } catch (e) {
        //                            }
        //                            alertify.success(response.responseDescription);
        //                        }
        //                        jQuery("#divImgEmail").hide();
        //                    },
        //                    error: function (jqXHR, textStatus, errorThrown) {
        //                        alertify.alert("An error has occurried.");
        //                        try {
        //                            onFail();
        //                        } catch (e) {
        //                        }
        //                        jQuery("#btnEditChemical").prop("disabled", false);
        //                        jQuery("#btnCancelEditChemical").prop("disabled", false);
        //                        jQuery("#divImgEmail").hide();
        //                    }
        //                });
        //            } else {
        //                jQuery("#btnEditChemical").prop("disabled", false);
        //                jQuery("#btnCancelEditChemical").prop("disabled", false);
        //                return;
        //            }
        //        }
        //        function afterEditChemical(chemicalUpdated) {
        //            for (var i = 0; i < Chemicals.length; i++) {
        //                if (chemicalUpdated.id == Chemicals[i].id) {
        //                    Chemicals[i] = chemicalUpdated;
        //                    populateChemicals();
        //                    break;
        //                }
        //            }
        //            jQuery("#divDialog_EditChemical").dialog("close");
        //        }
        //        function on_closeEditChemical() {
        //            jQuery("#divDialog_EditChemical").dialog("close");
        //        }
        //        function on_newChemical_click() {
        //            event.preventDefault();
        //            jQuery("#btnEditChemical").prop("disabled", false);
        //            jQuery("#btnCancelEditChemical").prop("disabled", false);

        //            jQuery("#lblChemicalName").text('');
        //            jQuery("#txtChemicalPhone").val('');
        //            // 			jQuery("#txtChemicalEmail").val('');
        //            jQuery("#btnEditChemical").unbind("click").click(function () {
        //                createChemical(afterCreateChemical);
        //            });

        //            jQuery("#divDialog_EditChemical").dialog({
        //                autoOpen: true,
        //                width: 520,
        //                modal: true,
        //                closeOnEscape: true,
        //                title: "Nuevo Agente"
        //            });
        //        }
        //        function createChemical(onSuccess) {
        //            if (validate()) {
        //                jQuery("#btnEditChemical").prop("disabled", true);
        //                jQuery("#btnCancelEditChemical").prop("disabled", true);

        //                var chemicalToCreate = {
        //                    cellPhone: jQuery("#txtChemicalPhone").val(),
        //                    // 					email : jQuery("#txtChemicalEmail").val(),
        //                    name: jQuery("#lblChemicalName").text()
        //                };

        //                var to = '/SMS_Sales_Settings/GatewayServlet?cmd=chemicalCreate';

        //                jQuery("#divImgEmail").css("display", "block");
        //                jQuery.ajax({
        //                    type: "POST",
        //                    url: to,
        //                    data: JSON.stringify(chemicalToCreate),
        //                    contentType: "application/json;charset=utf-8",
        //                    dataType: "json",
        //                    success: function (response) {
        //                        //response = jQuery.parseJSON(response);
        //                        if (response.errorThrown === true) {
        //                            try {
        //                                onFail();
        //                            } catch (e) {
        //                            }
        //                            alertify.alert(response.responseDescription);
        //                        } else {
        //                            try {
        //                                onSuccess(response);
        //                            } catch (e) {
        //                            }
        //                            alertify.success(response.responseDescription);
        //                        }
        //                        jQuery("#btnEditChemical").prop("disabled", false);
        //                        jQuery("#btnCancelEditChemical").prop("disabled", false);
        //                        jQuery("#divImgEmail").hide();
        //                    },
        //                    error: function (jqXHR, textStatus, errorThrown) {
        //                        alertify.alert("An error has occurried.");
        //                        try {
        //                            onFail();
        //                        } catch (e) {
        //                        }
        //                        jQuery("#btnEditChemical").prop("disabled", false);
        //                        jQuery("#btnCancelEditChemical").prop("disabled", false);
        //                        jQuery("#divImgEmail").hide();
        //                    }
        //                });
        //            } else {
        //                jQuery("#btnEditChemical").prop("disabled", false);
        //                jQuery("#btnCancelEditChemical").prop("disabled", false);
        //                return;
        //            }
        //        }
        //        function afterCreateChemical(response) {
        //            var chemicalCreated = response.result;
        //            Chemicals.push(chemicalCreated);
        //            var arrCells = [
        //					'<img src="images/delete-small.png" alt="Delete" onclick="on_deleteChemical_click('
        //							+ chemicalCreated.id
        //							+ ',this);return false;"'
        //							+ ' style="height:20px;cursor:pointer;" />',
        //					'<img src="images/edit-small.png" alt="Edit" onclick="on_editChemical_click('
        //							+ chemicalCreated.id + ',this);return false;"'
        //							+ ' style="height:20px;cursor:pointer;" />',
        //					chemicalCreated.id, chemicalCreated.name,
        //					chemicalCreated.cellPhone,
        //            // 					chemicalCreated.email,
        //					chemicalCreated.weeklyGoal,
        //					getEnterpriseNameByID(chemicalCreated.idEnterprise),
        //					chemicalCreated.sms];
        //            $('#tableChemicals').DataTable().row.add(arrCells).draw();
        //            jQuery("#divDialog_EditChemical").dialog("close");

        //        }

        
    </script>
</body>
</html>
