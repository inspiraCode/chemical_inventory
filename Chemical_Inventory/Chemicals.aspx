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
            width: 100%;
            display: block;
            text-align: center;
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
    <script src="scripts/moment/moment.min.js" type="text/javascript"></script>
</head>
<body>
    <%--<form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>
    <div id="divPleaseWait" style="display: block; position: fixed; width: 120px; height: 35px;
        z-index: 1000; background-color: white; border: 2px solid gray; padding: 5px;">
        <img alt="" src="images/loading.gif" style="display: inline; position: relative;" />
        <span style="display: inline; position: relative;">En proceso..</span>
    </div>
    <div id="scrim" class="Overlay" onclick="hideScrim()">
    </div>
    <div id="messageDisplayer" align="center" style="color: Red; position: absolute;
        display: none; color: red; position: absolute; left: 67.5px; top: 645px; background-color: white;
        border: solid gray; border-radius: 20px; padding: 5px; z-index: 5001;">
    </div>
    <div id="divDialog_EditChemical" title="Chemical" style="display: none;">
        <div align="center">
            <div id="divEditChemical">
                <table align="center" id="tableChemicalSave">
                    <tr>
                        <td colspan="4" style="text-align: left;">
                            Chemical Name
                        </td>
                        <td style="text-align: center;">
                            ID
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: left;">
                            <input type="text" id="txtChemicalName" style="width: 100%;" validate="required"
                                validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center; padding: 5px;">
                            <label id="lblID" style="width: 100%; display: block; height: 22px; background-color: #DCDCDC;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; width: 90px;">
                            Health
                        </td>
                        <td style="text-align: center; width: 90px;">
                            Flammability
                        </td>
                        <td style="text-align: center; width: 90px;">
                            Reactivity
                        </td>
                        <td style="text-align: center; width: 90px;">
                            PPE
                        </td>
                        <td style="text-align: center; width: 90px;">
                            Status
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input type="text" id="txtHealth" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center;">
                            <input type="text" id="txtFlammability" style="width: 100%;" validate="required"
                                validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center;">
                            <input type="text" id="txtReactivity" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center;">
                            <input type="text" id="txtPPE" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center;">
                            <input type="text" id="txtStatus" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            Part Number
                        </td>
                        <td style="text-align: center;">
                            Excel File
                        </td>
                        <td style="text-align: center;">
                            Provider File
                        </td>
                        <td colspan="2" style="text-align: center;">
                            Creation Date
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input type="text" id="txtPartNumber" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                        <td style="text-align: center;">
                            <img src="Images/excel-icon.png" alt="ExcelFile" onclick="on_ExcelFile_click();return false;"
                                style="height: 48px; cursor: pointer;" />
                        </td>
                        <td style="text-align: center;">
                            <img src="Images/folder-icon.png" alt="ProviderFile" onclick="on_ProviderFile_click();return false;"
                                style="height: 48px; cursor: pointer;" />
                        </td>
                        <td colspan="2" style="text-align: center; padding: 5px;">
                            <label id="lblCreationDate" style="width: 100%; display: block; height: 22px; background-color: #DCDCDC;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            Container
                        </td>
                        <td colspan="3" style="text-align: center;">
                            Workstation
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input type="text" id="txtContainer" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                        <td colspan="3" style="text-align: center;">
                            <input type="text" id="txtWorkstation" style="width: 100%;" validate="required" validationid="validatingChemicalSave" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center;">
                            <input type="button" id="btnEditChemical" style="width: 80px;" validationid="validatingChemicalSave"
                                value="Guardar" />
                            <input type="button" id="btnCancelEditChemical" onclick="on_closeEditChemical();return false;"
                                value="Cancelar" style="width: 80px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <span style="float: right;"><a href="mailto:inspiracode@gmail.com?Subject=From%20Chemicals%20Inventory"
        target="_top">By Inspiracode</a></span> <span class="MainTitle">Chemicals' Inventory</span>
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
                jQuery("#divPleaseWait").hide();
            }
        }
        function load() {
            populateChemicals();
            jQuery('input[type=button]').button();
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
								+ current.ID + ');return false;"'
								+ ' style="height:48px;cursor:pointer;" />',
                        '<img src="Images/folder-icon.png" alt="ProviderFile" onclick="on_ProviderFile_click('
								+ current.ID + ');return false;"'
								+ ' style="height:48px;cursor:pointer;" />',
                        current.Container,
                        current.Status,
                        current.CreateDate,
                        '<img src="images/delete-icon.png" alt="Delete" onclick="on_deleteChemical_click('
							+ current.ID
							+ ',afterDeleteChemical);return false;"'
							+ ' style="height:30px;cursor:pointer;" />',
					    '<img src="images/edit-icon.png" alt="Edit" onclick="on_editChemical_click('
							+ current.ID + ',this);return false;"'
							+ ' style="height:30px;cursor:pointer;" />'
                      ];
                arrChemicalsAdapter.push(arrCells);

            }
            $('#divContanier')
					.html('<input type="button" id="btnNewChemical" value="New Chemical" onclick="on_newChemical_click();return false;" /><br><br><br>' +
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
							        "title": "",
							        "orderable": false
							    }, {
							        "title": "",
							        "orderable": false
							    },
                        ],
							    "order": [0, 'asc']

							});

            jQuery("table th").eq(3).css("color", "white");
            jQuery("table th").eq(3).css("background-color", "blue");
            jQuery("table th").eq(3).css("border-radius", "15px 0 0 0");
            jQuery("table th").eq(4).css("color", "white");
            jQuery("table th").eq(4).css("background-color", "red");
            jQuery("table th").eq(5).css("color", "white");
            jQuery("table th").eq(5).css("background-color", "gold");
            jQuery("table th").eq(5).css("border-radius", "0 15px 0 0");

        }


        function centerPleaseWait() {
            jQuery('#divPleaseWait').css(
					"top",
					(jQuery(window).height() / 2)
							- (jQuery('#divPleaseWait').outerHeight() / 2));
            jQuery('#divPleaseWait').css(
					"left",
					(jQuery(window).width() / 2)
							- (jQuery('#divPleaseWait').outerWidth() / 2));
        }

        function getChemicalByID(idChemical) {
            for (var i = 0; i < Chemicals.length; i++) {
                if (Chemicals[i].ID == idChemical)
                    return Chemicals[i];
            }
            return null;
        }

        function on_editChemical_click(idChemical, source) {
            event.preventDefault();
            var chemicalToUpdate = getChemicalByID(idChemical);
            if (chemicalToUpdate == null) {
                alertify.alert("An error has occurried. Please refresh the page and try again.");
                return;
            }
            jQuery("#btnEditChemical").prop("disabled", false);
            jQuery("#btnCancelEditChemical").prop("disabled", false);

            jQuery("#txtChemicalName").val(chemicalToUpdate.ChemicalName);
            jQuery("#lblID").text(chemicalToUpdate.ID);
            jQuery("#txtHealth").val(chemicalToUpdate.Health);
            jQuery("#txtFlammability").val(chemicalToUpdate.Flammability);
            jQuery("#txtReactivity").val(chemicalToUpdate.Reactivity);
            jQuery("#txtPPE").val(chemicalToUpdate.PPE);
            jQuery("#txtStatus").val(chemicalToUpdate.Status);
            jQuery("#txtPartNumber").val(chemicalToUpdate.PartNumber);
            jQuery("#lblCreationDate").text(chemicalToUpdate.CreateDate);
            jQuery("#txtContainer").val(chemicalToUpdate.Container);

            jQuery("#btnEditChemical").unbind("click").click(function () {
                updateChemical(chemicalToUpdate, afterEditChemical);
            });

            jQuery("#divDialog_EditChemical").dialog({
                autoOpen: true,
                width: 620,
                modal: true,
                closeOnEscape: true,
                title: "Chemical Update"
            });
        }

        function on_closeEditChemical() {
            jQuery("#divDialog_EditChemical").dialog("close");
        }
        function updateChemical(chemicalToUpdate, onSuccess) {
            if (validate()) {
                jQuery("#btnEditChemical").prop("disabled", true);
                jQuery("#btnCancelEditChemical").prop("disabled", true);

                chemicalToUpdate.ChemicalName = jQuery("#txtChemicalName").val();
                //chemicalToUpdate.ID = jQuery("#lblID").val();
                //chemicalToUpdate.CreateDate = jQuery("#txtCreationDate").val();
                chemicalToUpdate.Health = jQuery("#txtHealth").val();
                chemicalToUpdate.Flammability = jQuery("#txtFlammability").val();
                chemicalToUpdate.Reactivity = jQuery("#txtReactivity").val();
                chemicalToUpdate.PPE = jQuery("#txtPPE").val();
                chemicalToUpdate.Status = jQuery("#txtStatus").val();
                chemicalToUpdate.PartNumber = jQuery("#txtPartNumber").val();
                chemicalToUpdate.Container = jQuery("#txtContainer").val();

                //                        var to = '/SMS_Sales_Settings/GatewayServlet?cmd=chemicalUpdate';

                //                        jQuery("#divPleaseWait").css("display", "block");
                //                        jQuery.ajax({
                //                            type: "POST",
                //                            url: to,
                //                            data: JSON.stringify(chemicalToUpdate),
                //                            contentType: "application/json;charset=utf-8",
                //                            dataType: "json",
                //                            success: function (response) {
                //                                //response = jQuery.parseJSON(response);
                //                                if (response.errorThrown === true) {
                //                                    try {
                //                                        onFail();
                //                                    } catch (e) {
                //                                    }
                //                                    alertify.alert(response.responseDescription);
                //                                } else {
                //                                    try {
                onSuccess(chemicalToUpdate);
                //                                    } catch (e) {
                //                                    }
                alertify.success("Record updated successfully."); //                                    alertify.success(response.responseDescription);
                //                                }
                //                                jQuery("#divPleaseWait").hide();
                //                            },
                //                            error: function (jqXHR, textStatus, errorThrown) {
                //                                alertify.alert("An error has occurried.");
                //                                try {
                //                                    onFail();
                //                                } catch (e) {
                //                                }
                //                                jQuery("#btnEditChemical").prop("disabled", false);
                //                                jQuery("#btnCancelEditChemical").prop("disabled", false);
                //                                jQuery("#divPleaseWait").hide();
                //                            }
                //                        });
                //                    } else {
                //                        jQuery("#btnEditChemical").prop("disabled", false);
                //                        jQuery("#btnCancelEditChemical").prop("disabled", false);
                //                        return;
            }
        }
        function afterEditChemical(chemicalUpdated) {
            for (var i = 0; i < Chemicals.length; i++) {
                if (chemicalUpdated.ID == Chemicals[i].ID) {
                    Chemicals[i] = chemicalUpdated;
                    populateChemicals();
                    break;
                }
            }
            jQuery("#divDialog_EditChemical").dialog("close");
        }

        function on_deleteChemical_click(idChemical, onSuccess) {
            if (confirm("Are you sure you want to delete a record?")) {
                //                        var to = '/SMS_Sales_Settings/GatewayServlet?cmd=directorDelete&directorid='
                //						+ idChemical;

                //                        jQuery("#divImgEmail").show();

                //                        jQuery.ajax({
                //                            type: "POST",
                //                            url: to,
                //                            data: {},
                //                            contentType: "application/json;charset=utf-8",
                //                            dataType: "html",
                //                            success: function (response) {
                //                                response = jQuery.parseJSON(response);
                //                                if (response.errorThrown === true) {
                //                                    try {
                //                                        onFail();
                //                                    } catch (e) {
                //                                    }
                //                                    alertify.alert(response.responseDescription);
                //                                } else {
                //                                    try {
                onSuccess(idChemical);
                //                                    } catch (e) {
                //                                    }
                alertify.success("Record deleted successfully."); //                                    alertify.success(response.responseDescription);
                //                                }
                //                                jQuery("#divImgEmail").hide();
                //                            },
                //                            error: function (jqXHR, textStatus, errorThrown) {
                //                                alertify.alert("An error has occurried.");
                //                                try {
                //                                    onFail();
                //                                } catch (e) {
                //                                }
                //                                jQuery("#divImgEmail").hide();
                //                            }
                //                        });
            }
        }

        function afterDeleteChemical(idChemical, source) {
            for (var i = 0; i < Chemicals.length; i++) {
                if (idChemical == Chemicals[i].ID) {
                    Chemicals.splice(i, 1);
                    break;
                }
            }
            populateChemicals();
        }
        function on_newChemical_click() {
            event.preventDefault();
            jQuery("#btnEditChemical").prop("disabled", false);
            jQuery("#btnCancelEditChemical").prop("disabled", false);

            jQuery("#txtChemicalName").val('');
            jQuery("#lblID").text('(New)');
            jQuery("#txtHealth").val('');
            jQuery("#txtFlammability").val('');
            jQuery("#txtReactivity").val('');
            jQuery("#txtPPE").val('');
            jQuery("#txtStatus").val('');
            jQuery("#txtPartNumber").val('');
            jQuery("#lblCreationDate").text('---');
            jQuery("#txtContainer").val('');

            jQuery("#btnEditChemical").unbind("click").click(function () {
                createChemical(afterCreateChemical);
            });

            jQuery("#divDialog_EditChemical").dialog({
                autoOpen: true,
                width: 620,
                modal: true,
                closeOnEscape: true,
                title: "New Chemical"
            });
        }
        function createChemical(onSuccess) {
            if (validate()) {
                jQuery("#btnEditChemical").prop("disabled", true);
                jQuery("#btnCancelEditChemical").prop("disabled", true);

                var chemicalToCreate = {};

                chemicalToCreate.ChemicalName = jQuery("#txtChemicalName").val();
                chemicalToCreate.ID = Chemicals.length + 1;
                chemicalToCreate.CreateDate = new Date().toLocaleString(); // jQuery("#txtCreationDate").val();
                chemicalToCreate.Health = jQuery("#txtHealth").val();
                chemicalToCreate.Flammability = jQuery("#txtFlammability").val();
                chemicalToCreate.Reactivity = jQuery("#txtReactivity").val();
                chemicalToCreate.PPE = jQuery("#txtPPE").val();
                chemicalToCreate.Status = jQuery("#txtStatus").val();
                chemicalToCreate.PartNumber = jQuery("#txtPartNumber").val();
                chemicalToCreate.Container = jQuery("#txtContainer").val();

                //                        var to = '/SMS_Sales_Settings/GatewayServlet?cmd=chemicalCreate';

                //                        jQuery("#divPleaseWait").css("display", "block");
                //                        jQuery.ajax({
                //                            type: "POST",
                //                            url: to,
                //                            data: JSON.stringify(chemicalToCreate),
                //                            contentType: "application/json;charset=utf-8",
                //                            dataType: "json",
                //                            success: function (response) {
                //                                //response = jQuery.parseJSON(response);
                //                                if (response.errorThrown === true) {
                //                                    try {
                //                                        onFail();
                //                                    } catch (e) {
                //                                    }
                //                                    alertify.alert(response.responseDescription);
                //                                } else {
                //                                    try {
                var response = {};
                response.result = chemicalToCreate
                onSuccess(response);
                //                                    } catch (e) {
                //                                    }
                alertify.success("Record created successfully."); //                                    alertify.success(response.responseDescription);
                //                                }
                jQuery("#btnEditChemical").prop("disabled", false);
                jQuery("#btnCancelEditChemical").prop("disabled", false);
                jQuery("#divPleaseWait").hide();
                //                            },
                //                            error: function (jqXHR, textStatus, errorThrown) {
                //                                alertify.alert("An error has occurried.");
                //                                try {
                //                                    onFail();
                //                                } catch (e) {
                //                                }
                //                                jQuery("#btnEditChemical").prop("disabled", false);
                //                                jQuery("#btnCancelEditChemical").prop("disabled", false);
                //                                jQuery("#divPleaseWait").hide();
                //                            }
                //                        });
            } else {
                jQuery("#btnEditChemical").prop("disabled", false);
                jQuery("#btnCancelEditChemical").prop("disabled", false);
                return;
            }
        }
        function afterCreateChemical(response) {
            var current = response.result;
            Chemicals.push(current);
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
							+ ',afterDeleteChemical);return false;"'
							+ ' style="height:30px;cursor:pointer;" />',
					    '<img src="images/edit-icon.png" alt="Edit" onclick="on_editChemical_click('
							+ current.ID + ',this);return false;"'
							+ ' style="height:30px;cursor:pointer;" />'
                      ];

            $('#tableChemicals').DataTable().row.add(arrCells).draw();
            jQuery("#divDialog_EditChemical").dialog("close");

        }

        function on_ExcelFile_click(idChemical) {
            window.open("/WebServices/Catalogs.aspx?cmd=downloadExcelFile&idChemical=" + idChemical, '_self');
        }
        function on_ProviderFile_click(idChemical) {
            window.open("/WebServices/Catalogs.aspx?cmd=downloadProviderFile&idChemical=" + idChemical, '_self');
        }
        
    </script>
</body>
</html>
