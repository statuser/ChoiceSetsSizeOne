/*
Lighthouse Studio - Web Surveying System
Copyright Sawtooth Software, Inc. All rights reserved.
Orem, UT  USA  801-477-4700 
*/

$(document).ready(function ()
{
    if ($("#sign_in_username").length)
    {
        $("#sign_in_username").focus();
    }

    $("#forgot_password_button").on("click", function (event)
    {
        event.preventDefault();
        SSI_ShowAlert("The Lighthouse Admin username and password is set within the Lighthouse Studio authoring program.  To change the username and password go to \"Field, Hosting Management\" within Lighthouse Studio and then click on the \"Admin Module\" tab.  In order for the changes to take affect you will need to reupload the survey. ", "Forgot Password?", 500, 330);
    });

    $(".green_button, .menu_link, .bold_link, .next_button").on("click", function (event)
    {
        event.preventDefault();

        var link = $(this);
        var display_page = this.id;

        if (!link.hasClass("prompt_link") && display_page != "view_data_search")
        {
            if (display_page)
            {
                if (display_page == "sign_in_button")
                {
                    display_page = "study_summary";
                }
                else if (display_page == "open_survey_link")
                {
                    display_page = "close_survey_open";
                }
				else if(display_page == "survey_log")
                {
					//If they click on the survey_log link in the menu, clear out any filter
                    $("#survey_log_filter").val(0);
                }
                else if(display_page == "view_survey_log_link")
                {
                    display_page = "survey_log";
                }
                else if (display_page == "show_all_log_activity")
                {
                    display_page = "survey_log";
                }

                DisplayName(display_page);
            }
        }
    });

    $(".download_builder_checkbox input").on("change", function ()
    {
        ToggleDownloadDataBuilder();
    });

    $(".question_report_box").each(function ()
    {
        var question_report_box = $(this);
        ShowReportChart(question_report_box);
    });

    $(".chart_display_dropdown").on("change", function ()
    {
        var chart_display_select = $(this);
        ShowReportChart(chart_display_select.closest(".question_report_box"));
        UpdateReportSettings(chart_display_select);
    });

    $(".report_settings_link").on("click", function (event)
    {
        event.preventDefault();

        var link = $(this);

        SetReportSettings(link);

        document.mainform.hid_page.value = "view_data_report_settings";
        document.mainform.submit();
    });

    $("#view_data_save1, #view_data_save2").on("click", function ()
    {
        SaveDataCheck();
    });

    $("#view_data_delete, #view_data_delete1, #view_data_delete2").on("click", function ()
    {
        DeleteRecordsDialog();
    });

    $("#view_data_remove, #view_data_remove1, #view_data_remove2").on("click", function ()
    {
        RemoveRecordsDialog();
    });

    $(".mass_edit_records_save").on("click", function ()
    {
        MassEditRecordsSaveDialog();
    });

    $("#result_list").on("change", function () 
    {
        ToggleResultListButtons();
    });

    $("#removed_list").on("change", function () 
    {
        ToggleRemovedListButtons()
    });

    $(".mass_edit_records_cancel").on("click", function () 
    {
        document.mainform.hid_page.value = "mass_edit_records_cancel";
        document.mainform.submit();
    });

    $("#view_data_restore, #view_data_restore1, #view_data_restore2").on("click", function ()
    {
        RestoreRecordsDialog();
    });

    $(".data_report_box").each(function ()
    {
        var report = $(this);
        var id = parseInt(report.attr("data-report_id"));

        var save_report_box = report.find(".save_report_box");
        var edit_report_box = report.find(".edit_report_box");

        if (id)
        {
            save_report_box.hide();
            edit_report_box.show();
        }
        else
        {
            save_report_box.show();
            edit_report_box.hide();
        }
    });

    $(".crosstab_container").each(function ()
    {
        $(this).tabs(
        {
            activate: function (event, ui)
            {
                var panel = ui.newPanel;
                var question_box = panel.closest(".question_report_box");
                var chart_box = panel;

                ShowReportChart(question_box, chart_box);
            }
        });
    });

    if ($("#summary_chart").length)
    {
        var chart_box = $("#summary_chart");

        var completes = parseInt(chart_box.attr("data-completes"));
        var incompletes = parseInt(chart_box.attr("data-incompletes"));
        var disqualifieds = parseInt(chart_box.attr("data-disqualifieds"));
        var data =
        [
            { "label": "Completes", "value": completes, "color": "#80ad38" },
            { "label": "Incompletes", "value": incompletes, "color": "#dcdcdc" },
            { "label": "Disqualified", "value": disqualifieds, "color": "#da1d24" }
		];

		CreateBarChart("summary_chart", data, { "min_yAxis_value": 20 });
	}

	$("#sign_in_username, #sign_in_password").on("keydown", function (event)
	{
	    //This is needed for various browsers
	    var key_pressed = event.which || event.keyCode || event.charCode;

	    //Enter
	    if (key_pressed == 13)
	    {
	        DisplayName("study_summary");
	    }
	});

	$("#question_report, #update_report").on("click", function (event)
	{
	    var link = this;
	    var result = CreateReportCheck();

	    if(result && link.id)
	    {
	        DisplayName(link.id);
	    }
	});

	InitializeCheckBoxes($(".checkbox_group"));
	InitializeCheckAllControl();

    //Allow them to check a checkbox
	$("body").on("click", ".checkbox_control", function ()
	{
	    var checkbox_control = $(this).closest(".checkbox_control");

	    if (checkbox_control.attr("data-value") == "checked")
	    {
	        ToggleCheckbox(checkbox_control, false);
	    }
	    else
	    {
	        ToggleCheckbox(checkbox_control, true);
	    }

	    var group_box = checkbox_control.closest(".checkbox_group");

	    if (group_box.length)
	    {
	        ToggleCheckAll(checkbox_control);
	    }

	    UpdateCheckboxInput(checkbox_control);
	});

	$("#show_filters").on("click", function (event)
	{
	    event.preventDefault();
	    $(this).hide();
	    $("#filter_settings").show();
	});

	$("#view_saved_report").on("click", function (event)
	{
	    event.preventDefault();

	    var link = this;
	    var result = AreItemsSelected("saved_reports", "No reports have been selected.");

	    if (result && link.id)
	    {
	        DisplayName(link.id);
	    }
	});

	$("#delete_saved_report").on("click", function (event)
	{
	    event.preventDefault();
	    var result = AreItemsSelected("saved_reports", "No reports were selected.  Select the reports you would like to delete.");

	    if (result)
	    {
	        DeleteReportDialog();
	    }
	});

	$("#reset_survey_reset").on("click", function (event)
	{
	    event.preventDefault();

	    ResetSurveyDialog();
	});

	$("#mobile_menu_link").on("click", function (event)
	{
	    event.preventDefault();

	    $("#menu").slideToggle(300);
	});

	DetectCrosstabStage();

	if($("#chart_display_settings_table select").length)
	{
	    TogglePieOption();
	}

	if($(".error_log_line").length)
	{
	    var stage = $(".error_log_line").closest(".stage");
	    stage.addClass("error_log");
	}

	$(".toggle_log_details_link").on("click", function (event)
    {
	    event.preventDefault();
	    var link = $(this);
	    var details = link.closest(".log_row").find(".details");

	    if (link.hasClass("open"))
	    {
	        details.hide();
	        link.removeClass("open");
	        link.html("Show Details");
	    }
	    else
	    {
	        details.show();
	        link.addClass("open");
	        link.html("Hide Details");
	    }
	});

	$("#survey_log_filter").on("change", function (event)
    {
	    DisplayName("survey_log");
	});

    HighlightLink();
    
    $('input[name$="_override"]').each(function() 
    {
        var ToggleFunction = function (checked)
        {
            if (checked) 
            {
                dummy_input.css("display", "none");
                actual_input.css("display", "inline-block");
                actual_input.prop("disabled", false);
            } 
            else 
            {
                dummy_input.css("display", "inline-block");
                actual_input.prop("disabled", true);
                actual_input.css("display", "none");
            }
        }

        var dummy_input = $(this).parent().next();
        var actual_input = dummy_input.next();

        // hide actual input boxes
        actual_input.prop("disabled", true);
        actual_input.css("display", "none");

        ToggleFunction($(this).prop("checked"))

        $(this).on("change", function (event)
        {
            ToggleMassEditSaveButtons();
            ToggleFunction(event.target.checked);
        });
    });

    ToggleMassEditSaveButtons();
    ToggleResultListButtons();
    ToggleRemovedListButtons();
    ToggleDownloadDataBuilder();

    var toggle_button = $("#removed_list_toggle");
    var toggled_content = toggle_button.parent().next(".stage_content");

    SetupCollapseExpand(toggle_button, toggled_content);

    $("#filter_tabs").tabs();

    $("#view_edit_filter_button").on("click", function ()
	{
	    FilterDialog();
    });
    
    $(".filter_cancel").click(function () {
        $("#filter_tabs").dialog("close");
    });

    $("#view_data_search").click(function () {
        if (!VerifySearchLogic()) 
        { 
            return; 
        }
        var num_vars = $("[id^=variable_]").length;

        CreateDynamicInputField("status", $("#status").val());

        for (var i = 1; i <= num_vars; i++) 
        {
            CreateDynamicInputField("variable_" + i, $("#variable_" + i).val());
            CreateDynamicInputField("operator_" + i, $("#operator_" + i).val());
            CreateDynamicInputField("value_" + i, $("#value_" + i).val());
            if (i < num_vars)
            {
                CreateDynamicInputField("joiner_" + i, $("#joiner_" + i).val());
            }
        }
        DisplayName("view_data_search");
    });

    $("#view_data_search_list").click(function () 
    {
        CreateDynamicInputField("data_list", $("#data_list").val());
        CreateDynamicInputField("reference_variable", $("#reference_variable").val());
        DisplayName("view_data_search_list");
    });

    $("#clear_filters_button").click(function ()
    {
        $("#view_all_data").click();
    });

    ShowClearFiltersButton();

    HideSearchLink();
});

function SetUpPage()
{
    $(".save_report_link").click(function (event)
    {
        event.preventDefault();

        var link = $(this);

        SetReportSettings(link);

        var data_report_box = link.closest(".data_report_box");

        var save_dialog = $("#save_report_dialog");

        save_dialog.data("data_report_box", data_report_box);

        save_dialog.dialog("open");
    });

    $("#report_name").keyup(function (event)
    {
        //If they hit the enter key, save
        if (event.keyCode == 13)
        {
            SaveReportSave(global_path);
        }
    });

    $("#report_name").keydown(function (event)
    {
        //Prevent " from being in a report name.  " gives HTML names problems.
        if (event.keyCode == 222)
        {
            event.preventDefault();
        }
    });
}

function ToggleDownloadDataBuilder()
{
    var anyChecked = $("#with_completes").is(":checked") || $("#with_incompletes").is(":checked") || $("#with_disqualified").is(":checked");
    $("#download_data_builder").prop("disabled", !anyChecked);
}

function ToggleMassEditSaveButtons()
{
    var saveButtons = $(".mass_edit_records_save");
    if (saveButtons.length)
    {
        var override_checkboxes = $('input[name$="_override"]:checked');
        var num_checked = override_checkboxes.length;

        if (num_checked) 
        {
            saveButtons.each(function () 
            {
                $(this).prop("disabled", false);
            });
        }
        else 
        {
            saveButtons.each(function () 
            {
                $(this).prop("disabled", true);
            });
        }
    }
}

function ToggleResultListButtons()
{
    var num_selected = $('#result_list :selected').length;
    $("#view_data_next1").prop("disabled", num_selected == 0);
    $("#mass_edit_records").prop("disabled", num_selected < 2);
    $("#view_data_remove").prop("disabled", num_selected == 0);
}

function ToggleRemovedListButtons()
{
    var num_selected = $('#removed_list :selected').length;
    $("#view_data_removed").prop("disabled", num_selected == 0);
    $("#mass_edit_records_removed").prop("disabled", num_selected < 2);
    $("#view_data_restore").prop("disabled", num_selected == 0);
    $("#view_data_delete").prop("disabled", num_selected == 0);
}

function SetupCollapseExpand(button, wrapper) 
{
    var collapsed_class = "collapsed";

    button.addClass("collapse_button");
    wrapper.addClass("collapse_area");

    if (button.hasClass(collapsed_class))
    {
        wrapper.height(0);
        wrapper.addClass(collapsed_class);
    }
    else if (wrapper.hasClass(collapsed_class))
    {
        wrapper.height(0);
        button.addClass(collapsed_class);
    }
    else 
    {
        wrapper.height(GetHeightOfChildren(wrapper));
    }

    $(window).on("resize", function () 
    {
        if (!wrapper.hasClass(collapsed_class))
        {
            wrapper.height(GetHeightOfChildren(wrapper));
        }
    });
    
    button.click(function() {
      if (wrapper.hasClass(collapsed_class)) 
      {
        button.removeClass(collapsed_class);
        wrapper.removeClass(collapsed_class);
        wrapper.height(GetHeightOfChildren(wrapper));
      } 
      else 
      {
        button.addClass(collapsed_class);
        wrapper.addClass(collapsed_class);
        wrapper.height(0);
      }
    });
}

function GetHeightOfChildren(element) 
{
    var totalHeight = 0;
    element.children().each(function() 
    {
        totalHeight += $(this)[0].offsetHeight;
    });
    return totalHeight;
}

function CreateDynamicInputField(name, value)
{
    $('#mainform').append('<input type="hidden" name="' + name + '" value="' + value + '" />');
}

function DisplayName(page_name)
{
    document.mainform.hid_page.value = page_name;
    document.mainform.submit();
}

function HideSearchLink()
{
    // Search link timebomb :)
    if (new Date() > new Date("2021-04-01"))
    {
        $("#search_data").closest(".menu_item").hide();
    }
}

function HighlightLink()
{
    //This is needed for backing up with the browser.  The JavaScript can change "hid_page" right before submitting and therefore backing up does not restore the original page. 
    var hid_page = $("#hid_original_page");

    if (hid_page.length)
    {
        var page_name = hid_page.val();

        if (page_name == "question_report")
        {
            page_name = "data_reports";
        }
        else if (page_name == "test_survey_admin")
        {
            page_name = "test_survey";
        }
        else if (page_name == "test_survey_return" || page_name == "test_survey_return2")
        {
            page_name = "study_summary";
        }
        else if (page_name == "view_data_search_list" || page_name == "view_data_search")
        {
            page_name = "view_all_data";
        }

        var link = $("#" + page_name);

        if (link.length)
        {
            link.closest(".menu_item").addClass("active");
        }
    }
}

function AddPasswords(strAdminURL, strStudyName, strSession, intPasswordOffset, strDBTableName, intPasswordOffsetTest)
{
    $.post(strAdminURL,
	{
	    studyname: strStudyName,
	    hid_api: "add_passwords",
	    hid_session: strSession,
	    password_offset: intPasswordOffset,
		db_table_name: strDBTableName,
		test_password_offset: intPasswordOffsetTest,
	    t: new Date().getTime()
	},

		function (data)
		{
		    var success = data.result;

		    if (success)
		    {
		        var intNewPasswordOffset = data.password_offset;

		        if (intNewPasswordOffset > 0)
		        {
		            var intNewPasswordOffsetKB = parseInt(intNewPasswordOffset / 1024);
		            $("#password_offset").html(intNewPasswordOffsetKB);

		            AddPasswords(strAdminURL, strStudyName, strSession, intNewPasswordOffset, strDBTableName, intPasswordOffsetTest);
		        }
		        else
		        {
		            $("#loading_passwords").html("<b>Finished loading passwords!</b>");
		            $(".all_finished_message").show();
		            $(".main_menu_button").show();
		        }
		    }
		    else
		    {
		        SSI_ShowAlert(data.error, "Add Passwords Error");
		    }
		});
}

function RunSecurityTest(intConfigSize, strConfigURL, strAdminURL)
{
    $.get(strAdminURL, { name: "admin", t: new Date().getTime() },
		function (data)
		{
		    SecurityCheckText(data, 1, intConfigSize, strConfigURL, strAdminURL);
		}
	);

    $.get(strAdminURL, { name: "config", t: new Date().getTime() },
		function (data)
		{
		    SecurityCheckText(data, 2, intConfigSize, strConfigURL, strAdminURL);
		}
	);
}

function SecurityCheckText(strResponse, intCode, intConfigSize, strConfigURL, strAdminURL)
{
    var strMsg = "";

    if (strResponse)
    {
        var strText = strResponse;

        if (intCode == 2)
        {
            if (strText != "")
            {
                if (strText.length == intConfigSize)
                {
                    strMsg = "<li><b>Warning:</b> The *.cgi files (including data and password files) are visible to the world.";
                    strMsg += "&nbsp;The server needs to be configured so that it will not permit a web browser to display the contents of *.cgi files.";
                    strMsg += "<br>See: <a target='config' href='" + strConfigURL + "'>" + strConfigURL + "</a></li>";

                    $("#setup_error_text1").html("<ul>" + strMsg + "</ul>");
                }
            }
        }

        if (intCode == 1)
        {
            if (strText.match("_config"))
            {
                strMsg = "<li><b>Warning:</b> Directory listings are visible to the world.  This allows others to see what files and folders are on your server.";
                strMsg += "&nbsp;The server needs to be configured so that files and folders cannot be seen.";
                strMsg += "<br>See: <a target='admin' href='" + strAdminURL + "'>" + strAdminURL + "</a></li>";

                var strText = $("#setup_error_text2").html("<ul>" + strMsg + "</ul>");
            }
        }

        if (strMsg)
        {
            $("#setup_error").show();
        }
    }
}

function CreateLink(link_name, callback)
{
    $("#" + link_name).on("click", function (event)
    {
        var execute_link = true;
        var link_location = link_name;

        if (callback)
        {
            if (!callback())
            {
                execute_link = false;
            }
        }

        if (execute_link)
        {
            DisplayName(link_location);
        }
    });
}

function VerifySearchLogic()
{
    var i = 0;
    var blnDefined = false;
    var strVarName = "";
    var blnSuccess = true;
    var strJoiner = "";
    var strOperator = "";
    var strValue = "";

    for (i = 1; i <= 100; i++)
    {
        if ($("#variable_" + i).length > 0)
        {
            blnDefined = false;
            strJoiner = "";
            strVarName = $("#variable_" + i).val();
            strOperator = $("#operator_" + i).val();
            strValue = $("#value_" + i).val();

            if ($("#joiner_" + i))
            {
                strJoiner = $("#joiner_" + i).val();
            }

            if (strVarName || strOperator || strValue || strJoiner)
            {
                blnDefined = true;
            }

            if (blnDefined)
            {
                if (strVarName == "")
                {
                    SSI_ShowAlert("Row #" + i + " is missing a variable name.", "Error");
                    blnSuccess = false;
                    break;
                }
                else if (strOperator == "")
                {
                    SSI_ShowAlert("Row #" + i + " is missing an operator.", "Error");
                    blnSuccess = false;
                    break;
                }
            }

            if (i > 1)
            {
                var strPriorJoiner = $("#joiner_" + (i - 1)).val();

                if (blnDefined)
                {
                    if (strPriorJoiner == "")
                    {
                        SSI_ShowAlert("Row #" + i + " needs to be joined to the prior row with an AND or an OR.", "Error");
                        blnSuccess = false;
                        break;
                    }
                }
                else
                {
                    if (strPriorJoiner != "")
                    {
                        SSI_ShowAlert("Remove the AND or OR from row " + (i - 1) + ".", "Error");
                        blnSuccess = false;
                        break;
                    }
                }
            }
        }
        else
        {
            break;
        }
    }

    return blnSuccess;
}

function ToggleCheck(check_item)
{
    var check_input = check_item.find("input");

    var input_item = check_input[0];

    if (input_item.checked)
    {
        input_item.checked = false;
        check_item.removeClass("checked");
    }
    else
    {
        input_item.checked = true;
        check_item.addClass("checked");
    }
}

function DetectCrosstabStage()
{
    var cross_tab_tables = $(".crosstabs_table");

    if (cross_tab_tables.length)
    {
        $(".stage").attr("id", "crosstab_stage");
    }
}

function ToggleChartDisplaySettings(item_checked)
{
    var rows_box = $(item_checked).closest("#rows_select_box");

    if (rows_box.length)
    {
        var display_table = $("#chart_display_settings_table");

        if (display_table.length)
        {
            var setting_lookup = [];

            display_table.find(".chart_display_row").each(function ()
            {
                var row = $(this);

                if (!row.hasClass("chart_display_template"))
                {
                    var select_obj = row.find("select");

                    setting_lookup[select_obj.attr("name")] = select_obj.val();

                    row.remove();
                }
            });

            rows_box.find(".check_option").each(function ()
            {
                var check_obj = $(this);

                if (check_obj.find("input").is(":checked"))
                {
                    var new_row = $(".chart_display_template").clone();

                    new_row.removeClass("chart_display_template");

                    var label = check_obj.find(".check_label").html();

                    new_row.find(".report_row_name").html(label);

                    var input_name = "chart_display_" + label;

                    new_row.find("select").attr("name", input_name);

                    if (input_name in setting_lookup)
                    {
                        new_row.find("select").val(setting_lookup[input_name]);
                    }

                    $("#chart_display_settings_table").append(new_row);
                }
            });
        }
    }
    else
    {
        var rows_box = $(item_checked).closest("#cols_select_box");

        if (rows_box.length)
        {
            TogglePieOption();
        }
    }
}

function ShowReportChart(question_box, chart_box)
{
    var chart_display_select = question_box.find(".chart_display_dropdown");
    var selected_val = chart_display_select.val();

    if (chart_box == null)
    {
        chart_box = question_box.find(".chart_box").first();
    }

    if (selected_val == 0)
    {
        HideChart(chart_box);
    }
    else
    {
        ShowChart(chart_box)

        var id_name = chart_box.attr("id");

        if (selected_val == 1)
        {
            if (chart_box.hasClass("crosstab_chart"))
            {
                //For cross tab charts (in tabs) I had to only create the chart once and then hide it, instead of recreating it each time like with marginals
                //For some reason recreating it does not work with the tabs etc.
                if (!chart_box.hasClass("has_chart"))
                {
                    CreateMultiBarChart(id_name, global_chart_data[id_name + "_data"], { "min_yAxis_value": 100, "percent": true });
                    chart_box.addClass("has_chart");
                }
            }
            else
            {
                RemoveChart(chart_box);
                CreateBarChart(id_name, global_chart_data[id_name + "_data"], { "min_yAxis_value": 100, "percent": true });
            }
        }
        else if (selected_val == 2)
        {
            RemoveChart(chart_box);
            CreatePieChart(id_name, global_chart_data[id_name + "_data"], { "percent": true });
        }
    }
}

function HideChart(chart_box)
{
    if (chart_box.hasClass("crosstab_chart"))
    {
        var container = chart_box.closest(".crosstab_container");
        container.hide();
    }
    else
    {
        chart_box.hide();
    }
}

function ShowChart(chart_box)
{
    if (chart_box.hasClass("crosstab_chart"))
    {
        var container = chart_box.closest(".crosstab_container");
        container.show();
    }
    else
    {
        chart_box.show();
    }
}

function RemoveChart(chart_box)
{
    chart_box.find("svg").remove();
    chart_box.html("<svg></svg>");
}

//If this is cross tab report toggle showing the pie option
function TogglePieOption()
{
    if ($("#banners_col").length && $("#chart_display_settings_table").length)
    {
        var checked_items = $("#banners_col").find(".checked");

        $(".chart_drop_down").each(function ()
        {
            var drop_down = $(this);

            //Only do this for non template
            if (drop_down.closest(".chart_display_template").length == 0)
            {
                var pie_option = 0;

                if (checked_items.length)
                {
                    pie_option = drop_down.find(".chart_display_pie");

                    pie_option.remove();
                }
                else
                {
                    if (drop_down.find(".chart_display_pie").length == 0)
                    {
                        var new_drop_down = $(".chart_display_template .chart_drop_down").clone();

                        drop_down.after(new_drop_down);

                        drop_down.remove();
                    }
                }
            }
        });
    }
}

function UpdateReportSettings(chart_display_select)
{
    var value = chart_display_select.val();
    var question_box = chart_display_select.closest(".question_report_box");
    var quest_name = question_box.attr("data-var_name");
    var report_box = chart_display_select.closest(".data_report_box");
    var report_settings = report_box.attr("data-report_settings");

    var regex = new RegExp("\"chart_display_" + quest_name + ".*?,", "i");
    var new_line = "\"chart_display_" + quest_name + "\" => " + value + ","; //Need trailing comma for Perl regex

    var report_settings = report_settings.replace(regex, new_line);

    report_box.attr("data-report_settings", report_settings);
}

function GetLargestTableWidth(strTableClassName)
{
    var intMaxWidth = 0;
    var i = 0;
    var intTableWidth = 0;

    var AllTablesArray = $("." + strTableClassName).toArray();

    for (i = 0; i < AllTablesArray.length; i++)
    {
        intTableWidth = $(AllTablesArray[i]).width();

        if (intTableWidth > intMaxWidth)
        {
            intMaxWidth = intTableWidth;
        }
    }

    return intMaxWidth;
}

function SaveReportDialog(strPath)
{
    $("#save_report_progress").hide();

    $("#save_report_dialog").dialog({
        title: "Save Report",
        autoOpen: false,
        width: 450,
        height: 300,
        modal: true,
        resizable: false,
        buttons:
		[
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_save_report_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Save",
                class: "primary_button",
			    id: "save_report_button",
			    click: function ()
			    {
			        SaveReportSave(strPath);
			    }
			}
		],
        open: function (event, ui)
        {
            ResetFocusOnDialogOpen();
            $("#save_report_note").show();
        },
        close: function (event, ui)
        {
            $(".error_msg").remove();
            $("#save_report_progress").hide();
            $("#report_name").val("");
        }
    });
}

function SaveReportSave(strPath)
{
    $(".error_msg").remove();
    $("#save_report_note").hide();
    $("#save_report_progress").show();

    var display_settings = "";

    $(".chart_display_dropdown").each(function ()
    {
        var display_input = $(this);
        var option = display_input.val();
        var quest_report = display_input.closest(".question_report_box");
        var var_name = quest_report.attr("data-var_name");

        display_settings += "\"chart_display_" + var_name + "\" => " + option + ",\n";
    });

    var blnSuccess = false;
    var strMessage = "";

    var ResponseObj = $.ajax(
	{
	    type: "POST",
	    url: strPath,
	    cache: false,
	    data: ({
	        hid_studyname: document.mainform["hid_studyname"].value,
	        hid_session: document.mainform["hid_session"].value,
	        hid_page: "save_report",
	        report_name: $("#report_name")[0].value,
	        hid_report_settings: $("#hid_report_settings").val(),
	        hid_report_chart_settings: display_settings
	    }),
	    dataType: "json",
	    success: function (data)
	    {
	        $("#save_report_progress").hide();

	        if (data.error)
	        {
	            $("#save_report_name_box").before("<div class=\"error_msg\" style=\"font-weight: normal;\"><b>Error:</b> " + data.error + "</div>");
	        }
	        else
	        {
	            var name = $("#report_name").val();

	            $("#report_name_label").html(" - " + name);

	            var save_dialog = $("#save_report_dialog");
	            var data_report_box = save_dialog.data("data_report_box");
	            data_report_box.attr("data-report_id", data.id);
	            data_report_box.attr("data-report_settings", data.settings),
				data_report_box.attr("data-report_name", name);
	            data_report_box.find(".save_report_box").hide();
	            data_report_box.find(".edit_report_box").show();

	            $("#save_report_dialog").dialog("close");
	        }
	    },
	    error: function (error_obj, error_msg)
	    {
	        $("#save_report_progress").hide();
	        alert(error_msg);
	    }
	});
}

function RetrieveFilterObject(name)
{
    try {
        var element = $("[name=" + name + "]");

        if (element.length > 0)
        {
            if (element.val()) 
            {
                var obj = JSON.parse(element.val());
                if (typeof obj == 'object') 
                {
                    return obj;
                }
            }
        }
    } catch(e) {}

    return {};
}

function ShowClearFiltersButton()
{
    var filterObject = RetrieveFilterObject("filter_object");
    var filterListObject = RetrieveFilterObject("filter_list_object");

    if (!$.isEmptyObject(filterObject) || !$.isEmptyObject(filterListObject))
    {
        $("#clear_filters_button").show();
    }
}

function FilterDialog()
{
    $("#filter_tabs").dialog({
        title: "Filter Data",
        autoOpen: false,
        width: "auto",
        height: "auto",
        modal: true,
        resizable: false,
        minHeight:"auto",
        dialogClass: "filter_dialog",
        open: function () {
            var filterObject = RetrieveFilterObject("filter_object");

            $("#filter_tabs_1 :input").not("button").each(function () 
            {
                var saved_input = filterObject[$(this)[0].id];
                if (saved_input) $(this).val(saved_input);
            });

            var filterListObject = RetrieveFilterObject("filter_list_object");

            $("#filter_tabs_2 :input").not("button").each(function () 
            {
                var saved_input = filterListObject[$(this)[0].id];
                if (saved_input) $(this).val(saved_input);
            });
        }
    });

    $("#filter_tabs").dialog("open");
}

function DeleteReportDialog()
{
    $("#delete_report_dialog").dialog({
        title: "Delete Reports?",
        autoOpen: false,
        width: 500,
        height: 225,
        modal: true,
        resizable: false,
        buttons:
		[
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_delete_report_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Delete",
                class: "destructive_button",
			    id: "delete_report_button",
			    click: function ()
			    {
			        DeleteReports(global_path);
			    }
			}
        ],
        open: function ()
        {
            ResetFocusOnDialogOpen()
        },
        close: function (event, ui)
        {
            $(".error_msg").remove();
        }
    });

    $("#delete_report_dialog").dialog("open");
}

function DeleteReports(strPath)
{
	$(".error_msg").remove();
	
	var blnSuccess = false;
	var strMessage = "";

	var strDeleteNames = $("#saved_reports").val();

	var ResponseObj = $.ajax({
			type: "POST",
			url: strPath,
			cache: false,
			data: ({
					hid_studyname: document.mainform["hid_studyname"].value,
					hid_session: document.mainform["hid_session"].value,
					hid_page: "delete_reports",
					report_names: strDeleteNames
				}),
			async:false,
			dataType: "json"
		}).responseText;

	if(ResponseObj)
	{	
		try
		{
			ResponseObj = $.parseJSON(ResponseObj);

			if (ResponseObj.error)
			{
				strMessage = ResponseObj.error;
			}
			else
			{
				blnSuccess = true;
			}
		}
		catch(err)
		{
			strMessage = err;
		}
	}

	if(!blnSuccess)
	{
		$("#reports_to_delete").before("<div class=\"error_msg\" style=\"font-weight: normal;\"><b>Error:</b> " + strMessage + "</div>");
	}
	else
	{
	    //Remove from list
	    var checkbox_group = $("#saved_reports").closest(".checkbox_group");
	    var reports_selected = $("#saved_reports").val();
	    $("#saved_reports").val("");  //Clear out
	    var reports_selected_array = reports_selected.split(",");
		var i = 0;
		var report_name = 0;
		var checkbox = 0;

		for (i = 0; i < reports_selected_array.length; i++)
		{
		    report_name = reports_selected_array[i];

		    checkbox = checkbox_group.find("[data-name='" + report_name + "']");

		    if (checkbox.length)
			{
		        checkbox.remove();
			}
		}

		var check_all = checkbox_group.find(".check_all");

		if (check_all.length)
		{
		    ToggleCheckbox(check_all, false);

		    if (checkbox_group.find(".checkbox_control").length == 1)
		    {
		        check_all.remove();
		    }
		}

		$("#delete_report_dialog").dialog("close"); 
	}
}

function SetReportSettings(link)
{
    var data_report_box = link.closest(".data_report_box");
    var settings = data_report_box.attr("data-report_settings");

    $("#hid_report_settings").val(settings);
}

function AreItemsSelected(checkbox_group_value_id, strMessage)
{
    var items_selected = false;

	if($("#" + checkbox_group_value_id).val())
	{
	    items_selected = true;
	}
	else
	{
		if(strMessage)
		{
		    SSI_ShowAlert(strMessage, "Error");
		}
	}

	return items_selected;
}

function CreateReportCheck()
{
	var blnSuccess = false;

	if (AreItemsSelected("report_rows"))
	{
		blnSuccess = VerifySearchLogic();

		if (blnSuccess)
		{
			if($("#report_name").length)
			{
				var strReportName = $("#report_name")[0].value;

				//Replace start and end white space
				strReportName = strReportName.replace(/\s*/, "");
				strReportName = strReportName.replace(/\s*$/, "");

				if(strReportName == "")
				{
				    SSI_ShowAlert("Please specify a report name.", "Error");
					blnSuccess = false;
				}
			}
		}
	}
	else
	{	
	    SSI_ShowAlert("You must select at least one row in order to create a report.", "Error");
		blnSuccess = false;
	}

	return blnSuccess;
}

function DownloadDataReportSetup()
{
    $(".download_marginals_report").on("click", function ()
    {
        var link = $(this);
        var report = link.closest(".data_report_box");
        SetReportSettings(link);

        var var_name = link.closest(".question_report_box").attr("data-var_name");

        document.mainform.hid_page.value = "download_data_report";
        document.mainform.hid_data_download_name.value = var_name;
        document.mainform.submit();
    });

    $(".download_crosstabs_report").on("click", function ()
    {
        var link = $(this);
        var report = link.closest(".data_report_box");
        SetReportSettings(link);

        var var_name = link.closest(".question_report_box").attr("data-var_name");

        document.mainform.hid_page.value = "download_data_report";
        document.mainform.hid_data_download_name.value = var_name;
        $("#crosstab_download_prompt").dialog("open");
    });

    $("#crosstab_download_prompt").dialog(
    {
        title: "Data to Download...",
        autoOpen: false,
        width: 400,
        height: 225,
        modal: true,
        resizable: false,
        buttons:
		[
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_download_crosstab_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "OK",
                class: "primary_button",
			    id: "download_crosstab_button",
			    click: function ()
			    {
			        var intCrossTabDownloadType = 1;

			        if ($("#download_crosstab_counts")[0].checked)
			        {
			            intCrossTabDownloadType = 2;
			        }

			        document.mainform.hid_download_crosstab_type.value = intCrossTabDownloadType;

			        $(this).dialog("close");
			        document.mainform.submit();
			    }
			}
        ],
        open: function ()
        {
            ResetFocusOnDialogOpen()
        },

    });
}

function EditDataReportSetup()
{
    $(".edit_report_link").on("click", function ()
    {
        var link = $(this);
        var report = link.closest(".data_report_box");
        SetReportSettings(link);

        document.mainform.hid_page.value = "edit_data_report";
        document.mainform.hid_edit_report_id.value = report.attr("data-report_id");
        document.mainform.hid_report_name.value = report.attr("data-report_name");
        document.mainform.submit();
    });
}

function ResetSurveyDialog()
{
    $("<div id=\"prompt\">Are you sure that you want to \"Reset\" your survey and <b>delete all respondent data</b>?</div>").dialog({
        title: "Reset Survey?",
        autoOpen: true,
        width: 400,
        height: 225,
        modal: true,
        resizable: false,
        buttons:
		[
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_reset_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Reset",
                class: "destructive_button",
			    id: "reset_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "reset_survey_reset";
			        document.mainform.submit();
			    }
			}
        ],
        open: function ()
        {
            ResetFocusOnDialogOpen()
        }
    });
}

function SaveDataCheck()
{
    var strMsg = "Save changes and overwrite the original data?";

    $("<div id=\"prompt\">" + strMsg + "</div>").dialog(
	{
	    title: "Save Record?",
	    autoOpen: true,
	    width: 400,
	    height: 250,
	    modal: true,
	    resizable: false,
	    buttons:
		[
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_save_data_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Save",
                class: "primary_button",
			    id: "save_data_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "view_data_save1";
			        document.mainform.submit();
			    }
			}
        ],
        open: function ()
        {
            ResetFocusOnDialogOpen()
        }
	});
}

function RemoveRecordsDialog()
{
    var count = 0;
    if ($("#result_list").length)
    {
        count = $("#result_list").val().length;
    }
    else if ($("#delete_list").length)
    {
        count = $("#delete_list").val().split(',').length;
    }
    var title;
    var strMsg;
    var buttons;
    var height;

    if (count > 0)
    {
        title = "Remove Record?";
        var plurality1 = "record is";
        var plurality2 = "This record";
        var plurality3 = "this record";
        var plurality4 = "this record is";
        var plurality5 = "the record";
        if (count > 1)
        {
            title = "Remove Records?";
            plurality1 = "records are";
            plurality2 = "These records";
            plurality3 = "these records";
            plurality4 = "these records are";
            plurality5 = "records";
        }

        height = 430;
        strMsg = "<div class=\"para\">" + count + " " + plurality1 +
            " about to be removed from the study data set.</div><div class=\"para\">" +
            plurality2 + " will be removed from any quota counts associated with " + plurality3 + ".  " +
            "<span class=\"quota_password_warning\">Any password associated with " + plurality3 +
            " will <b>not</b> be available to use again unless " + plurality4 + " permanently deleted.</span></div>" +
            "<div class=\"para\">" + plurality2 + " can be recovered in the \"Removed Records\" section on the \"View/Edit\" page.</div>" +
            "<div class=\"para\">Continue and remove " + plurality5 + "?</div>";
        buttons =
        [
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_remove_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Remove",
                class: "destructive_button",
			    id: "remove_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "view_data_remove";
			        document.mainform.submit();
			    }
			}
        ];
    }
    else
    {
        title = "Cannot Remove Records";
        height = 200;
        strMsg = "No records are selected.";
        buttons =
        [
            {
                text: "Close",
                class: "secondary_button",
			    id: "close_remove_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            }
        ];
    }

    $("<div id=\"prompt\">" + strMsg + "</div>").dialog(
    {
        title: title,
        responsive: true,
        autoOpen: true,
        width: 500,
        height: height,
        modal: true,
        resizable: false,
        buttons: buttons,
        open: function ()
        {
            ResetFocusOnDialogOpen()
        }
	});
}

function MassEditRecordsSaveDialog() 
{
    var str_list = $('input[name$=result_list]').val();
    var list = str_list.split(',');

    var override_checkboxes = $('input[name$="_override"]:checked');
    var num_checked = override_checkboxes.length;

    if (num_checked)
    {
        var strMsg = "<div class=\"para\">Save changes and override original data for " + list.length + " data records?</div><div class=\"para\">This action cannot be undone.</div>";

        var buttons = [
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "mass_edit_records_cancel_button",
			    click: function ()
			    {
                    $(this).dialog("close");
			    }
            },
            {
                text: "Save",
                class: "primary_button",
			    id: "mass_edit_records_save_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "mass_edit_records_save";
			        document.mainform.submit();
			    }
			}
        ];

        $("<div id=\"prompt\">" + strMsg + "</div>").dialog({
            title: "Override Multiple Records",
            responsive: true,
            autoOpen: true,
            width: 410,
            height: 260,
            modal: true,
            resizable: false,
            buttons: buttons,
            open: function ()
            {
                ResetFocusOnDialogOpen()
            }    
        });  
    }
}

function RestoreRecordsDialog()
{
    var count = 0;
    if ($("#removed_list").length)
    {
        count = $("#removed_list").val().length;
    }
    else if ($("#delete_list").length)
    {
        count = $("#delete_list").val().split(',').length;
    }
    var title;
    var strMsg;
    var buttons;
    var height;

    if (count > 0)
    {
        title = "Restore Record?";
        var plurality1 = "record is";
        var plurality2 = "This record";
        var plurality3 = "this record";
        var plurality4 = "the record";
        if (count > 1)
        {
            title = "Restore Records?";
            plurality1 = "records are";
            plurality2 = "These records";
            plurality3 = "these records";
            plurality4 = "records";
        }

        height = 300;
        strMsg = "<div class=\"para\">" + count + " " + plurality1 +
            " about to be restored to the study data set.</div><div class=\"para\">" +
            plurality2 + " will be restored to any quota counts associated with " + plurality3 + ".  " +
            "<div class=\"para\">Continue and restore " + plurality4 + "?</div>";
        buttons =
        [
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_restore_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
			    text: "Restore",
                id: "restore_record_button",
                class: "primary_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "view_data_restore";
			        document.mainform.submit();
			    }
			}
        ];
    }
    else
    {
        title = "Cannot Restore Records";
        height = 200;
        strMsg = "No records are selected.";
        buttons =
        [
            {
                text: "Close",
                class: "secondary_button",
			    id: "close_restore_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            }
        ];
    }

    $("<div id=\"prompt\">" + strMsg + "</div>").dialog(
    {
        title: title,
        responsive: true,
        autoOpen: true,
        width: 500,
        height: height,
        modal: true,
        resizable: false,
        buttons: buttons,
        open: function ()
        {
            ResetFocusOnDialogOpen()
        }
	});
}

function DeleteRecordsDialog()
{
    var count = 0;
    if ($("#removed_list").length)
    {
        count = $("#removed_list").val().length;
    }
    else if ($("#delete_list").length)
    {
        count = $("#delete_list").val().split(',').length;
    }
    var title;
    var strMsg;
    var buttons;
    var height;

    if (count > 0)
    {
        title = "Permanently Delete Record?";
        var plurality1 = "record is";
        var plurality2 = "this record";
        var plurality3 = "the record";
        if (count > 1)
        {
            title = "Permanently Delete Records?";
            plurality1 = "records are";
            plurality2 = "these records";
            plurality3 = "records";
        }

        height = 370;
        strMsg = "<div class=\"para\">" + count + " " + plurality1 +
	        " about to be permanently deleted from the study data set.</div><div class=\"para\">" +
	        "<span class=\"quota_password_warning\">Any password associated with " + plurality2 +
	        " will be available to use again.</span></div>" +
	        "<div class=\"para\">This action cannot be undone.</div>" +
	        "<div class=\"para\">Continue and delete " + plurality3 + "?</div>";
        buttons =
        [
			{
                text: "Cancel",
                class: "secondary_button",
			    id: "cancel_delete_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            },
            {
                text: "Delete",
                class: "destructive_button",
                id: "delete_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			        document.mainform.hid_page.value = "view_data_delete";
			        document.mainform.submit();
			    }
			}
        ];
    }
    else
    {
        title = "Cannot Permanently Delete Records";
        height = 200;
        strMsg = "No records are selected.";
        buttons =
        [
            {
                text: "Close",
                class: "secondary_button",
			    id: "close_delete_record_button",
			    click: function ()
			    {
			        $(this).dialog("close");
			    }
            }
        ];
    }

    $("<div id=\"prompt\">" + strMsg + "</div>").dialog(
    {
        title: title,
        responsive: true,
        autoOpen: true,
        width: 500,
        height: height,
        modal: true,
        resizable: false,
        buttons: buttons,
        open: function ()
        {
            ResetFocusOnDialogOpen()
        }
	});
}

function InitializeCheckBoxes(all_checkbox_groups)
{
    all_checkbox_groups.each(function ()
    {
        var checkbox_group = $(this);
        var checkbox_input = checkbox_group.find(".checkbox_input").val();
        var input_array = checkbox_input.split(",");
        var i = 0;
        var checkbox = 0;

        for (i = 0; i < input_array.length; i++)
        {
            checkbox = checkbox_group.find("[data-name='" + input_array[i] + "']");

            if(checkbox.length)
            {
                ToggleCheckbox(checkbox, true);
            }
            else
            {
                ToggleCheckbox(checkbox, false);
            }
        }
    });
}

function InitializeCheckAllControl()
{
    $(".check_all").each(function ()
    {
        var check_all = $(this);
        var checkbox_group = check_all.closest(".checkbox_group");

        if (checkbox_group.length)
        {
            var all_checked = true;

            checkbox_group.find(".checkbox_control").each(function ()
            {
                var checkbox = $(this);

                if (!checkbox.hasClass("check_all"))
                {
                    if (!IsChecked(checkbox))
                    {
                        all_checked = false;
                        return false;  //Exit loop
                    }
                }
            });

            ToggleCheckbox(checkbox_group.find(".check_all"), all_checked);
        }
    });
}

function ToggleCheckAll(check_box)
{
    var group_box = check_box.closest(".checkbox_group");

    if (group_box.find(".check_all"))
    {
        var all_check_boxes = group_box.find(".checkbox_control");

        if (check_box.hasClass("check_all"))
        {
            var check_all = IsChecked(check_box);

            all_check_boxes.each(function ()
            {
                check_box = $(this);
                ToggleCheckbox(check_box, check_all);
            });
        }
        else
        {
            var all_checked = true;

            all_check_boxes.each(function ()
            {
                check_box = $(this);

                if (!check_box.hasClass("check_all"))
                {
                    if (!IsChecked(check_box))
                    {
                        all_checked = false;
                    }
                }
            });

            ToggleCheckbox(group_box.find(".check_all"), all_checked);
        }
    }
}

function ToggleCheckbox(checkbox_control, select)
{
    var checkbox_graphic = checkbox_control.find(".graphical_select");

    if (select)
    {
        checkbox_graphic.removeClass("checkbox_unselected");
        checkbox_graphic.addClass("checkbox_selected");
        checkbox_control.attr("data-value", "checked");
    }
    else
    {
        checkbox_graphic.removeClass("checkbox_selected");
        checkbox_graphic.addClass("checkbox_unselected");
        checkbox_control.attr("data-value", "");
    }
}

//Given a checkbox control returns true if checked, otherwise false.
function IsChecked(checkbox_control)
{
    var result = false;

    if (checkbox_control.attr("data-value") == "checked")
    {
        result = true;
    }

    return result;
}

function UpdateCheckboxInput(checkbox_control)
{
    var checkbox_group = checkbox_control.closest(".checkbox_group");
    var input_array = [];
    var checkbox_input = checkbox_group.find(".checkbox_input");
    var name = "";

    checkbox_group.find(".checkbox_control").each(function ()
    {
        checkbox_control = $(this);

        if (IsChecked(checkbox_control))
        {
            name = checkbox_control.data("name");

            if (name)
            {
                input_array.push(name);
            }
        }
    });

    checkbox_input.val(input_array.join(","));
}