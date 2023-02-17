/*
Lighthouse Studio - Web Surveying System
Copyright Sawtooth Software, Inc. All rights reserved.
Orem, UT  USA  801-477-4700
*/
var GlobalGraphicalSelect = false;
var blnSubmitClicked = false;
var GlobalTimeOutEvents = [];
var MOBILE_BREAK_POINT = 800;
var MOBILE_MEDIA_QUERY = "only screen and (max-width: " + MOBILE_BREAK_POINT + "px)";
var ACTIVE_TASK_BUFFER = 150;
var GlobalDocumentReadyArray = [];
var GlobalDocReady = false;
var GlobalWindowLoadArray = [];
var GlobalWinLoad = false;

$(document).ready(function ()
{
    for (i in GlobalDocumentReadyArray)
    {
        GlobalDocumentReadyArray[i]();
    }

    GlobalDocReady = true;

    CheckSSIReady();
});

$(window).on('load', function ()
{
    for (i in GlobalWindowLoadArray)
    {
        GlobalWindowLoadArray[i]();
    }

    GlobalWinLoad = true;

    CheckSSIReady();
});

// jquery plugin to remove a specific style rule form and element.
// An element with inline styles for width and height could have just
// the inline width rule removed like this... $(element).removeStyle('width');
(function ($)
{
    $.fn.removeStyle = function (style)
    {
        var search = new RegExp(style + '[^;]+;?', 'g');
        return this.each(function ()
        {
            $(this).attr('style', function (i, style)
            {
                if (style)
                {
                    return style.replace(search, '');
                }
            });
        });
    };
}(jQuery));

//Fire ssi_ready event if we are done setting up all of our JavaScript after document.ready and window.load
function CheckSSIReady()
{
    if (GlobalDocReady && GlobalWinLoad)
    {
        $(document).trigger("ssi_ready");
    }
}

function SSI_SubmitMe(skip_verify)
{
    var verify_result = false;
    if (skip_verify || $("#hid_preview").length || document.mainform.hid_previous.value == 1)
    {
        verify_result = true;
    }
    else if (typeof SSI_Verify == "function")
    {
        verify_result = SSI_Verify();
    }
    else
    {
        verify_result = true;
    }
    if (verify_result)
    {
        if (!blnSubmitClicked)
        {
            SetScreenWidth();
            SSI_ClearHiddenContainerData();
            window.document.mainform.hid_javascript.value = 1;
            document.mainform.submit();
            blnSubmitClicked = true;
            SSI_SubmitProgressBar();
        }
    }
}

//This is especially important for Firefox
$(window).on("unload", function ()
{
    SSI_RemoveProgressBar();
});

//This is for ios 5.  Regular browser back does not reload the JavaScript
if (window.addEventListener && typeof window.addEventListener)
{
    window.addEventListener("pagehide", function ()
    {
        SSI_RemoveProgressBar();
    });
}

function SSI_SubmitProgressBar()
{
    GlobalTimeOutEvents[0] = window.setTimeout(function ()
    {
        if (blnSubmitClicked)
        {
            blnSubmitClicked = false;
            $("#submit_overlay").show();
        }
    }, 2000);

    //After 10 seconds submit again
    GlobalTimeOutEvents[1] = window.setTimeout(function ()
    {
        if (!TestLocalHost())
        {
            document.mainform.submit();
        }
    }, 10000);

    //After 20 seconds remove progress bar.
    GlobalTimeOutEvents[2] = window.setTimeout(function ()
    {
        if (!TestLocalHost())
        {
            document.mainform.submit();
        }
        SSI_RemoveProgressBar();
    }, 20000);
}

function SSI_RemoveProgressBar()
{
    blnSubmitClicked = false;
    $("#submit_overlay").hide();

    //Remove timer events.
    window.clearTimeout(GlobalTimeOutEvents[0]);
    window.clearTimeout(GlobalTimeOutEvents[1]);
    window.clearTimeout(GlobalTimeOutEvents[2]);
}

//This mainly helps debugging.  Don't need to multi submit on localhost.
function TestLocalHost()
{
    var local = false;
    var url = document.URL;
    var string_index = url.indexOf("localhost");
    var ip_index = url.indexOf("127.0.0.1");
    //If https://localhost or http://localhost
    if (string_index == 7 || string_index == 8)
    {
        local = true;
    }
    else if (ip_index == 7)
    {
        local = true;
    }
    return local;
}

function SSI_PageInitialize()
{
    blnSubmitClicked = false;
    AdjustPageForTableWidth();

    //If inner table is bigger than question adjust question width
    jQuery(".question").each(function ()
    {
        var QuestionObj = jQuery(this);
        var intQuestionWidth = parseInt(QuestionObj.css("width"));
        var InnerTableObj = jQuery(this).find(".inner_table");
        if (InnerTableObj.length)
        {
            var intInnerTableWidth = parseInt(InnerTableObj.css("width"));
            if (intInnerTableWidth > intQuestionWidth)
            {
                QuestionObj.css("width", intInnerTableWidth + 10);
            }
        }
    });

    jQuery(".other_specify_table").each(function ()
    {
        jQuery(this).closest("tr").addClass("other_specify_row");
    });

    SSI_BYOAltColors();

    $("#test_skip_question").on("change", function ()
    {
        var skip_to_input = $("#test_skip_to")[0];
        if ($(this).val() != "")
        {
            skip_to_input.checked = true;
        }
        else
        {
            skip_to_input.checked = false;
        }
        TogglePageSubmitMsg();
    });

    $(".test_mode").on("click", function ()
    {
        if (window.parent && window.parent.CloseOptionsBox)
        {
            window.parent.CloseOptionsBox();
        }
    });

    if ($(".test_mode").length || $("#hid_preview").length)
    {
        if ($(".test_mode").length)
        {
            var test_bar_window = window;

            //If this is inside an iframe
            if (self != top)
            {
                test_bar_window = window.parent;
            }

            if ($("#hid_pagenum").length && $("#hid_pagenum").val() == 1 && $(".server_verification_error").length == 0)
            {
                test_bar_window.TestMode.StartPageSkip();
                test_bar_window.TestMode.ShowRespNumRow();
            }
            else
            {
                test_bar_window.TestMode.ResetSkipTo();
                test_bar_window.TestMode.HideRespNumRow();
            }
        }

        //If this is inside an iframe
        if (self != top)
        {
            var url = window.location.href;
            var hid_s_obj = window.document.mainform["hid_s"];

            if (hid_s_obj)
            {
                var hid_s = hid_s_obj.value;

                if(hid_s)
                {
                    var regex = new RegExp("hid_s=", "i");
                    var match_array = regex.exec(url);

                    //Can't find it
                    if (!match_array)
                    {
                        url += "?hid_s=" + hid_s;
                    }
                }
            }

            sessionStorage.iframe_url = url;
        }
    }

    AdjustNavButtonWidth();
    SetScreenWidth();
    InitializeMobile();
}

function AdjustPageForTableWidth()
{
    var page_width = $(".page").outerWidth();
    var inner_table = $(".page").find(".inner_table");
    if (inner_table.length)
    {
        var new_page_width = 0;
        var table_width = 0;
        var extra_width = 0;
        var table = 0;
        inner_table.each(function (index)
        {
            table = $(this);
            table_width = table.outerWidth();
            extra_width = 0;
            if (table_width > page_width)
            {
                new_page_width = table_width;
                extra_width += parseInt(table.closest(".question_body").css("padding-left"));
                extra_width += parseInt(table.closest(".question_body").css("margin-left"));
                extra_width += parseInt(table.closest(".question").css("padding-left"));
                extra_width += parseInt(table.closest(".question").css("margin-left"));
                new_page_width += extra_width * 2;
            }
        });
        if (new_page_width)
        {
            $(".page").css("width", new_page_width);
            $(".page").css("max-width", new_page_width);
        }
    }
}

function AdjustNavButtonWidth()
{
    if($(".text_nav_button").length)
    {
        var biggest_width = 0;

        $(".text_nav_button").each(function ()
        {
            var nav_button = $(this);
            var width = nav_button.width();

            if(width > biggest_width)
            {
                biggest_width = width;
            }
        });

        $(".text_nav_button").width(biggest_width);

        $(".text_nav_button").css("visibility", "visible");
    }
}

function SetTestModeSettings(settings)
{
    $("#hid_test_mode_settings").val(settings);
}

function ShowTestPageSubmitMsg()
{
    $("#test_mode_submit_msg").show();
}

function HideTestPageSubmitMsg()
{
    $("#test_mode_submit_msg").hide();
}

function ShowTestQuestionNames()
{
    $(".test_question_label").show();
}

function HideTestQuestionNames()
{
    $(".test_question_label").hide();
}

function ShowTestVars()
{
    $(".test_var_label").show();
}

function HideTestVars()
{
    $(".test_var_label").hide();
}

function SSI_ClickableInitialize(blnHighlight)
{
    SSI_InitializeClickableAreas(blnHighlight);

    if (GlobalGraphicalSelect)
    {
        SSI_InitializeGraphicalSelectButtons();
    }

    SetTabIndex();
}

// Code to make cells clickable
function SSI_InitializeClickableAreas(blnHighlight)
{
    // Remove the default behavior of label tags, which is to select the input when the label is selected.
    // This behavior together with the stuff below confuses the code.
    jQuery(".clickable label").each(function ()
    {
        jQuery(this).bind({
            "click": function (event)
            {
                event.preventDefault();
            },
            "keyup": function (event)
            {
                event.preventDefault();
            }
        });
    });
    jQuery(".clickable input[type=text], .clickable textarea").each(function ()
    {
        var InputElement = this;
        InputElement.hasfocus = false;
        jQuery(InputElement).bind({
            "focus": function ()
            {
                this.hasfocus = true;
            },
            "blur": function ()
            {
                this.hasfocus = false;
            }
        });
    });
    jQuery(".clickable input").each(function ()
    {
        var InputElement = this;
        if (InputElement.type != "hidden" && InputElement.type != "text")
        {
            InputElement.isCheckedVar = InputElement.checked;
            ClickableObj = jQuery(InputElement).closest(".clickable");
            if (GlobalGraphicalSelect)
            {
                //This prevents the link from being followed and the page shifting to the top on a mouse click.
                ClickableObj.bind({
                    "click": function (event)
                    {
                        event.preventDefault();
                    }
                });
            }
            ClickableObj.bind({
                "keydown": SSI_ClickableTyping,
                "click": SSI_ToggleSelect,
                "keyup": SSI_ToggleSelect
            });
            ClickableObj.bind("mouseover", {
                blnHighlightParam: blnHighlight
            }, function (event)
            {
                if (event.data.blnHighlightParam)
                {
                    jQuery(this).addClass("highlight");
                }
            });
            ClickableObj.bind("mouseout", {
                blnHighlightParam: blnHighlight
            }, function (event)
            {
                if (event.data.blnHighlightParam)
                {
                    jQuery(this).removeClass("highlight");
                }
            });
            jQuery(InputElement).bind("focus", {
                ClickableObjParam: ClickableObj
            }, function (event)
            {
                event.data.ClickableObjParam.trigger("mouseover");
            });
            jQuery(InputElement).bind("blur", {
                ClickableObjParam: ClickableObj
            }, function (event)
            {
                event.data.ClickableObjParam.trigger("mouseout");
            });
        }
    });
}

function SSI_SubmitInitialize()
{
    var next_button = $("#next_button");

    if (next_button.length)
    {
        next_button.on("click", function ()
        {
            SSI_NextSubmit(next_button);
        });

        next_button.on("keyup", function (event)
        {
            //Space or Enter pushed
            if (event.keyCode == 32 || event.keyCode == 13)
            {
                SSI_NextSubmit(next_button);
            }
        });
    }

    var previous_button = jQuery("#previous_button");
    if (previous_button.length)
    {
        previous_button.on("click", function()
        {
            SSI_PreviousSubmit();
        });

        previous_button.on("keyup", function (event)
        {
            //Space or Enter pushed
            if (event.keyCode == 32 || event.keyCode == 13)
            {
                SSI_PreviousSubmit();
            }
        });
    }

    var text_buttons = $(".text_nav_button");

    text_buttons.on("mouseover", function (event)
    {
        var button = $(this);

        if (button.hasClass("text_nav_button"))
        {
            button.addClass("text_nav_button_hover");
        }
    });

    text_buttons.on("mouseout", function (event)
    {
        var button = $(this);

        if (button.hasClass("text_nav_button"))
        {
            button.removeClass("text_nav_button_hover");
        }
    });

    text_buttons.on("mousedown", function (event)
    {
        var button = $(this);

        if (button.hasClass("text_nav_button"))
        {
            button.addClass("text_nav_button_click");
        }
    });

    text_buttons.on("mouseup", function (event)
    {
        var button = $(this);

        if (button.hasClass("text_nav_button"))
        {
            button.removeClass("text_nav_button_click");
        }
    });
}

function SSI_InitializeGraphicalSelectButtons()
{
    var inputFields = jQuery(".input_cell");
    jQuery(".input_cell input").each(function ()
    {
        var InputItemObj = jQuery(this);
        var strInputType = InputItemObj.attr("type");
        if ((strInputType == "checkbox") || (strInputType == "radio"))
        {
            //Make it so that when the graphic gets focus the clickable area is highlighted.
            var ClickableObj = InputItemObj.closest(".clickable");
            var GraphicalInputElement = jQuery("#" + InputItemObj.attr("id") + "_graphical");
            //This needs to be in here so that it can run when the browser back button is clicked.
            if (GraphicalInputElement.length)
            {
                if (InputItemObj[0].checked)
                {
                    GraphicalInputElement.attr("aria-checked", true);
                    if (strInputType == "checkbox")
                    {
                        GraphicalInputElement.removeClass("checkbox");
                        GraphicalInputElement.addClass("checkboxselected");
                    }
                    else if (strInputType == "radio")
                    {
                        GraphicalInputElement.removeClass("radiobox");
                        GraphicalInputElement.addClass("radioboxselected");
                    }
                }
                else
                {
                    GraphicalInputElement.attr("aria-checked", false);
                    if (strInputType == "checkbox")
                    {
                        GraphicalInputElement.removeClass("checkboxselected");
                        GraphicalInputElement.addClass("checkbox");
                    }
                    else if (strInputType == "radio")
                    {
                        GraphicalInputElement.removeClass("radioboxselected");
                        GraphicalInputElement.addClass("radiobox");
                    }
                }
                GraphicalInputElement.bind("focus", {
                    ClickableObjParam: ClickableObj
                }, function (event)
                {
                    event.data.ClickableObjParam.trigger("mouseover");
                });
                GraphicalInputElement.bind("blur", {
                    ClickableObjParam: ClickableObj
                }, function (event)
                {
                    event.data.ClickableObjParam.trigger("mouseout");
                });
            }
        }
    });
    //Preload select "on" images
    jQuery(".radiobox").each(function ()
    {
        PreloadSelectedImage(jQuery(this), "radioboxselected");
        return false;
    });
    jQuery(".checkbox").each(function ()
    {
        PreloadSelectedImage(jQuery(this), "checkboxselected");
        return false;
    });
    jQuery(".cbc_best_row .radiobox").each(function ()
    {
        PreloadSelectedImage(jQuery(this), "radioboxselected");
        return false;
    });
    jQuery(".cbc_worst_row .radiobox").each(function ()
    {
        PreloadSelectedImage(jQuery(this), "radioboxselected");
        return false;
    });
}

function PreloadSelectedImage(SelObj, strSelecteName)
{
    var Clone = SelObj.clone();
    Clone.hide();
    Clone.removeAttr("id");
    Clone.addClass(strSelecteName);
    SelObj.after(Clone);
    Clone.remove();
}

function SSI_NextSubmit(next_button)
{
    if (next_button && next_button.hasClass("launch_simple_browser"))
    {
        SSI_LauchSimpleBrowser(next_button);
    }
    else
    {
        document.mainform.hid_previous.value = 0;
        SSI_SubmitMe(false);
    }
}

function SSI_PreviousSubmit()
{
    document.mainform.hid_previous.value = 1;
    SSI_SubmitMe(false);
}

function SSI_LauchSimpleBrowser(next_button)
{
    var url = next_button.data("url");
    var window_settings = next_button.data("settings");

    window.open(url,'', window_settings);
}

//Prevents page from shifting down on spacebar press.
function SSI_ClickableTyping(event)
{
    // If they have focus on the other specify box, then don't toggle select
    var OtherTextBox = jQuery(this).find("input[type=text]");
    if (OtherTextBox.length == 0)
    {
        OtherTextBox = jQuery(this).find("textarea");
    }
    if (OtherTextBox.length)
    {
        // Allow spaces to be typed in the other specify.
        if (OtherTextBox[0].hasfocus)
        {
            return true;
        }
    }
    //Space was pushed (Prevents page from shifting down on spacebar press for graphical select buttons)
    if (jQuery(this).find(".graphical_select").length && event.keyCode == 32)
    {
        return false;
    }
}

function SSI_ToggleSelect(event)
{
    var intKeyCode = 0;
    if (event.rightClick)
    {
        return false;
    }
    if (event.keyCode)
    {
        intKeyCode = event.keyCode;
    }
    // If they have focus on the other specify box, then don't toggle select
    var OtherTextBox = jQuery(this).find("input[type=text]");
    if (OtherTextBox.length == 0)
    {
        OtherTextBox = jQuery(this).find("textarea");
    }
    if (OtherTextBox.length)
    {
        if (OtherTextBox[0].hasfocus)
        {
            return;
        }
    }
    //No key pressed or space bar pressed
    if (intKeyCode == 0 || intKeyCode == 32)
    {
        var InputElement = jQuery(this).find("input")[0];
        var GraphicalObj = jQuery("#" + InputElement.id + "_graphical");
        if (GraphicalObj.length || intKeyCode == 0)
        {
            if (InputElement.type == "checkbox")
            {
                if (InputElement.isCheckedVar)
                {
                    InputElement.isCheckedVar = false;
                }
                else
                {
                    InputElement.isCheckedVar = true;
                }
                InputElement.checked = InputElement.isCheckedVar;
                if (GraphicalObj.length)
                {
                    SSI_SelectGraphicalCheckbox(GraphicalObj, InputElement, InputElement.checked);
                }
                else
                {
                    InputElement.focus();
                }
            }
            else if (InputElement.type == "radio")
            {
                //Set to false all radio buttons
                jQuery("[name='" + InputElement.name + "']").each(function ()
                {
                    this.isCheckedVar = false;
                });
                InputElement.isCheckedVar = true;
                InputElement.checked = true;
                if (GraphicalObj.length)
                {
                    SSI_SelectGraphicalRadiobox(GraphicalObj, InputElement, true);
                }
                else
                {
                    InputElement.focus();
                }
            }
        }
        var ClickableObj = jQuery(InputElement).closest(".clickable");
        var mobileGridOtherOptions = ClickableObj.siblings(".mobile_grid_other");
        //clear mobile grid other specify if currently selected
        if (ClickableObj.is(".mobile_select") && mobileGridOtherOptions.length && jQuery(this).find("input")[0].type == "radio")
        {
            mobileGridOtherOptions.each(function ()
            {
                var currentOtherClickable = $(this);
                //only clear if the selection changed in the mobile grid card that has the text box showing
                if (currentOtherClickable.find('.label_text').is(":visible"))
                {
                    ClearAllMobileGridOther(currentOtherClickable);
                }
            });
        }
        // These have to be here to control event order.  These need to be fired after the item is selected.
        ClickableObj.trigger("none_event");
        ClickableObj.trigger("byo_click");
    }
        //Clicked "Enter"
    else if (GlobalGraphicalSelect && intKeyCode == 13)
    {
        SSI_SubmitMe(false);
    }
    if (GlobalGraphicalSelect)
    {
        return false; // This is so that graphical select buttons do not follow link.
    }
}

function SSI_RestoreBestConcept(inputID)
{
    var concept = $('#' + inputID).closest(".cbc_concept");
    var question = $('#' + inputID).closest(".question");
    var conceptIndex = question.find(".cbc_concept").index(concept);
    SSI_SetBestConcept(question, conceptIndex);
    SSI_SetSelect(inputID, 1);
}

function SSI_RestoreWorstConcept(inputID)
{
    var concept = $('#' + inputID).closest(".cbc_concept");
    var question = $('#' + inputID).closest(".question");
    var conceptIndex = question.find(".cbc_concept").index(concept);
    SSI_SetWorstConcept(question, conceptIndex);
    SSI_SetSelect(inputID, 1);
}

function SSI_SetSelect(inputID, blnSelect)
{
    var InputObj = jQuery("#" + inputID);
    if (InputObj.length)
    {
        var InputElement = InputObj[0];
        InputElement.isCheckedVar = blnSelect;
        InputElement.checked = blnSelect;
        var strInputType = InputElement.type;
        if (strInputType == "checkbox")
        {
            var GraphicalCheckboxObj = jQuery("#" + InputElement.id + "_graphical");
            if (GraphicalCheckboxObj.length)
            {
                SSI_SelectGraphicalCheckbox(GraphicalCheckboxObj, InputElement, blnSelect);
            }
        }
        else if (strInputType == "radio")
        {
            var GraphicalRadioObj = jQuery("#" + InputElement.id + "_graphical");
            if (GraphicalRadioObj.length)
            {
                SSI_SelectGraphicalRadiobox(GraphicalRadioObj, InputElement, blnSelect);
            }
        }
        else
        {
            console.error("This function only supports the checkbox and radio select types.");
        }
    }
    else
    {
        console.error("Cannot find \"" + inputID + "\" on this page.");
    }
}

function SSI_SelectGraphicalCheckbox(GraphicalCheckboxObj, InputElement, blnCheck)
{
    if (blnCheck)
    {
        InputElement.checked = true;
        GraphicalCheckboxObj.attr("aria-checked", true);
        GraphicalCheckboxObj.removeClass("checkbox");
        GraphicalCheckboxObj.addClass("checkboxselected");
        GraphicalCheckboxObj.closest(".mobile_select").addClass("mobile_selected");
    }
    else
    {
        InputElement.checked = false;
        GraphicalCheckboxObj.attr("aria-checked", false);
        GraphicalCheckboxObj.removeClass("checkboxselected");
        GraphicalCheckboxObj.addClass("checkbox");
        GraphicalCheckboxObj.closest(".mobile_select").removeClass("mobile_selected");
    }
    SSI_CustomGraphicalCheckbox(GraphicalCheckboxObj, InputElement, blnCheck);
}

function SSI_CustomGraphicalCheckbox(GraphicalCheckboxObj, ActualCheckboxObj, blnCheck)
{
    //Empty function.  Redefine this function in custom code.
}

function SSI_SelectGraphicalRadiobox(GraphicalRadioboxObj, InputElement, blnSelect)
{
    var strActualRadioboxName = InputElement.name;
    if (blnSelect)
    {
        //Uncheck all radio buttons
        jQuery("input").each(function ()
        {
            if (this.name == strActualRadioboxName)
            {
                this.checked = false;
                var UnCheckedRadioboxObj = jQuery("#" + this.id + "_graphical");
                if (UnCheckedRadioboxObj.length)
                {
                    UnCheckedRadioboxObj.attr("aria-checked", false);
                    UnCheckedRadioboxObj.removeClass("radioboxselected");
                    UnCheckedRadioboxObj.addClass("radiobox");
                    UnCheckedRadioboxObj.closest(".mobile_select").removeClass("mobile_selected");
                }
            }
        });
        //Select the one
        InputElement.checked = true;
        GraphicalRadioboxObj.attr("aria-checked", true);
        GraphicalRadioboxObj.removeClass("radiobox");
        GraphicalRadioboxObj.addClass("radioboxselected");
        GraphicalRadioboxObj.closest(".mobile_select").addClass("mobile_selected");
        // GraphicalRadioboxObj.focus(); removed for now to solve chinese character input bug. Tell Lance If it breaks something
        SSI_CustomGraphicalRadiobox(GraphicalRadioboxObj, InputElement);
    }
    else
    {
        InputElement.checked = false;
        var UnCheckedRadioboxObj = jQuery("#" + InputElement.id + "_graphical");
        if (UnCheckedRadioboxObj.length)
        {
            UnCheckedRadioboxObj.attr("aria-checked", false);
            UnCheckedRadioboxObj.removeClass("radioboxselected");
            UnCheckedRadioboxObj.addClass("radiobox");
            UnCheckedRadioboxObj.closest(".mobile_select").removeClass("mobile_selected");
        }
    }
}

function SSI_CustomGraphicalRadiobox(GraphicalRadioboxObj, InputElement)
{
    //Empty function.  Redefine this function in custom code.
}

function SSI_RadioReset(strRadioName)
{
    //Uncheck all radio buttons
    jQuery("input").each(function ()
    {
        if (this.name == strRadioName)
        {
            this.checked = false;
            var UnCheckedRadioboxObj = jQuery("#" + this.id + "_graphical");
            if (UnCheckedRadioboxObj.length)
            {
                UnCheckedRadioboxObj.attr("aria-checked", false);
                UnCheckedRadioboxObj.removeClass("radioboxselected");
                UnCheckedRadioboxObj.addClass("radiobox");
                var mobileSelectObj = $(this).closest(".mobile_select");
                if (mobileSelectObj.length)
                {
                    mobileSelectObj.removeClass("mobile_selected");
                }
            }
        }
    });
}

//Set up onclick events for all checkboxes
function SSI_List_EventSetup(strQName, ItemIndexArray, NoneItemArray)
{
    var i = 0;
    var strInputName = "";
    var InputObj = 0;
    for (i = 0; i < ItemIndexArray.length; i++)
    {
        strInputName = strQName;
        strInputName = strInputName.replace(/\*/, ItemIndexArray[i]);
        //Setup Events for each select item ($ for jQuery to build correct object for additional functionality IE)
        InputObj = jQuery(document.mainform[strInputName]);
        var ClickableObj = InputObj.closest(".clickable");
        if (ClickableObj.length)
        {
            ClickableObj.bind("none_event", {
                strQNameParam: strQName,
                ItemIndexArrayParam: ItemIndexArray,
                CurrentItemParam: ItemIndexArray[i],
                NoneItemArrayParam: NoneItemArray
            }, function (event)
            {
                SSI_ListItemEvents(event.data.strQNameParam, event.data.ItemIndexArrayParam, event.data.CurrentItemParam, event.data.NoneItemArrayParam);
            });
        }
        var OtherInputBox = jQuery(document.mainform[strInputName + "_other"]);
        if (OtherInputBox.length)
        {
            OtherInputBox.bind("keyup", {
                strQNameParam: strQName,
                ItemIndexArrayParam: ItemIndexArray,
                CurrentItemParam: ItemIndexArray[i],
                NoneItemArrayParam: NoneItemArray
            }, function (event)
            {
                SSI_SelectWhenType(event.data.strQNameParam, event.data.ItemIndexArrayParam, event.data.CurrentItemParam, event.data.NoneItemArrayParam);
            });
        }
    }
}

//Main function to check and uncheck
function SSI_ListItemEvents(strQName, ItemIndexArray, intCurrentItem, NoneItemArray)
{
    var strInputName = "";
    var i = 0;
    var intExclusiveSelectedIndex = -1;
    strInputName = strQName;
    strInputName = strInputName.replace(/\*/, intCurrentItem);
    var SelectedItemObj = document.mainform[strInputName];
    var intItemIndex = 0;
    if (SelectedItemObj.checked)
    {
        //If there is an other specify box move the cursor to it (place focus on it)
        var OtherObj = document.mainform[strInputName + "_other"];
        if (OtherObj != null)
        {
            if (OtherObj.type != "hidden")
            {
                OtherObj.focus();
            }
        }
        //Find out if exclusive item has been checked
        for (i = 0; i < NoneItemArray.length; i++)
        {
            if (intCurrentItem == NoneItemArray[i])
            {
                intExclusiveSelectedIndex = NoneItemArray[i];
            }
        }
        if (SelectedItemObj.type == "radio")
        {
            intExclusiveSelectedIndex = SelectedItemObj.value;
        }
        //If the exclusive item has been checked uncheck everything else
        if (intExclusiveSelectedIndex > -1)
        {
            for (i = 0; i < ItemIndexArray.length; i++)
            {
                if (intExclusiveSelectedIndex != ItemIndexArray[i])
                {
                    intItemIndex = ItemIndexArray[i];
                    strInputName = strQName;
                    strInputName = strInputName.replace(/\*/, intItemIndex);
                    if (SelectedItemObj.type == "checkbox")
                    {
                        SSI_SetSelect(strInputName, false);
                    }
                    //Clear out other specify box
                    SSI_RemoveOtherText(strInputName);
                }
            }
        }
            //Otherwise uncheck all exclusives
        else
        {
            for (i = 0; i < NoneItemArray.length; i++)
            {
                intItemIndex = NoneItemArray[i];
                strInputName = strQName;
                strInputName = strInputName.replace(/\*/, intItemIndex);
                if (SelectedItemObj.type == "checkbox")
                {
                    SSI_SetSelect(strInputName, false);
                }
                //Clear out other specify box
                SSI_RemoveOtherText(strInputName);
            }
        }
    }
    else
    {
        //This handles the case where they uncheck the other checkbox and it clears out the text box.
        SSI_RemoveOtherText(strInputName);
    }
}

//If there are others (and are not hidden) clear out other specify box
function SSI_RemoveOtherText(strInputName)
{
    var OtherObj = document.mainform[strInputName + "_other"];
    if (OtherObj != null)
    {
        if (OtherObj.type != "hidden")
        {
            OtherObj.value = "";
        }
    }
}

function SSI_SelectWhenType(strQName, ItemIndexArray, intCurrentItem, NoneItemArray)
{
    var strInputName = strQName;
    strInputName = strInputName.replace(/\*/, intCurrentItem);
    var SelectedItemObj = document.mainform[strInputName];
    var OtherInputBox = document.mainform[strInputName + "_other"];
    if (OtherInputBox.value != "")
    {
        SSI_SetSelect(strInputName, true);
        SSI_ListItemEvents(strQName, ItemIndexArray, intCurrentItem, NoneItemArray);
    }
}

function SetTabIndex()
{
    var tabbableTags = {
        "a": true,
        "input": true,
        "select": true,
        "textarea": true
    };

    jQuery("body *").each(function(){
        var item = $(this);
        if (item[0].tagName) // There was trouble with IE 8 and the <embed> tag.
        {
            if (item.attr("type") != "hidden" && !item.hasClass("HideElement") && item.attr("id") != "invisible_submit")
            {
                var tagName = item[0].tagName.toLowerCase();
                if (item.hasClass("task_select_button") || item.hasClass("dual_response_none_button") || item.hasClass("graphical_select") || item.hasClass("navigation_button") || tabbableTags[tagName])
                {
                    item[0].tabIndex = 0;
                }
            }
        }
    });
}

function SSIHash()
{
    this.HashArray = {}; //This is needed to make code work in conjunction with prototype js lib.
    this.set = function (strKey, strValue)
    {
        strKey = this.encodeKey(strKey);
        this.HashArray[strKey] = strValue;
    };
    this.get = function (strKey)
    {
        strKey = this.encodeKey(strKey);
        return this.HashArray[strKey];
    };
    this.has = function (strKey)
    {
        strKey = this.encodeKey(strKey);
        if (this.HashArray[strKey])
        {
            return true;
        }
        else
        {
            return false;
        }
    };
    this.getKeys = function ()
    {
        var KeyArray = [];
        var HashObj = this;
        jQuery.each(this.HashArray, function (strKey, strValue)
        {
            strKey = HashObj.decodeKey(strKey);
            KeyArray.push(strKey);
        });
        return KeyArray;
    };
    /*This is to allow certain keys like "constructor" to work*/
    this.encodeKey = function (strKey)
    {
        return "k_" + strKey;
    }
    this.decodeKey = function (strKey)
    {
        return strKey.substring(2);
    }
}

function SSI_InitializeErrors()
{
    GlobalQuestHash = new SSIHash();
    SSI_RemoveErrors();
}

function SSI_RemoveErrors()
{
    var QuestNamesArray = GlobalQuestHash.getKeys();
    var i = 0;
    var j = 0;
    var strQuestName = "";
    var VarsArray = [];
    var strErrName = "";
    var blnShowError = false;
    var InfoHash = 0;
    //Check for errors.  If none, do not change screen, just let it submit (makes the screen shift around).
    blnShowError = SSI_ErrorsExist();
    if (blnShowError)
    {
        for (i = 0; i < QuestNamesArray.length; i++)
        {
            strQuestName = QuestNamesArray[i];
            //Remove error message at top of question
            strErrName = "#" + strQuestName + "_err";
            if (jQuery(strErrName))
            {
                jQuery(strErrName).remove();
            }
        }
        var ErrorClassesArray = ["error_quest_highlight", "error_var_highlight", "error_var_highlight_left", "error_var_highlight_center", "error_var_highlight_right", "error_var_highlight_top", "error_var_highlight_middle", "error_var_highlight_bottom"];
        for (i = 0; i < ErrorClassesArray.length; i++)
        {
            jQuery("." + ErrorClassesArray[i]).each(function ()
            {
                jQuery(this).removeClass(ErrorClassesArray[i]);
                //Remove the inline styles
                jQuery(this).css("border-top-width", "");
                jQuery(this).css("border-right-width", "");
                jQuery(this).css("border-bottom-width", "");
                jQuery(this).css("border-left-width", "");
            });
        }
        //Remove error message at top of page
        jQuery("#error_box").removeClass("ShowElement");
        jQuery("#error_box").addClass("HideElement");
    }
}

function SSI_ShowErrors()
{
    var blnSubmit = true;
    var QuestNamesArray = GlobalQuestHash.getKeys();
    var i = 0;
    var j = 0;
    var k = 0;
    var strQuestName = "";
    var QuestErrorsArray = [];
    var VarsArray = [];
    var VarsHash = 0;
    var blnShowError = false;
    var InfoHash = 0;
    var strQuestErrorMsg = "";
    for (i = 0; i < QuestNamesArray.length; i++)
    {
        strQuestName = QuestNamesArray[i];
        InfoHash = GlobalQuestHash.get(strQuestName);
        if (InfoHash.has("messages"))
        {
            blnShowError = true;
            //Highlight question
            jQuery("#" + strQuestName + "_div").addClass("error_quest_highlight");
            MessageHash = InfoHash.get("messages");
            QuestErrorsArray = MessageHash.getKeys();
            strQuestErrorMsg = "";
            for (j = 0; j < QuestErrorsArray.length; j++)
            {
                strQuestErrorMsg += "<div class=\"question_errors\">" + QuestErrorsArray[j] + "</div>";
            }
            SSI_ShowQuestErrorMsg(strQuestName, strQuestErrorMsg);
        }
        if (InfoHash.has("vars"))
        {
            VarsHash = InfoHash.get("vars");
            VarsArray = VarsHash.getKeys();
            for (j = 0; j < VarsArray.length; j++)
            {
                if (VarsHash.get(VarsArray[j]) == 1)
                {
                    SSI_ChangeErrorClass(strQuestName, VarsArray[j], true);
                }
            }
        }
    }
    if (blnShowError)
    {
        jQuery("#error_box").removeClass("HideElement");
        jQuery("#error_box").addClass("ShowElement");
        jQuery("#error_box").html(strGlobalError_page_error);
        window.scrollTo(0, 0);
        blnSubmit = false;
    }
    return blnSubmit;
}

function SSI_ChangeErrorClass(strQuestName, strVarName, blnError)
{
    //This is for special cases where the var name will not work.  I.E. grid combo box.
    if (jQuery("#" + strVarName + "_error").length)
    {
        strVarName = strVarName + "_error";
    }
    var InputObj = 0;
    // special case to find the right mobile grid, other specify box
    if ($(".mobile_grid #" + strVarName).length)
    {
        // //the variable that needs to be hightlighted is a mobile grid other specify box
        // //we need to find the box associated with the selected input
        // var mobileOtherSpecify = $('input[name="' + strVarName + '"]');
        // mobileOtherSpecify.each(function()
        // {
        //     if( $(this).closest('.'))
        // });
        var InfoHash = SSI_GetErrHash(GlobalQuestHash, strQuestName);
        var CardNumHash = SSI_GetErrHash(InfoHash, "cardNum");
        var CardNumArray = CardNumHash.getKeys();
        for (var i = 0; i < CardNumArray.length; i++)
        {
            var textBox = $('.mobile_grid_card[data-card_num="' + CardNumArray[i] + '"] #' + strVarName);
            if (textBox.length)
            {
                InputObj = textBox;
                if (blnError)
                {
                    InputObj.addClass("error_var_highlight");
                }
                else
                {
                    InputObj.removeClass("error_var_highlight");
                }
            }
        }
    }
    else
    {
        InputObj = jQuery("#" + strVarName);
    }
    // If there is a single id to highlight
    if (InputObj.length)
    {
        if (blnError)
        {
            InputObj.addClass("error_var_highlight");
        }
        else
        {
            InputObj.removeClass("error_var_highlight");
        }
    }
        // The part to highlight consists of multiple cells.
    else
    {
        var ClassItemsArray = jQuery("#" + strQuestName + "_div ." + strVarName);
        var intNewBorderWidth = 0;
        var blnRowBased = true;
        var strFirstClassName = "";
        var strAllClassName = "";
        var strLastClassName = "";
        var strRowIDName = strVarName + "_row";
        //If row based change the way that highlighting works.
        if (jQuery("#" + strRowIDName).length && jQuery("#" + strRowIDName).attr("id") == strRowIDName)
        {
            strFirstClassName = "error_var_highlight_left";
            strAllClassName = "error_var_highlight_center";
            strLastClassName = "error_var_highlight_right";
        }
        else
        {
            blnRowBased = false;
            strFirstClassName = "error_var_highlight_top";
            strAllClassName = "error_var_highlight_middle";
            strLastClassName = "error_var_highlight_bottom";
        }
        if (ClassItemsArray.length)
        {
            if (blnRowBased)
            {
                intNewBorderWidth = CastToInt(jQuery(ClassItemsArray[0]).css('border-right-width'));
                if (intNewBorderWidth == 0)
                {
                    intNewBorderWidth = CastToInt(jQuery(ClassItemsArray[0]).css('border-left-width'));
                }
            }
            else
            {
                intNewBorderWidth = CastToInt(jQuery(ClassItemsArray[0]).css('border-bottom-width'));
            }
            var strClasses = jQuery(ClassItemsArray[0]).attr("class");
            if (strClasses.search("error") < 0)
            {
                intNewBorderWidth++;
            }
        }
        var CellObj = 0;
        var i = 0;
        for (i = 0; i < ClassItemsArray.length; i++)
        {
            CellObj = jQuery(ClassItemsArray[i]);
            //First item
            if (i == 0 || CellObj.hasClass("first_column"))
            {
                if (blnError)
                {
                    CellObj.addClass(strFirstClassName);
                    if (blnRowBased)
                    {
                        CellObj.css("border-left-width", intNewBorderWidth + "px");
                    }
                    else
                    {
                        CellObj.css("border-top-width", intNewBorderWidth + "px");
                    }
                }
                else
                {
                    CellObj.removeClass(strFirstClassName);
                    if (blnRowBased)
                    {
                        CellObj.css("border-left-width", "");
                    }
                    else
                    {
                        CellObj.css("border-top-width", "");
                    }
                }
            }
            //Middle section
            if (blnError)
            {
                CellObj.addClass(strAllClassName);
                if (blnRowBased)
                {
                    CellObj.css("border-top-width", intNewBorderWidth + "px");
                    CellObj.css("border-bottom-width", intNewBorderWidth + "px");
                }
                else
                {
                    CellObj.css("border-left-width", intNewBorderWidth + "px");
                    CellObj.css("border-right-width", intNewBorderWidth + "px");
                }
            }
            else
            {
                CellObj.removeClass(strAllClassName);
                if (blnRowBased)
                {
                    CellObj.css("border-top-width", "");
                    CellObj.css("border-bottom-width", "");
                }
                else
                {
                    CellObj.css("border-left-width", "");
                    CellObj.css("border-right-width", "");
                }
            }
            //Last items
            if (i == ClassItemsArray.length - 1 || CellObj.hasClass("last_column"))
            {
                if (blnError)
                {
                    CellObj.addClass(strLastClassName);
                    if (blnRowBased)
                    {
                        CellObj.css("border-right-width", intNewBorderWidth + "px");
                    }
                    else
                    {
                        CellObj.css("border-bottom-width", intNewBorderWidth + "px");
                        //Quirky issue with bottom border in MaxDiff and Firefox
                        if (CellObj.prev().length)
                        {
                            var intPreviousBorder = CastToInt(CellObj.prev().css("border-bottom-width"));
                            if (intPreviousBorder == 0)
                            {
                                CellObj.prev().css("border-bottom", "0px none transparent");
                            }
                        }
                    }
                }
                else
                {
                    CellObj.removeClass(strLastClassName);
                    if (blnRowBased)
                    {
                        CellObj.css("border-right-width", "");
                    }
                    else
                    {
                        CellObj.css("border-bottom-width", "");
                    }
                }
            }
        }
    }
}

function SSI_ShowQuestErrorMsg(strQuestName, strMessage)
{
    var strErrName = strQuestName + "_err";
    jQuery("<div id=\"" + strErrName + "\" class=\"question_error_box error_messages\" role=\"alert\">" + strMessage + "</div>").prependTo("#" + strQuestName + "_div");
    jQuery("#" + strQuestName + "_div").addClass("error_quest_highlight");
}

function SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, mobileGridCardNum)
{
    var InfoHash = 0;
    var MessageHash = 0;
    var VarHash = 0;
    var CardNumHash = 0;
    InfoHash = SSI_GetErrHash(GlobalQuestHash, strQName);
    VarHash = SSI_GetErrHash(InfoHash, "vars");
    if (mobileGridCardNum > 0)
    {
        CardNumHash = SSI_GetErrHash(InfoHash, "cardNum");
        CardNumHash.set(mobileGridCardNum, 1);
    }
    if (strMessage != "")
    {
        MessageHash = SSI_GetErrHash(InfoHash, "messages");
        MessageHash.set(strMessage, 1);
        VarHash.set(strVarName, 1);
    }
    else
    {
        VarHash.set(strVarName, 0);
    }
}

function SSI_GetErrHash(ParentHash, strKey)
{
    var ChildHash = 0;
    if (ParentHash.has(strKey))
    {
        ChildHash = ParentHash.get(strKey);
    }
    else
    {
        ChildHash = new SSIHash();
        ParentHash.set(strKey, ChildHash);
    }
    return ChildHash;
}

function SSI_ErrorsExist()
{
    var QuestNamesArray = GlobalQuestHash.getKeys();
    var i = 0;
    var strQuestName = "";
    var InfoHash = 0;
    var blnErrors = false;
    for (i = 0; i < QuestNamesArray.length; i++)
    {
        strQuestName = QuestNamesArray[i];
        InfoHash = GlobalQuestHash.get(strQuestName);
        if (InfoHash.has("messages"))
        {
            blnErrors = true;
            break;
        }
    }
    return blnErrors;
}

function SSI_InputContainerVisible(InputElement)
{
    var visible = true;
    var InputObj = jQuery(InputElement);
    var container = InputObj.closest(".byo_att_row");
    if (container.length)
    {
        if (!container.is(":visible"))
        {
            visible = false;
        }
    }
    return visible;
}
//Clears out input if the BYO row is hidden.  WARNING: Make sure this does not clear out real data.
function SSI_ClearHiddenContainerData()
{
    jQuery(".byo_att_row:hidden input").each(function ()
    {
        if (this.type != "hidden")
        {
            if (this.type == "radio")
            {
                SSI_RadioReset(this.name);
            }
            else
            {
                this.value = "";
            }
        }
    });
    //For combo boxes
    jQuery(".byo_att_row:hidden select").each(function ()
    {
        this.selectedIndex = 0;
    });
}

function SSI_RadCheck(strVarName, strQName, strErrTxt, intQNum, blnRequired)
{
    var i = 0;
    var blnChecked = false;
    var blnValid = true;
    var strMessage = "";
    if (blnRequired)
    {
        var intRadioLength = 0;
        var InputElement = document.mainform[strVarName];
        if (InputElement && SSI_InputContainerVisible(InputElement))
        {
            if (InputElement.length)
            {
                intRadioLength = InputElement.length;
            }
            else
            {
                intRadioLength = 1; //Radio buttons of size 1 do not have a .length (they are not an array)
            }
            if (intRadioLength == 1)
            {
                if (InputElement.checked == true)
                {
                    blnChecked = true;
                }
            }
            else
            {
                for (i = 0; i < intRadioLength; i++)
                {
                    if (InputElement[i].checked == true)
                    {
                        blnChecked = true;
                        break;
                    }
                }
            }
            if (blnChecked == false)
            {
                strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_missing, intQNum, strQName, strErrTxt, 0, 0);
                blnValid = false;
            }
        }
    }
    SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    return blnValid;
}

function SSI_ComboCheck(strVarName, strQName, strErrTxt, intQNum, blnRequired)
{
    var strMessage = "";
    var blnValid = true;
    if (blnRequired)
    {
        InputElement = document.mainform[strVarName];
        if (InputElement && SSI_InputContainerVisible(InputElement))
        {
            if (InputElement.options[InputElement.selectedIndex].value == "")
            {
                strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_missing, intQNum, strQName, strErrTxt, 0, 0);
                blnValid = false;
            }
        }
    }
    SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    return blnValid;
}

function SSI_CheckBoxCheck(strVarName, strQName, strErrTxt, intQNum, ListArray, intMin, intMax, NoneItemArray)
{
    var blnValid = true;
    var i = 0;
    var intNumSelected = 0;
    var strMessage = "";
    var strCheckBoxName = "";
    var blnGrid = false;
    var strGridReplace = "";
    var intNumChecksDisplayed = 0;
    var CheckObj = 0;
    //If they have not specified a min or a max then any thing will work.
    if (intMin > -1 || intMax > -1)
    {
        //If the size of the list is less then the max then adjust the max
        if (ListArray.length < intMax)
        {
            intMax = ListArray.length;
        }
        //If the size of the list is less then the min then adjust the min
        if (ListArray.length < intMin)
        {
            intMin = ListArray.length;
        }
        //Figure out if it is from a grid or regular.
        if (strVarName.search(/_.\*/) > 0)
        {
            blnGrid = true;
        }
        for (i = 0; i < ListArray.length; i++)
        {
            if (blnGrid)
            {
                strCheckBoxName = strVarName.replace(/\*/, ListArray[i]);
            }
            else
            {
                strCheckBoxName = strVarName + "_" + ListArray[i];
            }
            CheckObj = document.mainform[strCheckBoxName];
            if (CheckObj)
            {
                intNumChecksDisplayed++;
                if (CheckObj.checked == true)
                {
                    intNumSelected++;
                    //Find out if None was checked and if so change intMin to 1
                    for (j = 0; j < NoneItemArray.length; j++)
                    {
                        if (ListArray[i] == NoneItemArray[j])
                        {
                            if (intMin > 1)
                            {
                                intMin = 1;
                                break;
                            }
                        }
                    }
                }
            }
        }
        if (intMin > intNumChecksDisplayed)
        {
            intMin = intNumChecksDisplayed;
        }
        if ((intNumSelected < intMin) || (intNumSelected > intMax))
        {
            if (intNumSelected < intMin)
            {
                strMessage = strGlobalError_min_check;
            }
            else
            {
                strMessage = strGlobalError_max_check;
            }
            strMessage = SSI_ReplaceErrMsgKeyWords(strMessage, intQNum, strQName, strErrTxt, intMin, intMax);
            blnValid = false;
        }
    }
    if (blnGrid)
    {
        strVarName = strVarName.replace(/_r\*/, "");
        strVarName = strVarName.replace(/_c\*/, "");
    }
    SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    return blnValid;
}

function SSI_RankCheck(strVarName, strQName, strErrTxt, intQNum, ListArray, blnNumeric, blnRequire, intMin, intMax)
{
    var blnValid = true;
    var blnNumericError = false;
    var i = 0;
    var intNumAnswered = 0;
    var strInputName = "";
    var InputElement = 0;
    var strMessage = "";
    if (intMax == 0)
    {
        intMax = ListArray.length;
        intMin = ListArray.length;
    }
    if (intMin == 0)
    {
        blnRequire = false;
    }
    if (intMin > intMax)
    {
        intMin = intMax;
    }
    var RankArray = new Array(intMax + 1); //Make it 1 based, ignore first cell
    var intRankItem = "";
    for (i = 0; i < ListArray.length; i++)
    {
        strInputName = strVarName.replace(/\*/, ListArray[i]);
        InputElement = document.mainform[strInputName];
        //Verification
        if (blnNumeric)
        {
            intRankItem = InputElement.value;
            if (SSI_NumCheck(strInputName, strQName, strErrTxt, intQNum, false, 1, intMax, "", false) == false)
            {
                blnValid = false;
                blnNumericError = true;
            }
        }
        else
        {
            intRankItem = InputElement.options[InputElement.selectedIndex].value;
        }
        if (blnValid)
        {
            if (intRankItem != 0 && intRankItem != "")
            {
                //This fixes it for when 03 etc. is entered and it changes it to 3
                intRankItem = parseInt(intRankItem);
                intNumAnswered++;
                if (RankArray[intRankItem] == null)
                {
                    RankArray[intRankItem] = 1;
                }
                else
                {
                    RankArray[intRankItem] += 1;
                }
                // If we have a rank that is not unique, fail
                if (RankArray[intRankItem] > 1)
                {
                    strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_rank_unique, intQNum, strQName, strErrTxt, 0, 0);
                    blnValid = false;
                }
            }
        }
    }
    if (blnValid)
    {
        if (intNumAnswered > 0 || blnRequire)
        {
            if (intNumAnswered < intMin || intNumAnswered > intMax)
            {
                strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_rank_count, intQNum, strQName, strErrTxt, intMin, intMax);
                strMessage = strMessage.replace(/\[%ERRTOTAL\(\)%\]/ig, intMax);
                blnValid = false;
            }
            if (blnValid)
            {
                var blnAllNull = false;
                //Check for contiguous items.
                //Skipping over first empty cell
                for (i = 1; i < RankArray.length; i++)
                {
                    if (RankArray[i] == null)
                    {
                        blnAllNull = true;
                    }
                    else
                    {
                        if (blnAllNull)
                        {
                            strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_rank_count, intQNum, strQName, strErrTxt, intMin, intMax);
                            strMessage = strMessage.replace(/\[%ERRTOTAL\(\)%\]/ig, intMax);
                            break;
                        }
                    }
                }
            }
        }
    }
    if (!blnNumericError)
    {
        //If it is a grid.
        strVarName = strVarName.replace(/_r\*/, "");
        strVarName = strVarName.replace(/_c\*/, "");
        SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    }
    return blnValid;
}

function SSI_ConSumCheck(strVarName, strQName, strErrTxt, intQNum, ListArray, intConsSum, intMin, intMax, blnAllowDecimal, blnReqEach, blnRequire)
{
    var blnValid = true;
    var blnNumericError = false;
    var i = 0;
    var j = 0;
    var intFocusRank = 0;
    var strInputName = "";
    var strMessage = "";
    var blnBlank = true;
    var blnError = false;
    var intSum = 0;
    var InputElement = 0;
    var blnNumeric = false;
    var blnForeignDecimal = false;
    intMin = intConsSum - intMin;
    intMax = intConsSum + intMax;
    if (!blnRequire)
    {
        for (i = 0; i < ListArray.length; i++)
        {
            strInputName = strVarName.replace(/\*/, ListArray[i]);
            //Get value depending on type.
            InputElement = document.mainform[strInputName];
            intFocusRank = InputElement.value;
            if (intFocusRank != "")
            {
                blnBlank = false;
            }
        }
    }
    if (blnRequire || !blnBlank)
    {
        for (i = 0; i < ListArray.length; i++)
        {
            strInputName = strVarName.replace(/\*/, ListArray[i]);
            InputElement = document.mainform[strInputName];
            if (SSI_NumCheck(strInputName, strQName, strErrTxt, intQNum, blnReqEach, 0, intConsSum, "", blnAllowDecimal) == false)
            {
                blnValid = false;
                blnNumericError = true;
            }
            if (blnValid)
            {
                intFocusRank = InputElement.value;
                if (blnGlobalCommaForDecimal)
                {
                    if (intFocusRank.search(/,/) != -1)
                    {
                        blnForeignDecimal = true;
                        intFocusRank = intFocusRank.replace(/,/, ".");
                    }
                }
                intFocusRank = parseFloat(intFocusRank);
                if (isNaN(intFocusRank))
                {
                    intFocusRank = 0;
                }
                intSum = intSum + intFocusRank;
            }
        }
        if (blnValid)
        {
            intSum = SSI_Totals_Decimal_Chop(intSum, strVarName, ListArray);
            if ((intMin > intSum) || (intMax < intSum))
            {
                blnError = true;
            }
            if (blnError)
            {
                if (blnGlobalCommaForDecimal)
                {
                    if (blnForeignDecimal)
                    {
                        intFocusRank = intFocusRank + "";
                        intFocusRank = intFocusRank.replace(/\./, ",");
                        intMin = intMin + "";
                        intMin = intMin.replace(/\./, ",");
                        intMax = intMax + "";
                        intMax = intMax.replace(/\./, ",");
                        intSum = intSum + "";
                        intSum = intSum.replace(/\./, ",");
                        intConsSum = intConsSum + "";
                        intConsSum = intConsSum.replace(/\./, ",");
                    }
                }
                strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_constant_sum, intQNum, strQName, strErrTxt, intMin, intMax);
                strMessage = strMessage.replace(/\[%ERRTOTAL\(\)%\]/ig, intConsSum);
                strMessage = strMessage.replace(/\[%ERRCURSUM\(\)%\]/ig, intSum);
                blnValid = false;
            }
        }
    }
    if (!blnNumericError)
    {
        //If it is a grid.
        strVarName = strVarName.replace(/_r\*/, "");
        strVarName = strVarName.replace(/_c\*/, "");
        SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    }
    return blnValid;
}

function SSI_SliderCheck(strVarName, strQName, strErrTxt, intQNum, blnRequired)
{
    var blnValid = true;
    var strMessage = "";
    if (jQuery("#" + strVarName).length)
    {
        var InputObj = jQuery("#" + strVarName).find(".slider_control input");
        if (InputObj.val() == "")
        {
            strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_missing, intQNum, strQName, strErrTxt, 0, 0);
            blnValid = false;
        }
    }
    SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    return blnValid;
}

//Make sure that no weird decimal problems occur. (i.e. .0000000000000005)
function SSI_Totals_Decimal_Chop(intSum, strVarName, TotalIndexArray)
{
    var i = 0;
    var strInputName = "";
    var InputElement = 0;
    var strValue = "";
    var intCommaPos = 0;
    var strCommaPortion = "";
    var intMaxDecimalPlaces = 0;
    var intCurrentDecimalPlaces = 0;
    var intSumCommaPos = 0;
    intSum = intSum + "";
    intSumCommaPos = intSum.search(/\./);
    if (intSumCommaPos > -1)
    {
        //Find out the input with the largest number of decimal places
        for (i = 0; i < TotalIndexArray.length; i++)
        {
            strInputName = strVarName.replace(/\*/, TotalIndexArray[i]);
            InputElement = document.mainform[strInputName];
            strValue = InputElement.value;
            if (blnGlobalCommaForDecimal)
            {
                strValue = strValue.replace(/,/, ".");
            }
            intCommaPos = strValue.search(/\./);
            if (intCommaPos > -1)
            {
                strCommaPortion = strValue.substr(intCommaPos, strValue.length);
                intCurrentDecimalPlaces = strCommaPortion.length;
                if (intMaxDecimalPlaces < intCurrentDecimalPlaces)
                {
                    intMaxDecimalPlaces = intCurrentDecimalPlaces;
                }
            }
        }
        if (intSum.length > intSumCommaPos + intMaxDecimalPlaces)
        {
            intSum = SSI_RoundNumber(intSum, intMaxDecimalPlaces);
        }
    }
    return intSum;
}

function SSI_Total(strVarName, TotalIndexArray, strTotalName)
{
    var i = 0;
    var j = 0;
    var strInputName = "";
    var InputElement = 0;
    var intFocusRank = 0;
    var intSum = 0;
    var blnForeignDecimal = false;
    for (i = 0; i < TotalIndexArray.length; i++)
    {
        strInputName = strVarName.replace(/\*/, TotalIndexArray[i]);
        InputElement = document.mainform[strInputName];
        intFocusRank = InputElement.value;
        //Print if they allow the international comma for decimals
        if (blnGlobalCommaForDecimal)
        {
            if (intFocusRank.search(/,/) != -1)
            {
                blnForeignDecimal = true;
                intFocusRank = intFocusRank.replace(/,/, ".");
            }
        }
        intFocusRank = parseFloat(intFocusRank);
        if (isNaN(intFocusRank))
        {
            intFocusRank = 0;
        }
        intSum = intSum + intFocusRank;
    }
    //Make sure that no wierd decimal problems occur. (i.e. .0000000000000005)
    intSum = SSI_Totals_Decimal_Chop(intSum, strVarName, TotalIndexArray);
    strInputName = strVarName.replace(/\*/, strTotalName);
    InputElement = document.mainform[strInputName];
    //Print if they allow the international comma for decimals
    if (blnGlobalCommaForDecimal)
    {
        if (blnForeignDecimal)
        {
            intSum = intSum + "";
            intSum = intSum.replace(/\./, ",");
        }
    }
    InputElement.value = intSum;
    VisibleHTMLElem = $('#' + strInputName + "_html");
    if (VisibleHTMLElem.length)
    {
        VisibleHTMLElem.html(intSum);
    }
    return intSum;
}

//Setup the events that call the totals function
function SSI_Totals_EventSetup(TotalIndexArray, QArray, strTotalName)
{
    var i = 0;
    var j = 0;
    var strInputName = "";
    var InputObj = 0;
    var strBaseName = "";
    var TotalFunctionPointer = 0;
    for (i = 0; i < QArray.length; i++)
    {
        strBaseName = QArray[i];
        TotalFunctionPointer = SSI_MakeTotalsFunction(strBaseName, TotalIndexArray, strTotalName);
        //Setup Events for each input box
        for (j = 0; j < TotalIndexArray.length; j++)
        {
            strInputName = strBaseName.replace(/\*/, TotalIndexArray[j]);
            InputObj = jQuery(document.mainform[strInputName]);
            InputObj.bind("keyup", TotalFunctionPointer);
        }
        strInputName = strBaseName.replace(/\*/, strTotalName);
        InputObj = jQuery(document.mainform[strInputName]);
        InputObj.bind("keyup", TotalFunctionPointer);
        // Run it once.  This fills the totals box when the page loads, for prefill or backing up.
        TotalFunctionPointer();
    }
}

function SSI_MakeTotalsFunction(strBaseName, TotalIndexArray, strTotalName)
{
    return function ()
    {
        SSI_Total(strBaseName, TotalIndexArray, strTotalName);
    };
}

function SSI_OtherVerify(strQName, intQNum, ListArray, strType)
{
    var strInputName = "";
    var strOtherInputName = "";
    var blnReturnVal = true;
    var strOtherParams = "";
    var intMin = "";
    var intMax = "";
    var strErrTxt = "";
    var blnChecked = false;
    var intRadioValue = -1;
    var strTextBoxValue = "";
    for (i = 0; i < ListArray.length; i++)
    {
        blnChecked = false;
        if (strType == "radio")
        {
            //Only do the loop once for radio buttons.
            if (i == 1)
            {
                break;
            }
            intRadioValue = SSI_GetRadioValueChecked(strQName);
            if (intRadioValue > 0)
            {
                blnChecked = true;
                strInputName = strQName + "_" + intRadioValue;
            }
        }
        else if (strType == "check")
        {
            strInputName = strQName + "_" + ListArray[i];
            if (document.mainform[strInputName].checked == true)
            {
                blnChecked = true;
            }
        }
        else if (strType == "numeric")
        {
            strInputName = strQName + "_" + ListArray[i];
            strTextBoxValue = document.mainform[strInputName].value;
            //Trim white space from front and back
            strTextBoxValue = strTextBoxValue.replace(/\s*/, "");
            strTextBoxValue = strTextBoxValue.replace(/\s*$/, "");
            if (strTextBoxValue != "" && strTextBoxValue != 0)
            {
                blnChecked = true;
            }
        }
        else if (strType == "combo")
        {
            strInputName = strQName + "_" + ListArray[i];
            strTextBoxValue = document.mainform[strInputName].selectedIndex;
            if (strTextBoxValue != "" && strTextBoxValue != 0)
            {
                blnChecked = true;
            }
        }
        strOtherInputName = strInputName + "_other";
        //If it exists
        if (document.mainform[strOtherInputName] != null)
        {
            if (blnChecked)
            {
                //Get other parameters
                if (document.mainform["hid_" + strOtherInputName] != null)
                {
                    strOtherParams = document.mainform["hid_" + strOtherInputName].value;
                    //Get Min
                    var int1stComma = strOtherParams.search(/,/);
                    intMin = strOtherParams.substr(0, int1stComma);
                    strOtherParams = strOtherParams.substr(int1stComma + 1, strOtherParams.length);
                    //Get Max
                    var int2ndComma = strOtherParams.search(/,/);
                    intMax = strOtherParams.substr(0, int2ndComma);
                    //Get Error Text
                    strErrTxt = strOtherParams.substr(int2ndComma + 1, strOtherParams.length);
                    blnReturnVal = SSI_TxtCheck(strOtherInputName, strQName, strErrTxt, intQNum, intMin, intMax);
                    if (blnReturnVal == false)
                    {
                        break;
                    }
                }
            }
            else
            {
                //This resets all error messages
                SSI_UpdateQuestionErrHash(strOtherInputName, strQName, "", 0);
            }
        }
    }
    return blnReturnVal;
}

function SSI_GetRadioValueChecked(strQName)
{
    var i = 0;
    var intValue = 0;
    var intRadioLength = 0;
    RadioObj = document.mainform[strQName];
    if (RadioObj.length)
    {
        intRadioLength = RadioObj.length;
    }
    else
    {
        intRadioLength = 1; //Radio buttons of size 1 do not have a .length (they are not an array)
    }
    //Take care of the case where there is only one radio button
    if (intRadioLength == 1)
    {
        if (RadioObj.checked)
        {
            intValue = RadioObj.value;
        }
    }
    else
    {
        for (i = 1; i <= intRadioLength; i++)
        {
            if (RadioObj[i - 1].checked)
            {
                intValue = RadioObj[i - 1].value;
                break;
            }
        }
    }
    return intValue;
}

function SSI_Grid_Other(strQName, RowIndicesArray, ColIndicesArray, intQNum)
{
    var blnResult = true;
    //Check rows
    blnResult = SSI_Grid_Other_Helper(strQName, RowIndicesArray, ColIndicesArray, intQNum, true);
    //Check cols
    blnResult = SSI_Grid_Other_Helper(strQName, ColIndicesArray, RowIndicesArray, intQNum, false);
    return blnResult;
}

function SSI_Grid_Other_Helper(strQName, IndicesArrayOne, IndicesArrayTwo, intQNum, blnRows)
{
    var i = 0;
    var j = 0;
    var strOtherName = "";
    var strBaseNameOne = "";
    var strBaseNameTwo = "";
    var strCellName = "";
    var strOtherParams = "";
    var intMin = "";
    var intMax = "";
    var strErrTxt = "";
    var blnReturnValue = true;
    var strCompareValue = "";
    var strActualValue = "";
    var intValueChecked = 0;
    var strRadioName = "";
    var blnMobileGridOther = false;
    var mobileGridCardNum = 0;
    //Loop through all possible 'other' positions
    for (i = 0; i < IndicesArrayOne.length; i++)
    {
        if (blnRows)
        {
            strBaseNameOne = strQName + "_r";
        }
        else
        {
            strBaseNameOne = strQName + "_c";
        }
        strOtherName = strBaseNameOne + IndicesArrayOne[i] + "_other";
        //If it exists
        if (document.mainform[strOtherName] != null)
        {
            //Get Other Parameters
            if (document.mainform["hid_" + strOtherName] != null)
            {
                var otherSpecifyInputs = document.mainform["hid_" + strOtherName];
                if (otherSpecifyInputs.length)
                {
                    //Others are copied.  Just take first.
                    strOtherParams = otherSpecifyInputs[0].value;
                    blnMobileGridOther = true;
                }
                else
                {
                    strOtherParams = otherSpecifyInputs.value;
                }
                //Get Min
                var int1stComma = strOtherParams.search(/,/);
                intMin = strOtherParams.substr(0, int1stComma);
                strOtherParams = strOtherParams.substr(int1stComma + 1, strOtherParams.length);
                //Get Max
                var int2ndComma = strOtherParams.search(/,/);
                intMax = strOtherParams.substr(0, int2ndComma);
                //Get Error Text
                strErrTxt = strOtherParams.substr(int2ndComma + 1, strOtherParams.length);
                //If row radio exists.  This is for other specifies describing a row of radio buttons (oposite from below)
                strRadioName = strBaseNameOne + IndicesArrayOne[i];
                if (document.mainform[strRadioName] != null)
                {
                    intValueChecked = SSI_GetRadioValueChecked(strRadioName);
                    if (intValueChecked > 0)
                    {
                        blnReturnValue = SSI_TxtCheck(strOtherName, strQName, strErrTxt, intQNum, intMin, intMax, 0);
                        // if(!blnReturnValue)
                        // {
                        //     return blnReturnValue;
                        // }
                    }
                }
                //Loop through rows
                for (j = 0; j < IndicesArrayTwo.length; j++)
                {
                    if (blnRows)
                    {
                        strBaseNameTwo = strQName + "_c";
                    }
                    else
                    {
                        strBaseNameTwo = strQName + "_r";
                    }
                    strBaseNameTwo += IndicesArrayTwo[j];
                    //If row radio exists
                    if (document.mainform[strBaseNameTwo] != null)
                    {
                        intValueChecked = SSI_GetRadioValueChecked(strBaseNameTwo);
                        if (intValueChecked > 0)
                        {
                            if (intValueChecked == IndicesArrayOne[i])
                            {
                                if (blnMobileGridOther)
                                {
                                    mobileGridCardNum = j + 1;
                                }
                                blnReturnValue = SSI_TxtCheck(strOtherName, strQName, strErrTxt, intQNum, intMin, intMax, mobileGridCardNum);
                            }
                        }
                        continue;
                    }
                    if (blnRows)
                    {
                        strCellName = strQName + "_r" + IndicesArrayOne[i] + "_c" + IndicesArrayTwo[j];
                    }
                    else
                    {
                        strCellName = strQName + "_r" + IndicesArrayTwo[j] + "_c" + IndicesArrayOne[i];
                    }
                    if (document.mainform[strCellName] == null)
                    {
                        continue;
                    }
                    else
                    {
                        if (document.mainform[strCellName].type == "checkbox")
                        {
                            if (document.mainform[strCellName].checked == false)
                            {
                                continue;
                            }
                            else
                            {
                                if (blnMobileGridOther)
                                {
                                    mobileGridCardNum = j + 1;
                                }
                                blnReturnValue = SSI_TxtCheck(strOtherName, strQName, strErrTxt, intQNum, intMin, intMax, blnMobileGridOther);
                            }
                        }
                        strActualValue = document.mainform[strCellName].value;
                        //Trim white space from front and back
                        strActualValue = strActualValue.replace(/\s*/, "");
                        strActualValue = strActualValue.replace(/\s*$/, "");
                        if (strActualValue != "" && strActualValue != 0)
                        {
                            if (blnMobileGridOther)
                            {
                                mobileGridCardNum = j + 1;
                            }
                            blnReturnValue = SSI_TxtCheck(strOtherName, strQName, strErrTxt, intQNum, intMin, intMax, mobileGridCardNum);
                        }
                    }
                }
            }
        }
    }
    return blnReturnValue;
}

function SSI_CheckRadioButton(strName, intValue)
{
    var RadioObj = document.mainform[strName];
    var i = 0;
    if (InputElement.length)
    {
        intRadioLength = InputElement.length;
    }
    else
    {
        intRadioLength = 1; //Radio buttons of size 1 do not have a .length (they are not an array)
    }
    if (intRadioLength == 1)
    {
        if (RadioObj.value == intValue)
        {
            RadioObj.checked = true;
        }
    }
    else
    {
        //Radio with multiple items
        for (i = 0; i < intRadioLength; i++)
        {
            if (RadioObj[i].value == intValue)
            {
                RadioObj[i].checked = true;
                break;
            }
        }
    }
}

function SSI_CheckMaxDiff(strQName, strErrTxt, intQNum)
{
    var strMessage = "";
    var intBestAnswer = SSI_GetRadioValueChecked(strQName + "_b");
    var intWorstAnswer = SSI_GetRadioValueChecked(strQName + "_w");
    var blnValid = false;
    if (intBestAnswer > 0 && intWorstAnswer > 0)
    {
        if (intBestAnswer == intWorstAnswer)
        {
            strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_maxdiff_unique, intQNum, strQName, strErrTxt, 0, 0);
        }
        else
        {
            blnValid = true;
        }
    }
    SSI_UpdateQuestionErrHash(strQName, strQName, strMessage, 0);
    return blnValid;
}

function SSI_CheckCBCUnique(strVarName, strQName, strBestSuffix, strWorstSuffix, strErrTxt, intQNum)
{
    var strMessage = "";
    var intBestAnswer = SSI_GetRadioValueChecked(strVarName + strBestSuffix);
    var intWorstAnswer = SSI_GetRadioValueChecked(strVarName + strWorstSuffix);
    var blnValid = false;
    if (intBestAnswer > 0 && intWorstAnswer > 0)
    {
        if (intBestAnswer == intWorstAnswer)
        {
            strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_cbc_unique, intQNum, strQName, strErrTxt, 0, 0);
        }
        else
        {
            blnValid = true;
        }
    }
    SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    return blnValid;
}

function SSI_ReplaceErrMsgKeyWords(strMessage, intQNum, strQName, strErrTxt, intMin, intMax)
{
    strMessage = strMessage.replace(/\[%ERRFIELD\(\)%\]/ig, intQNum);
    strMessage = strMessage.replace(/\[%ERRQNAME\(\)%\]/ig, strQName);
    strMessage = strMessage.replace(/\[%ERRTEXT\(\)%\]/ig, strErrTxt);
    strMessage = strMessage.replace(/\[%ERRMIN\(\)%\]/ig, intMin);
    strMessage = strMessage.replace(/\[%ERRMAX\(\)%\]/ig, intMax);
    return strMessage;
}

function SSI_TxtCheck(strVarName, strQName, strErrTxt, intQNum, intMinChars, intMaxChars, mobileGridCardNum)
{
    var blnValid = true;
    var InputElement = "";
    var potentialInputElements = document.mainform[strVarName];
    if (mobileGridCardNum > 0)
    {
        InputElement = potentialInputElements[0];
    }
    else
    {
        InputElement = potentialInputElements;
    }
    if (InputElement)
    {
        var strInString = new String(InputElement.value);
        var strMessage = "";
        var intStatus = 0;
        //Trims white space
        strInString = strInString.replace(/\s*/, "");
        strInString = strInString.replace(/\s*$/, "");
        //Checking min characters
        if (strInString.length < intMinChars)
        {
            intStatus = 1;
        }
        //Checking max characters
        if (intMaxChars >= 0)
        {
            if (strInString.length > intMaxChars)
            {
                intStatus = 2;
            }
        }
        if (intStatus > 0)
        {
            if (intStatus == 1)
            {
                if (strInString.length == "")
                {
                    strMessage = strGlobalError_missing;
                }
                else
                {
                    strMessage = strGlobalError_min_char;
                }
            }
            else
            {
                strMessage = strGlobalError_max_char;
            }
            strMessage = SSI_ReplaceErrMsgKeyWords(strMessage, intQNum, strQName, strErrTxt, intMinChars, intMaxChars);
            blnValid = false;
        }
        SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, mobileGridCardNum);
    }
    return blnValid;
}

function SSI_RemoveBackButtonShell()
{
    setTimeout(SSI_RemoveBackButton, 1);
}

function SSI_RemoveBackButton()
{
    try
    {
        history.forward(1);
    }
    catch (e) { }
    /*
    Every 500 miliseconds, try again. The only
    guaranteed method for Opera, Firefox,
    and Safari, which don't always call
    onLoad but *do* resume any timers when
    returning to a page
    */
    setTimeout(SSI_RemoveBackButton, 500);
}

function SSI_DeepCopyArray(ItemToCopy)
{
    if (typeof (ItemToCopy) == "object")
    {
        if (ItemToCopy != null)
        {
            if (ItemToCopy.constructor == Array)
            {
                var NewArray = ItemToCopy.slice();
                var intArraySize = NewArray.length;
                var i = 0;
                for (i = 0; i < intArraySize; i++)
                {
                    NewArray[i] = SSI_DeepCopyArray(NewArray[i]);
                }
                return NewArray;
            }
        }
    }
    //If it is not an array it just returns itself (not deep copied)
    return ItemToCopy;
}

function SSI_NumCheck(strVarName, strQName, strErrTxt, intQNum, blnRequired, intMin, intMax, intNA, blnAllowDecimal)
{
    var blnValid = true;
    var ParsedNum = 0;
    var intResultStr = 0;
    var strMessage = "";
    var InputElement = document.mainform[strVarName];
    if (InputElement)
    {
        var strValue = InputElement.value;
        if (blnGlobalCommaForDecimal)
        {
            strValue = strValue.replace(/,/, ".");
        }
        intResultStr = SSI_CheckStr(strValue);
        if (intResultStr == 1)
        {
            InputElement.value = "";
            strValue = "";
        }
        if (strValue == "")
        {
            if (blnRequired)
            {
                strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_missing, intQNum, strQName, strErrTxt, 0, 0);
                blnValid = false;
            }
        }
        else if (isNaN(strValue) || (intResultStr == 3))
        {
            strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_not_numeric, intQNum, strQName, strErrTxt, 0, 0);
            blnValid = false;
        }
        else
        {
            ParsedNum = parseFloat(strValue);
            if (blnAllowDecimal == false)
            {
                var intIntegerVal = parseInt(ParsedNum);
                intIntegerVal = parseFloat(intIntegerVal);
                if (intIntegerVal != ParsedNum)
                {
                    strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_not_numeric, intQNum, strQName, strErrTxt, 0, 0);
                    blnValid = false;
                }
                else
                {
                    InputElement.value = intIntegerVal;
                }
            }
            if (blnValid)
            {
                if ((ParsedNum < intMin) || (ParsedNum > intMax))
                {
                    if (intNA && ParsedNum == intNA)
                    {
                        //Do nothing
                    }
                    else
                    {
                        strMessage = SSI_ReplaceErrMsgKeyWords(strGlobalError_out_of_range, intQNum, strQName, strErrTxt, intMin, intMax);
                        blnValid = false;
                    }
                }
            }
        }
        SSI_UpdateQuestionErrHash(strVarName, strQName, strMessage, 0);
    }
    return blnValid;
}

function SSI_CheckStr(strString)
{
    var i = 0;
    var theChar = "";
    var blnHasNum = false;
    for (i = 0; i < strString.length; i++)
    {
        theChar = strString.charAt(i);
        if ((theChar != ' ') && (theChar != '\\n') && (theChar != '\\t'))
        {
            if ((theChar != '-') && (theChar != '.') && ((theChar > '9') || (theChar < '0')))
            {
                return 3;
            }
            else
            {
                blnHasNum = true;
            }
        }
    }
    if (blnHasNum)
    {
        return 2;
    }
    return 1;
}

function SSI_PriceFormat(intNumber, strThousand, strDecimal, intNumDecimalPlaces)
{
    if (intNumDecimalPlaces)
    {
        intNumber = SSI_FormatDecimalPoint(intNumber, intNumDecimalPlaces);
    }
    var strNumber = intNumber.toString();
    var intDecimalPosition = strNumber.indexOf(".");
    var strPostFix = "";
    if (intDecimalPosition >= 0)
    {
        var strBaseNumber = strNumber.slice(0, intDecimalPosition);
        strPostFix = strNumber.slice(intDecimalPosition, strNumber.length);
        //Insert specified decimal separator
        if (strDecimal != "")
        {
            strPostFix = strPostFix.replace(/\./, strDecimal);
        }
        strNumber = strBaseNumber;
    }
    //Adding in thousands separator
    var strResult = "";
    if (strThousand != "")
    {
        var strPrefix = strNumber.substr(0, 1);
        //If the number is negative remove the "-" temporarily
        if (strPrefix == "-")
        {
            strNumber = strNumber.substr(1, strNumber.length);
        }
        else
        {
            strPrefix = "";
        }
        var intLength = strNumber.length;
        while (intLength > 3)
        {
            strResult = strThousand + strNumber.substr(intLength - 3, 3) + strResult;
            intLength -= 3;
        }
        strNumber = strPrefix + strNumber.substr(0, intLength);
    }
    return strNumber + strResult + strPostFix;
}

function SSI_RoundNumber(intNumber, intNumDecimalPlaces)
{
    if (!intNumDecimalPlaces)
    {
        intNumDecimalPlaces = 0;
    }
    intNumber = parseFloat(intNumber);
    var intNewNumber = Math.round(intNumber * Math.pow(10, intNumDecimalPlaces)) / Math.pow(10, intNumDecimalPlaces);
    if (intNumDecimalPlaces > 0)
    {
        var strNewNumber = SSI_FormatDecimalPoint(intNewNumber, intNumDecimalPlaces);
        intNewNumber = parseFloat(strNewNumber);
    }
    return intNewNumber;
}

function SSI_FormatDecimalPoint(intNumber, intNumDecimalPlaces)
{
    var strNewNumber = intNumber.toString();
    var intDecimalPosition = strNewNumber.indexOf(".");
    var intLastPosition = strNewNumber.length - 1;
    var intNumZerosNeeded = 0;
    var blnAddDecimalPoint = false;
    if (intDecimalPosition > -1)
    {
        var intCurrentNumDecimalPlaces = intLastPosition - intDecimalPosition;
        intNumZerosNeeded = intNumDecimalPlaces - intCurrentNumDecimalPlaces;
    }
    else
    {
        intNumZerosNeeded = intNumDecimalPlaces;
        blnAddDecimalPoint = true;
    }
    var i = 0;
    var strZeros = "";
    for (i = 0; i < intNumZerosNeeded; i++)
    {
        strZeros += "0";
    }
    if (blnAddDecimalPoint)
    {
        strNewNumber += ".";
    }
    strNewNumber += strZeros;
    return strNewNumber;
}

function SSI_GetValue(strQName)
{
    var qvalue = "";
    var InputElement = document.mainform[strQName];
    var input_obj = jQuery(InputElement);
    if (InputElement)
    {
        qvalue = jQuery.trim(InputElement.value);

        if (InputElement.type == "checkbox")
        {
            if (InputElement.checked)
            {
                qvalue = InputElement.value;
            }
            else
            {
                qvalue = 0;
            }
        }
        //Radio has an array of items, unless there is just one item then check the single item for type.
        else if ((InputElement[0] && InputElement[0].type == "radio") || InputElement.type == "radio")
        {
            qvalue = SSI_GetRadioValueChecked(strQName);
        }
        else
        {
            //Replace possible comma for decimal.  JavaScript needs decimal.
            if (input_obj.hasClass("numeric_input"))
            {
                if (blnGlobalCommaForDecimal)
                {
                    qvalue = qvalue.replace(/,/, ".");
                }
            }
        }
        if (!input_obj.hasClass("numeric_input") && (InputElement.type == "text" || InputElement.type == "textarea"))
        {
            //Do nothing
        }
        //If it is a number
        else if (!isNaN(qvalue))
        {
            qvalue = parseFloat(qvalue);
            if (isNaN(qvalue))
            {
                qvalue = 0;
            }
        }
    }
    return qvalue;
}

function SSI_GetFormObject(strQName)
{
    var FormObject = 0;
    if (document.mainform[strQName])
    {
        FormObject = document.mainform[strQName];
    }
    return FormObject;
}

function SSI_BYOClass(strQName, AttIndexArray, strInputType, blnShowPrice, ProhibitionsArray, blnCondText, blnCondPrice, intBasePrice, intNumDecimalPlaces, strThousandSeparator, strDecimalSeparator, intPriceAtt, intQuestNum, strErrText, strProhibitionErrorMsg, CondRelationshipsArray, CondRelationshipsIndexArray, strScriptExtension, strStudyName, strRespNum, intPageNum, CondPriceArray, strCondPricePossError, strCondPriceNegError, strCondPriceNeutralError, strCurrencySymbol, strCurrencyPosition, strCondPriceErrorMsg, AltSpecificRules)
{
    this.strQName = strQName;
    this.AttIndexArray = AttIndexArray;
    this.strInputType = strInputType;
    this.blnShowPrice = blnShowPrice;
    this.ProhibitionsArray = ProhibitionsArray;
    this.blnCondText = blnCondText;
    this.blnCondPrice = blnCondPrice;
    this.intBasePrice = intBasePrice;
    this.intNumDecimalPlaces = intNumDecimalPlaces;
    this.strThousandSeparator = strThousandSeparator;
    this.strDecimalSeparator = strDecimalSeparator;
    this.intPriceAtt = intPriceAtt;
    this.CurrentProhibitedSet = 0;
    this.strProhibitionErrorMsg = strProhibitionErrorMsg;
    this.intQuestNum = intQuestNum;
    this.strErrText = strErrText;
    this.CondRelationshipsArray = CondRelationshipsArray;
    this.CondRelationshipsIndexArray = CondRelationshipsIndexArray;
    this.strScriptExtension = strScriptExtension;
    this.strStudyName = strStudyName;
    this.strRespNum = strRespNum;
    this.intPageNum = intPageNum;
    this.CondPriceArray = CondPriceArray;
    this.strCondPricePossError = strCondPricePossError;
    this.strCondPriceNegError = strCondPriceNegError;
    this.strCondPriceNeutralError = strCondPriceNeutralError;
    this.strCurrencySymbol = strCurrencySymbol;
    this.strCurrencyPosition = strCurrencyPosition;
    this.strCondPriceErrorMsg = strCondPriceErrorMsg;
    this.PricesArray = [];
    this.OriginalPricesArray = [];
    this.AltSpecificRules = AltSpecificRules;
    //Methods
    this.SetupEvents = SSI_BYOSetEvents;
    this.BYOMakeFunction = SSI_BYOMakeFunction;
    this.CheckBYOProhibitions = SSI_BYOProhibitions;
    this.BYOCheckProhibitedSet = SSI_BYOCheckProhibitedSet;
    this.BYOTotal = SSI_BYOTotal;
    this.BYOAltSpecificDisplay = SSI_BYOAltSpecificDisplay;
    this.BYOProhEvent = SSI_BYOProhEvent;
    this.BYOProhHighlight = SSI_BYOProhHighlight;
    this.BYOCondText = SSI_BYOCondText;
    this.BYOGetLevelValue = SSI_BYOGetLevelValue;
    this.BYOCondPrice = SSI_BYOCondPrice;
    this.BYOChangePriceInLabels = SSI_BYOChangePriceInLabels;
    this.BYOPriceChangeAlert = SSI_BYOPriceChangeAlert;
    this.BYOAddPrices = SSI_BYOAddPrices;
    this.BYOAttVisible = SSI_BYOAttVisible;
}

function SSI_BYOAddPrices(intAtt, LevelPricesArray)
{
    this.PricesArray[intAtt] = LevelPricesArray;
    this.OriginalPricesArray[intAtt] = LevelPricesArray;
}

function SSI_BYOSetEvents()
{
    var BYOObj = this;
    var i = 0;
    var j = 0;
    var InputElement = 0;
    var strInputName = "";
    var NumberObj = "";
    var intIndex = 0;
    // Set up level onChange events.
    for (i = 1; i <= BYOObj.AttIndexArray.length; i++)
    {
        intIndex = BYOObj.AttIndexArray[i - 1];
        strInputName = BYOObj.strQName + "_" + intIndex;
        InputElement = document.mainform[strInputName];
        if (BYOObj.strInputType == "radio")
        {
            //Multi radio buttons
            if (InputElement.length)
            {
                for (j = 0; j < InputElement.length; j++)
                {
                    //Need to convert it to a jQuery obj
                    var RadioObj = jQuery(InputElement[j]);
                    if (RadioObj.length)
                    {
                        var ClickableObj = RadioObj.closest(".clickable");
                        ClickableObj.bind("byo_click", {
                            BYOObjParam: BYOObj,
                            intIndexParam: intIndex
                        }, function (event)
                        {
                            event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
                        });
                        if (GlobalGraphicalSelect)
                        {
                            ClickableObj.bind("keyup", {
                                BYOObjParam: BYOObj,
                                intIndexParam: intIndex
                            }, function (event)
                            {
                                event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
                            });
                        }
                    }
                }
            }
                //Single radio button
            else
            {
                jQuery(InputElement).bind("click", {
                    BYOObjParam: BYOObj,
                    intIndexParam: intIndex
                }, function (event)
                {
                    event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
                });
            }
        }
        else if (BYOObj.strInputType == "combo")
        {
            jQuery(InputElement).bind("change", {
                BYOObjParam: BYOObj,
                intIndexParam: intIndex
            }, function (event)
            {
                event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
            });
        }
        if (BYOObj.blnShowPrice)
        {
            //Set up disable events
            strInputName = BYOObj.strQName + "_price" + intIndex;
            InputObj = jQuery("#" + strInputName);
            InputObj.bind("change", {
                BYOObjParam: BYOObj,
                intIndexParam: intIndex
            }, function (event)
            {
                event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
            });
            InputObj.bind("keyup", {
                BYOObjParam: BYOObj,
                intIndexParam: intIndex
            }, function (event)
            {
                event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
            });
        }
    }
    //Must be before show price
    if (BYOObj.AltSpecificRules.length)
    {
        BYOObj.BYOAltSpecificDisplay();
    }
    if (BYOObj.blnShowPrice)
    {
        InputObj = jQuery("#" + BYOObj.strQName + "_" + BYOObj.intPriceAtt);
        InputObj.bind("change", {
            BYOObjParam: BYOObj,
            intIndexParam: BYOObj.AttIndexArray.length
        }, function (event)
        {
            event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
        });
        InputObj.bind("keyup", {
            BYOObjParam: BYOObj,
            intIndexParam: BYOObj.AttIndexArray.length
        }, function (event)
        {
            event.data.BYOObjParam.BYOMakeFunction(event.data.intIndexParam);
        });
        //Run the total code now so that if they have a base price it will show up at the bottom
        BYOObj.BYOTotal(0);
    }
}

function SSI_BYOMakeFunction(intAttIndex)
{
    var BYOObj = this;
    //Must be before show price
    if (BYOObj.AltSpecificRules.length)
    {
        BYOObj.BYOAltSpecificDisplay();
    }
    if (BYOObj.blnShowPrice)
    {
        BYOObj.BYOTotal(intAttIndex);
    }
    if (BYOObj.ProhibitionsArray.length)
    {
        BYOObj.BYOProhEvent();
    }
    if (BYOObj.blnCondText)
    {
        BYOObj.BYOCondText(0, intAttIndex);
    }
    if (BYOObj.blnCondPrice && BYOObj.blnShowPrice)
    {
        BYOObj.BYOCondPrice(true);
    }
}

function SSI_BYOAltSpecificDisplay()
{
    var BYOObj = this;
    var input_name = "";
    var att = 0;
    var cond_att = 0;
    var lev_input = 0;
    var i = 0;
    var j = 0;
    var rule_layer = [];
    var rule = [];
    var row = 0;
    var rules_hash = SSI_BYOGetAltSpecificRulesStruct(BYOObj.AltSpecificRules);
    var keys = rules_hash.getKeys();
    var scroll_distance = jQuery(document).scrollTop();
    keys = keys.sort();
    jQuery("#" + BYOObj.strQName + "_div .conditional_att").hide();
    //Process logic one layer at a time starting at root
    for (i = 0; i < keys.length; i++)
    {
        var show_hash = new SSIHash();
        rule_layer = rules_hash.get(keys[i]);
        for (j = 0; j < rule_layer.length; j++)
        {
            rule = rule_layer[j];
            att = SSI_GetAltSpecRuleAtt(rule[0]);
            input_name = BYOObj.strQName + "_" + att;
            //Get attribue level - combo or radio code here
            lev_input = BYOObj.BYOGetLevelValue(input_name);
            //Only test the rule if attribute is visible
            if (lev_input > 0 && BYOObj.BYOAttVisible(att))
            {
                cond_att = rule[1];
                row = jQuery("#" + BYOObj.strQName + "_row_" + cond_att);
                if (row.hasClass("conditional_att"))
                {
                    if (att + "-" + lev_input == rule[0])
                    {
                        row.show();
                    }
                }
            }
        }
    }
    SSI_BYOAltColors();
    //When hiding and showing HTML and then clicking on radio button weird scrolling was occuring.
    //This is a hack to stop that scrolling.
    jQuery(document).scrollTop(scroll_distance);
}

function SSI_BYOGetAltSpecificRulesStruct(rules)
{
    var i = 0;
    var att = 0;
    var att_lev = "";
    var num_nested = 0;
    var rules_hash = new SSIHash();
    for (i = 0; i < rules.length; i++)
    {
        att_lev = rules[i][0];
        att = SSI_GetAltSpecRuleAtt(att_lev);
        num_nested = SSI_FindAltSpecDepth(att, rules, i);
        var rules_array = [];
        if (rules_hash.has(num_nested))
        {
            rules_array = rules_hash.get(num_nested);
        }
        rules_array.push(rules[i]);
        rules_hash.set(num_nested, rules_array);
    }
    return rules_hash;
}

function SSI_FindAltSpecDepth(att, rules, current_index)
{
    var i = 0;
    var cond_att = 0;
    var att_lev = 0;
    var local_nested_count = 0;
    var highest_nested_count = 0;
    for (i = 0; i < rules.length; i++)
    {
        if (i != current_index)
        {
            att_lev = rules[i][0];
            cond_att = rules[i][1];
            if (att == cond_att)
            {
                var parent_att = SSI_GetAltSpecRuleAtt(att_lev);
                local_nested_count++;
                var new_nested_count = SSI_FindAltSpecDepth(parent_att, rules, i);
                local_nested_count += new_nested_count;
                if (local_nested_count > highest_nested_count)
                {
                    highest_nested_count = local_nested_count;
                }
                local_nested_count = 0;
            }
        }
    }
    return highest_nested_count;
}

function SSI_GetAltSpecRuleAtt(att_lev)
{
    att_lev_array = att_lev.split("-");
    att = att_lev_array[0];
    return att;
}

function SSI_BYOAltColors()
{
    jQuery(".byo_att_row:visible:odd").removeClass("alt_color1").addClass("alt_color2");
    jQuery(".byo_att_row:visible:even").removeClass("alt_color2").addClass("alt_color1");
}

function SSI_BYOAttVisible(att)
{
    var BYOObj = this;
    var visible = false;
    visible = jQuery("#" + BYOObj.strQName + "_row_" + att).is(":visible");
    return visible;
}

function SSI_BYOTotal(intCurrentAttIndex)
{
    var BYOObj = this;
    var InputElement = 0;
    var strInputName = "";
    var intChoice = 0;
    var intLev = 0;
    var intAttribute = 0;
    var i = 0;
    var j = 0;
    var intFocusPrice = 0;
    var strPrice = "";
    var strFormattedPrice = "";
    var intSum = BYOObj.intBasePrice;
    for (i = 0; i < BYOObj.AttIndexArray.length; i++)
    {
        intLev = 0;
        intAttribute = BYOObj.AttIndexArray[i];
        if (BYOObj.BYOAttVisible(intAttribute))
        {
            strInputName = BYOObj.strQName + "_" + intAttribute;
            PriceBoxObj = document.mainform[BYOObj.strQName + "_price" + intAttribute];
            if (BYOObj.blnCondPrice)
            {
                //Turn off any colors that might have been set from price change alert
                if (intCurrentAttIndex == 0)
                {
                    jQuery("#" + BYOObj.strQName + "_row_" + intAttribute).removeClass("acbc_price_change_warning");
                }
            }
            //Get attribue level - combo or radio code here
            intLev = BYOObj.BYOGetLevelValue(strInputName);
            if (intLev > 0)
            {
                strPrice = BYOObj.PricesArray[intAttribute][intLev - 1];
                if (!strPrice)
                {
                    strPrice = 0;
                }
                strFormattedPrice = SSI_RoundNumber(strPrice, BYOObj.intNumDecimalPlaces);
                strFormattedPrice = SSI_PriceFormat(strFormattedPrice, BYOObj.strThousandSeparator, BYOObj.strDecimalSeparator, BYOObj.intNumDecimalPlaces);
                PriceBoxObj.value = strFormattedPrice;
                intFocusPrice = parseFloat(strPrice);
                if (isNaN(intFocusPrice))
                {
                    intFocusPrice = 0;
                }
                intSum += intFocusPrice;
            }
            else
            {
                PriceBoxObj.value = 0;
            }
        }
    }
    InputElement = document.mainform[BYOObj.strQName + "_" + BYOObj.intPriceAtt];
    intSum = SSI_RoundNumber(intSum, BYOObj.intNumDecimalPlaces);
    intSum = SSI_PriceFormat(intSum, BYOObj.strThousandSeparator, BYOObj.strDecimalSeparator, BYOObj.intNumDecimalPlaces);
    InputElement.value = intSum;
}

function SSI_BYOProhibitions()
{
    var blnConceptFails = false;
    var ProhibitedSet = 0;
    var AttLevPair = 0;
    var intProhAtt = 0;
    var intProhLev = 0;
    var blnProhibited = true;
    var i = 0;
    //This makes sure that any lingering highlighting is removed before the check is done again.  (We only want to show one prohibition at a time)
    for (i = 0; i < this.ProhibitionsArray.length; i++)
    {
        ProhibitedSet = this.ProhibitionsArray[i];
        this.BYOProhHighlight(ProhibitedSet, false);
    }
    for (i = 0; i < this.ProhibitionsArray.length; i++)
    {
        blnProhibited = true;
        ProhibitedSet = this.ProhibitionsArray[i];
        blnProhibited = this.BYOCheckProhibitedSet(ProhibitedSet);
        if (blnProhibited)
        {
            blnConceptFails = true;
            break;
        }
    }
    if (blnConceptFails)
    {
        this.BYOProhHighlight(ProhibitedSet, true);
        var strMessage = SSI_ReplaceErrMsgKeyWords(this.strProhibitionErrorMsg, this.intQuestNum, this.strQName, this.strErrText, 0, 0);
        SSI_UpdateQuestionErrHash(this.strQName, this.strQName, strMessage, 0);
        this.CurrentProhibitedSet = ProhibitedSet;
    }
    else
    {
        this.CurrentProhibitedSet = 0;
    }
    return !blnConceptFails;
}

function SSI_BYOCheckProhibitedSet(ProhibitedSet)
{
    var BYOObj = this;
    var i = 0;
    var AttLevPair = 0;
    var intProhAtt = 0;
    var InputElement = 0;
    var intValue = 0;
    var intProhLev = 0;
    var blnProhibited = true;
    var intNumPairs = ProhibitedSet.length;
    for (i = 0; i < intNumPairs; i++)
    {
        AttLevPair = ProhibitedSet[i];
        intProhAtt = AttLevPair[0];
        intProhLev = AttLevPair[1];
        //The att might not exist if they are using constructed lists
        if (document.mainform[BYOObj.strQName + "_" + intProhAtt] && this.BYOAttVisible(intProhAtt))
        {
            InputElement = document.mainform[BYOObj.strQName + "_" + intProhAtt];
            if (BYOObj.strInputType == "radio")
            {
                intValue = SSI_GetRadioValueChecked(BYOObj.strQName + "_" + intProhAtt);
            }
            else if (BYOObj.strInputType == "combo")
            {
                intValue = InputElement.value;
            }
            if (intValue != intProhLev)
            {
                blnProhibited = false;
                break;
            }
        }
        else
        {
            blnProhibited = false;
            break;
        }
    }
    return blnProhibited;
}

function SSI_BYOProhHighlight(ProhibitedSet, blnHighlight)
{
    var RowObj = 0;
    var i = 0;
    var intNumPairs = ProhibitedSet.length;
    var AttLevPair = 0;
    var intProhAtt = 0;
    var intProhLev = 0;
    for (i = 0; i < intNumPairs; i++)
    {
        AttLevPair = ProhibitedSet[i];
        intProhAtt = AttLevPair[0];
        intProhLev = AttLevPair[1];
        RowObj = jQuery("#" + this.strQName + "_" + intProhAtt + "_error");
        if (RowObj)
        {
            if (blnHighlight)
            {
                RowObj.addClass("acbc_proh_error");
            }
            else
            {
                RowObj.removeClass("acbc_proh_error");
            }
            RowObj.removeClass("acbc_price_change_warning");
        }
    }
}

function SSI_BYOProhEvent()
{
    if (this.CurrentProhibitedSet)
    {
        if (this.BYOCheckProhibitedSet(this.CurrentProhibitedSet))
        {
            this.BYOProhHighlight(this.CurrentProhibitedSet, true);
        }
        else
        {
            this.BYOProhHighlight(this.CurrentProhibitedSet, false);
        }
    }
}

function SSI_BYOCondText(blnInitialize, intCurrentAttIndex)
{
    var BYOObj = this;
    var i = 0;
    var j = 0;
    var k = 0;
    var AttArray = 0;
    var CondAttHash = new SSIHash();
    for (i = 0; i < BYOObj.AltSpecificRules.length; i++)
    {
        CondAttHash.set(BYOObj.AltSpecificRules[i][1], 1);
    }
    for (i = 0; i < BYOObj.CondRelationshipsArray.length; i++)
    {
        AttArray = BYOObj.CondRelationshipsArray[i];
        //Search and see if current attribute is in this relationship
        for (j = 0; j < AttArray.length; j++)
        {
            //If current att or conditional att
            if (blnInitialize || AttArray[j] == intCurrentAttIndex || jQuery("#" + BYOObj.strQName + "_row_" + AttArray[j]).hasClass("conditional_att"))
            {
                var strAnswerList = "";
                var intLevel = 0;
                var intAtt = 0;
                //Get answers for each attribute
                for (k = 0; k < AttArray.length; k++)
                {
                    intAtt = AttArray[k];
                    if (BYOObj.BYOAttVisible(intAtt))
                    {
                        intLevel = BYOObj.BYOGetLevelValue(BYOObj.strQName + "_" + intAtt);
                    }
                    else
                    {
                        intLevel = 0;
                    }
                    //If att is alt specific conditional and a conditional display, then when it is not visible treat it as a 0.
                    if ((intLevel > 0 && BYOObj.BYOAttVisible(intAtt)) || (CondAttHash.has(intAtt) && !BYOObj.BYOAttVisible(intAtt)))
                    {
                        strAnswerList += "A-" + intAtt + " L-" + intLevel;
                        strAnswerList += ",";
                    }
                    else
                    {
                        strAnswerList = "";
                        break;
                    }
                }
                var intRelIndex = BYOObj.CondRelationshipsIndexArray[i];
                var strViewerName = "#" + BYOObj.strQName + "_rel_" + intRelIndex;
                //Make sure that the viewer is available before assigning to it.
                if (jQuery(strViewerName).length)
                {
                    //Make copy of strQName because can't use "this" inside of function below.
                    var strQName = BYOObj.strQName;
                    jQuery.get("ciwweb" + BYOObj.strScriptExtension, {
                        hid_studyname: BYOObj.strStudyName,
                        hid_respnum: BYOObj.strRespNum,
                        hid_pagenum: BYOObj.intPageNum,
                        sys_acbc_name: BYOObj.strQName,
                        sys_acbc_cond_rel: intRelIndex,
                        sys_acbc_byo_request: strAnswerList,
                        sys_time: new Date().getTime()
                    }, function (strResponse)
                    {
                        var intCommaIndex = strResponse.indexOf(",");
                        var intIndex = strResponse.substr(0, intCommaIndex);
                        var strHTML = strResponse.substr(intCommaIndex + 1);
                        var strViewerName = strQName + "_rel_" + intIndex;
                        jQuery("#" + strViewerName).html(strHTML);
                    });
                    break;
                }
            }
        }
    }
}

function SSI_BYOCondPrice(blnShowAlert)
{
    var BYOObj = this;
    var ChangedAttLevArray = [];
    var CondPriceRel = 0;
    var i = 0;
    var intReplaceAtt = 0;
    var intReplaceLev = 0;
    var intPriceChange = 0;
    var blnCondLevSelected = true;
    var intSelLev = 0;
    var intCondLev = 0;
    var InputElement = 0;
    var intCondAtt = 0;
    var intOldPrice = 0;
    var intNewPrice = 0;
    var PriceBoxObj = 0;
    var blnPriceChanged = false;
    var LocalPricesArray = SSI_DeepCopyArray(BYOObj.OriginalPricesArray);
    for (i = 0; i < BYOObj.CondPriceArray.length; i++)
    {
        blnCondLevSelected = true;
        CondPriceRel = BYOObj.CondPriceArray[i];
        for (j = 0; j < CondPriceRel.length; j++)
        {
            if (j == 0)
            {
                intReplaceAtt = CondPriceRel[j][0];
                intReplaceLev = CondPriceRel[j][1];
                intPriceChange = CondPriceRel[j][2];
                //This is to check and see if the item to change exists
                if (jQuery("#" + BYOObj.strQName + "_" + intReplaceAtt + "_" + intReplaceLev + "_label").length)
                {
                    ChangedAttLevArray.push([intReplaceAtt, intReplaceLev]);
                }
                else
                {
                    blnCondLevSelected = false;
                    break;
                }
            }
            else
            {
                intCondAtt = CondPriceRel[j][0];
                intCondLev = CondPriceRel[j][1];
                intSelLev = BYOObj.BYOGetLevelValue(BYOObj.strQName + "_" + intCondAtt);
                if (intSelLev != intCondLev || !BYOObj.BYOAttVisible(intCondAtt))
                {
                    blnCondLevSelected = false;
                    break;
                }
            }
        }
        if (blnCondLevSelected)
        {
            intOldPrice = LocalPricesArray[intReplaceAtt][intReplaceLev - 1];
            intNewPrice = SSI_ConvertToNumber(intOldPrice) + SSI_ConvertToNumber(intPriceChange);
            LocalPricesArray[intReplaceAtt][intReplaceLev - 1] = intNewPrice;
        }
    }
    var OldPricesArray = SSI_DeepCopyArray(BYOObj.PricesArray);
    BYOObj.PricesArray = LocalPricesArray;
    BYOObj.BYOTotal(0);
    BYOObj.BYOChangePriceInLabels(ChangedAttLevArray);
    //Save changed prices to data file
    var ChangedPricesArray = [];
    var strChangedPrices = "";
    for (i = 0; i < ChangedAttLevArray.length; i++)
    {
        intReplaceAtt = ChangedAttLevArray[i][0];
        ChangedPricesArray = BYOObj.PricesArray[intReplaceAtt];
        strChangedPrices = ChangedPricesArray.join(",");
        document.mainform[BYOObj.strQName + "_" + intReplaceAtt + "_prices"].value = strChangedPrices;
    }
    if (blnShowAlert)
    {
        BYOObj.BYOPriceChangeAlert(OldPricesArray, LocalPricesArray);
    }
}

function SSI_BYOPriceChangeAlert(OldPricesArray, NewPricesArray)
{
    var OriginalLevArray = [];
    var NewLevArray = [];
    var i = 0;
    var j = 0;
    var blnPriceChanged = false;
    var intSelLev = 0;
    for (i = 0; i < this.AttIndexArray.length; i++)
    {
        OriginalLevArray = OldPricesArray[this.AttIndexArray[i]];
        NewLevArray = NewPricesArray[this.AttIndexArray[i]];
        for (j = 0; j < OriginalLevArray.length; j++)
        {
            if (OriginalLevArray[j] != NewLevArray[j])
            {
                intSelLev = this.BYOGetLevelValue(this.strQName + "_" + this.AttIndexArray[i]);
                if (intSelLev > 0)
                {
                    blnPriceChanged = true;
                    jQuery("#" + this.strQName + "_row_" + this.AttIndexArray[i]).addClass("acbc_price_change_warning");
                    break;
                }
            }
        }
    }
    if (blnPriceChanged)
    {
        strMessage = SSI_ReplaceErrMsgKeyWords(this.strCondPriceErrorMsg, this.intQuestNum, this.strQName, this.strErrText, 0, 0);
        SSI_ShowAlert(strMessage);
    }
}

function SSI_ConvertToNumber(intNumber)
{
    intNumber = parseFloat(intNumber);
    if (isNaN(intNumber))
    {
        intNumber = 0;
    }
    return intNumber;
}

function SSI_BYOChangePriceInLabels(ChangedAttLevArray)
{
    var intAtt = 0;
    var intLev = 0;
    var intPrice = 0;
    var strPostFixLabel = "";
    var strFormattedPrice = "";
    var LabelObj = 0;
    //Set price labels
    for (i = 0; i < ChangedAttLevArray.length; i++)
    {
        intAtt = ChangedAttLevArray[i][0];
        intLev = ChangedAttLevArray[i][1];
        LabelObj = jQuery("#" + this.strQName + "_" + intAtt + "_" + intLev + "_label");
        if (LabelObj.length)
        {
            intPrice = this.PricesArray[intAtt][intLev - 1];
            strPostFixLabel = "";
            if (intPrice > 0)
            {
                strPostFixLabel = this.strCondPricePossError;
            }
            else if (intPrice == 0)
            {
                strPostFixLabel = this.strCondPriceNeutralError;
            }
            else if (intPrice < 0)
            {
                strPostFixLabel = this.strCondPriceNegError;
                //Change it to positive
                intPrice *= -1;
            }
            strFormattedPrice = SSI_RoundNumber(intPrice, this.intNumDecimalPlaces);
            strFormattedPrice = SSI_PriceFormat(strFormattedPrice, this.strThousandSeparator, this.strDecimalSeparator, this.intNumDecimalPlaces);
            if (this.strCurrencyPosition == "left")
            {
                strFormattedPrice = this.strCurrencySymbol + strFormattedPrice;
            }
            else
            {
                strFormattedPrice += this.strCurrencySymbol;
            }
            //Note, there was a bug in Safari with str.replace and regular expressions when replace with text was $0.
            var strFuncName = "[%ACBCPRICELEVELTEXT()%]";
            while (strPostFixLabel.indexOf(strFuncName) > -1)
            {
                var intStartIndex = strPostFixLabel.indexOf(strFuncName);
                var intLength = strFuncName.length;
                strPostFixLabel = strPostFixLabel.substr(0, intStartIndex) + strFormattedPrice + strPostFixLabel.substr(intStartIndex + intLength);
            }
            if (this.strInputType == "radio")
            {
                var PriceTextObj = LabelObj.find(".acbc_byo_price_text");
                PriceTextObj.html(" " + strPostFixLabel);
            }
            else if (this.strInputType == "combo")
            {
                var TemplateLabelObj = LabelObj.closest(".level_text_cell").find(".combo_label_" + intLev).clone();
                var PriceTextObj = TemplateLabelObj.find(".acbc_byo_price_text");
                PriceTextObj.replaceWith(" " + strPostFixLabel);
                LabelObj.html(TemplateLabelObj.html());
            }
        }
    }
}

function SSI_BYOGetLevelValue(strVarName)
{
    var InputElement = document.mainform[strVarName];
    var intChoice = 0;
    //If the attribute is missing because it has been removed from the BYO, then there should be a hidden value with the top level in it.
    //This could be hidden, combo box, or a single radio
    if (InputElement)
    {
        if (InputElement.value)
        {
            intChoice = InputElement.value;
        }
        else
        {
            intChoice = SSI_GetRadioValueChecked(strVarName);
        }
    }
    return intChoice;
}

function CastToInt(strNumber)
{
    return (parseInt(strNumber) + 0);
}

function SSI_SetupToolTips()
{
    //overwriting the default funcitonality of the jQueryUI tooltip's content funciton
    $.widget("ui.tooltip", $.ui.tooltip, {
        options: {
            content: function() {
                var toolTipLink = $(this);
                var content = "";

                if(toolTipLink.attr('title')){
                    content = $('<div class="tool_tip_text">' + toolTipLink.attr('title') + '</div>');
                }
                else {
                    content = toolTipLink.next(".tool_tip_text").clone();
                }
                return content;
            }
        }
    })
    jQuery(".tool_tip_link, [title]").each(function ()
    {
        var toolTipLink = $(this);
        //for jQueryUI tooltips to work you must have a title attribute
        //add an empty title attribute to the element if one doesnt exist
        //if it does exist, use it for the content of the tooltip
        if(!toolTipLink.attr('title'))
        {
            toolTipLink.attr('title', '');
        }

        toolTipLink.tooltip({
            classes: {
                "ui-tooltip": "tool_tip_text_container"
            },
            track: true,
            position: {my: "left+5 top+20", collision: "flipfit"}
        });
    });
}

function SSI_SliderSetup(strQName, intScaleMin, intScaleMax, blnListItemsAsValues, blnUseAltValues, ItemValuesArray, blnShowToolTip, PreviousAnswers, strHandlePosition, intCustomValuePos, blnHasItemsFlipped)
{
    var OriginalAnchorPoints = [];
    var FlippedAnchorPoints = [];
    var FlippedItemValuesArray = [];
    var i = 0;
    var j = 0;

    if (blnListItemsAsValues)
    {
        OriginalAnchorPoints = SSI_FindAnchorSliderPoints(strQName, ItemValuesArray);
        intScaleMin = 1;
        intScaleMax = 1000;
        if (blnHasItemsFlipped)
        {
            var FlippedItemArray = ItemValuesArray.slice(0); //Copy array
            FlippedItemArray.reverse();
            FlippedAnchorPoints = SSI_FindAnchorSliderPoints(strQName, FlippedItemArray);
        }
    }
    else if (blnUseAltValues)
    {
        if (blnHasItemsFlipped)
        {
            FlippedItemValuesArray = ItemValuesArray.slice(0); //Copy array
            FlippedItemValuesArray.reverse();
        }
    }
    var CurrentAnswers = [];
    //This is to handle a case where they answer and then click refresh on the browser
    jQuery("#" + strQName + "_div .slider_container").each(function ()
    {
        var SliderControl = jQuery(this).find(".slider_control");
        var SliderInputObj = jQuery(this).find("input");
        var intValue = SliderInputObj.val();
        if (intValue !== "")
        {
            var intID = this.id.replace(strQName + "_", "");
            CurrentAnswers.push([intID, intValue]);
        }
    });
    if (CurrentAnswers.length)
    {
        PreviousAnswers = CurrentAnswers;
    }
    jQuery("#" + strQName + "_div .slider_container").each(function ()
    {
        var SliderControl = jQuery(this).find(".slider_control");
        var SliderInputObj = jQuery(this).find("input");
        var SliderToolTip = 0;
        var blnFlipScale = false;
        var AnchorPoints = [];
        var AltValuesArray = [];
        if (SliderControl.hasClass("flip_scale"))
        {
            blnFlipScale = true;
        }
        if (blnListItemsAsValues)
        {
            if (blnFlipScale)
            {
                AnchorPoints = FlippedAnchorPoints;
            }
            else
            {
                AnchorPoints = OriginalAnchorPoints;
            }
        }
        else if (blnUseAltValues)
        {
            if (blnFlipScale)
            {
                AltValuesArray = FlippedItemValuesArray;
            }
            else
            {
                AltValuesArray = ItemValuesArray;
            }
        }
        if (blnShowToolTip)
        {
            jQuery(this).find(".slider_tool_tip");
            SliderToolTip.hide();
        }
        SliderControl.slider({
            min: intScaleMin,
            max: intScaleMax,
            start: function (e, ui)
            {
                if (blnShowToolTip)
                {
                    SliderToolTip.fadeIn('fast');
                }
            },
            change: function (e, ui)
            {
                if (blnShowToolTip)
                {
                    SSI_ShowSliderToolTip(ui, SliderToolTip);
                }
            },
            slide: function (e, ui)
            {
                jQuery(this).addClass("touched");
                if (blnShowToolTip)
                {
                    SSI_ShowSliderToolTip(ui, SliderToolTip);
                }
            },
            stop: function (e, ui)
            {
                var intValue = 0;
                var intPosValue = 0;
                if (blnListItemsAsValues)
                {
                    var ResultArray = 0;
                    if (blnFlipScale)
                    {
                        var ReversedScale = AnchorPoints;
                        ReversedScale.reverse();
                        ResultArray = SSI_FindSliderListValue(ui.value, ReversedScale, intScaleMax, ui);
                    }
                    else
                    {
                        ResultArray = SSI_FindSliderListValue(ui.value, AnchorPoints, intScaleMax, ui);
                    }
                    intValue = ResultArray[0];
                    intPosValue = ResultArray[1];
                }
                else if (blnUseAltValues)
                {
                    intValue = AltValuesArray[ui.value - 1];
                    intPosValue = ui.value;
                }
                else
                {
                    if (blnFlipScale)
                    {
                        intValue = SSI_FlipNumericScale(ui.value, intScaleMin, intScaleMax);
                    }
                    else
                    {
                        intValue = ui.value;
                    }
                    intPosValue = ui.value;
                }
                SSI_SetSliderValue(jQuery(this), SliderInputObj, intValue, intPosValue, strHandlePosition);
                jQuery(this).addClass("touched");
            }
        });
        // To get left do nothing
        var sliderStartVal = 0;
        if (strHandlePosition == "center")
        {
            var scale_value = ((intScaleMax - intScaleMin) / 2) + intScaleMin;

            jQuery(this).find(".ui-slider-handle").css("left", "50%");
            jQuery(this).find('.slider_control').slider('value', scale_value);
        }
        else if (strHandlePosition == "right")
        {
            jQuery(this).find(".ui-slider-handle").css("left", "100%");
            jQuery(this).find('.slider_control').slider('value', intScaleMax);
        }
        else if (strHandlePosition == "custom")
        {
            //Set the original value positions not the random ones.
            var intActualPos = intCustomValuePos;
            if (blnListItemsAsValues)
            {
                intActualPos = SSI_FindSliderPosition(intCustomValuePos, OriginalAnchorPoints, intScaleMax, this);
            }
            else if (blnUseAltValues)
            {
                for (j = 0; j < ItemValuesArray.length; j++)
                {
                    if (intCustomValuePos == ItemValuesArray[j])
                    {
                        intActualPos = j + 1;
                        break;
                    }
                }
            }
            SSI_SetSliderPosition(jQuery(this).find(".slider_control"), intActualPos);
        }
        else if (strHandlePosition == "invisible")
        {
            var SliderHandle = jQuery(this).find(".ui-slider-handle");
            jQuery(this).find('slider_control').slider('value', 0);
            SliderHandle.hide();
        }
        //Restore previous answers
        if (PreviousAnswers.length)
        {
            var intID = this.id.replace(strQName + "_", "");
            var intValue = 0;
            var intPosValue = 0;
            for (i = 0; i < PreviousAnswers.length; i++)
            {
                if (PreviousAnswers[i][0] == intID)
                {
                    intValue = PreviousAnswers[i][1];
                    intPosValue = 0;
                    if (blnListItemsAsValues)
                    {
                        intPosValue = SSI_FindSliderPosition(intValue, AnchorPoints, intScaleMax, this);
                    }
                    else if (blnUseAltValues)
                    {
                        for (j = 0; j < AltValuesArray.length; j++)
                        {
                            if (intValue == AltValuesArray[j])
                            {
                                intPosValue = j + 1;
                                break;
                            }
                        }
                    }
                    else
                    {
                        if (blnFlipScale)
                        {
                            intPosValue = SSI_FlipNumericScale(intValue, intScaleMin, intScaleMax);
                        }
                        else
                        {
                            intPosValue = intValue;
                        }
                    }
                    SSI_SetSliderValue(jQuery(this).find(".slider_control"), SliderInputObj, intValue, intPosValue, strHandlePosition);
                    break;
                }
            }
        }
    });
}

function SSI_FlipNumericScale(intValue, intScaleMin, intScaleMax)
{
    var intNumFromLeft = intValue - intScaleMin;
    return intScaleMax - intNumFromLeft;
}

function SSI_SetSliderValue(SliderControlObj, SliderInputObj, intValue, intPosValue, strHandlePosition)
{
    SliderControlObj.slider('value', intPosValue);
    SliderInputObj.val(intValue);
    if (strHandlePosition == "invisible")
    {
        var SliderHandle = SliderControlObj.find(".ui-slider-handle");
        SliderHandle.show();
    }
}

function SSI_SetSliderPosition(SliderControlObj, intPosValue)
{
    SliderControlObj.slider('value', intPosValue);
}

function SSI_ShowSliderToolTip(ui, SliderToolTip)
{
    var intHandlePos = jQuery(ui.handle).css("left");
    var intWidthToolTip = SliderToolTip.css("width");
    var intToolTipPos = SSI_RoundNumber(intHandlePos, 0) - SSI_RoundNumber(intWidthToolTip, 0) / 2;
    intToolTipPos += "px";
    SliderToolTip.css("left", intToolTipPos).text(ui.value);
}

function SSI_FindAnchorSliderPoints(strQName, ItemValuesArray)
{
    var ColLabels = jQuery("#" + strQName + "_div").find(".col_label_cell");
    var intTotalWidth = 0;
    var WidthsArray = [];
    var intColWidth = 0;
    var i = 0;
    ColLabels.each(function ()
    {
        intColWidth = SSI_RoundNumber(jQuery(this).css("width"), 1);
        intColWidth += SSI_RoundNumber(jQuery(this).css("padding-left"), 0);
        intColWidth += SSI_RoundNumber(jQuery(this).css("padding-right"), 0);
        WidthsArray.push(intColWidth);
        intTotalWidth += intColWidth;
    });
    var PercentArray = [];
    var intLeftBound = 0;
    var intRightBound = 0;
    var intWidthValue = 0;
    for (i = 0; i < WidthsArray.length; i++)
    {
        intWidthValue = SSI_RoundNumber((WidthsArray[i] / intTotalWidth) * 100, 3);
        intRightBound = SSI_RoundNumber(intRightBound + intWidthValue, 3);
        //If it is the last item make sure it goes to 100%
        if (intRightBound > 100 || (i + 1 == WidthsArray.length))
        {
            intRightBound = 100;
        }
        PercentArray.push([intLeftBound, intRightBound, ItemValuesArray[i]]);
        intLeftBound = intRightBound;
    }
    return PercentArray;
}

function SSI_FindSliderListValue(intPosValue, AnchorPoints, intMax, ui)
{
    var i = 0;
    var intLeftBound = 0;
    var intRightBound = 0;
    var intListValue = 0;
    intPosValue = SSI_RoundNumber((intPosValue / intMax) * 100, 1);
    for (i = 0; i < AnchorPoints.length; i++)
    {
        intLeftBound = AnchorPoints[i][0];
        intRightBound = AnchorPoints[i][1];
        intListValue = 0;
        if (intPosValue >= intLeftBound && intPosValue <= intRightBound)
        {
            intPosValue = SSI_GetHandleCenterPoint(AnchorPoints, intLeftBound, intRightBound, intPosValue, ui.handle);
            intListValue = AnchorPoints[i][2];
            break;
        }
    }
    return [intListValue, intPosValue];
}

function SSI_FindSliderPosition(intValue, AnchorPoints, intMax, SliderObj)
{
    var i = 0;
    var intPosValue = 0;
    for (i = 0; i < AnchorPoints.length; i++)
    {
        intLeftBound = AnchorPoints[i][0];
        intRightBound = AnchorPoints[i][1];
        intListValue = AnchorPoints[i][2];
        if (intValue == intListValue)
        {
            intPosValue = SSI_GetHandleCenterPoint(AnchorPoints, intLeftBound, intRightBound, intValue, jQuery(SliderObj).find(".ui-slider-handle"));
        }
    }
    return intPosValue;
}

function SSI_GetHandleCenterPoint(AnchorPoints, intLeftBound, intRightBound, intPosValue, HandleObj)
{
    var intCellCenterPoint = 0;
    //Only snap to middle for relatively small scales.
    if (AnchorPoints.length < 50)
    {
        intCellCenterPoint = parseInt((((intRightBound - intLeftBound) / 2) + intLeftBound));
        var intHandleWidth = parseInt(jQuery(HandleObj).css("width"));
        var intControlWidth = parseInt(jQuery(HandleObj).closest(".slider_control").css("width"));
        var intHandlePercentage = parseInt((intHandleWidth / intControlWidth) * 100);
        // if(intCellCenterPoint > 50)
        // {
        //     intCellCenterPoint += (intCellCenterPoint / 100) * intHandlePercentage * .3;
        //     if(intCellCenterPoint > 100)
        //     {
        //         intCellCenterPoint = 100;
        //     }
        // }
        // else if(intCellCenterPoint < 50)
        // {
        //     intCellCenterPoint -= ((100 - intCellCenterPoint) / 100) * intHandlePercentage * .3;
        //     if(intCellCenterPoint < 0)
        //     {
        //         intCellCenterPoint = 0;
        //     }
        // }
    }
    else
    {
        intCellCenterPoint = intPosValue;
    }
    intPosValue = intCellCenterPoint * 10;
    intPosValue = SSI_RoundNumber(intPosValue, 1);
    return intPosValue;
}

//############## Drag and Drop ####################
//detects the largest width of sortable elements and sets the width of the rest to that value
//so that the width of all the elements is the same
function SSI_StandardizeSortableSize(questionObj)
{
    var maxWidth = 0;
    var maxHeight = 0;
    var sortables = questionObj.find('.horizontal_rank .draggable_button');
    sortables.each(function ()
    {
        if ($(this).width() > maxWidth)
        {
            maxWidth = $(this).width();
        }
        if ($(this).height() > maxHeight)
        {
            maxHeight = $(this).height();
        }
    });
    //add one to the width to fix the issue where a one word options is the exact same size
    //as the width of the button content and the content for some reason dissappears.
    sortables.width(maxWidth + 1);
    sortables.height(maxHeight);
    sortables.css("visibility", "visible");
}

//sets the rank value of a draggable button
function SSI_setDragRank(dragButton, newRank)
{
    dragButton.find('.rank_number').html(newRank);
    dragButton.find('input').val(newRank);
}

jQuery.fn.SSI_updateSortInputs = (function (question)
{
    var list_item = $(this);
    var maxValue = question.find('.max_rank').attr('data-max_rank');
    var blnContainerQuestion = false;
    if (question.find('.unranked_container').length > 0)
    {
        blnContainerQuestion = true;
    }
    //update the hidden input value for items that have been answered
    if (list_item.is('.draggable_button') && !(list_item.is('.unanswered')))
    {
        var index = list_item.index();
        var item_input = list_item.children('input:first');
        if (index < maxValue)
        {
            item_input.val(index + 1);
        }
        else
        {
            item_input.val("");
            if (blnContainerQuestion)
            {
                list_item.find('input:first').val("");
                list_item.SSI_moveAnimate(question.find('.unranked_sort_area'), 500, question);
            }
        }
    }
});

jQuery.fn.SSI_sortableSort = (function (rankPlaceHolder, indexIncrament)
{
    var items_list = $(this).children();
    items_list.each(function ()
    {
        var list_item = $(this);
        var helper_index = items_list.filter('.ui-sortable-helper').index();
        if (!list_item.is('.ui-sortable-helper'))
        {
            var index = list_item.index() + indexIncrament;
            index = index < helper_index ? index + 1 : index;
            var maxRank = list_item.closest('.max_rank').attr('data-max_rank');
            if (list_item.is('.draggable_button'))
            {
                var rankNumberObj = list_item.find('.rank_number');
                //change the display
                if (index <= maxRank)
                {
                    rankNumberObj.html(index);
                }
                else
                {
                    rankNumberObj.html(rankPlaceHolder);
                }
            }
            if (list_item.is('.ui-sortable-placeholder') && list_item.is(".draggable_button"))
            {
                var placeHolderRankObj = items_list.filter('.ui-sortable-helper').find(".rank_number");
                if (index <= maxRank)
                {
                    placeHolderRankObj.html(index);
                }
                else
                {
                    placeHolderRankObj.html(rankPlaceHolder);
                }
            }
        }
    });
});

jQuery.fn.SSI_sortableStop = (function (question)
{
    //reorder the aswers in the hidden input.
    var items_list = $(this).children('.draggable_button');
    items_list.each(function ()
    {
        $(this).SSI_updateSortInputs(question);
    });
});

jQuery.fn.SSI_sortableStart = (function (ui, drag_helper_width, drag_helper_height)
{
    var new_width = drag_helper_width;

    if (ui.placeholder)
    {
        ui.placeholder.css({
            width: new_width,
            height: drag_helper_height
        });
    }
});

jQuery.fn.SSI_moveAnimate = (function (newParent, duration, question)
{
    //Allows the passin in of either a jQuery object or selector as the parent
    var element = $(this);
    var newParent = $(newParent);
    var oldOffset = element.offset();
    var oldWidth = element.width();
    var oldHeight = element.height();
    var temp = null;
    var newOffset = null;
    element.prependTo(newParent);
    temp = element.clone().appendTo(question).addClass('revert_clone');
    newOffset = element.offset();
    element.css("visibility", "hidden");
    temp.css({
        'position': 'absolute',
        'left': oldOffset.left,
        'top': oldOffset.top,
        'z-index': 1000,
        'width': oldWidth,
        'height': oldHeight
    });
    temp.animate({
        'top': newOffset.top,
        'left': newOffset.left
    }, duration, function ()
    {
        element.css("visibility", "visible");
        temp.remove();
    });
});

function SSI_hasVertScrollBar(elem)
{
    return elem.scrollHeight > elem.clientHeight;
}

function SSI_hasHztlScrollBar(elem)
{
    return elem.scrollWidth > elem.clientWidth;
}
//gives an array of ID's that represent the previously answered order of the question
function SSI_getPreviousSortableOrder(question)
{
    var order = [];
    var buttons = question.find('.draggable_button');
    var maxRank = question.find('.max_rank').attr('data-max_rank');
    for (var i = 0; i < maxRank; i++)
    {
        buttons.each(function ()
        {
            var button = $(this);
            var value = button.find('input').val();
            if (i + 1 == value)
            {
                order.push(button.attr('id'));
            }
        });
    }
    return order;
}

function SSI_setSortableOrder(order, container)
{
    for (var i = order.length - 1; i >= 0; i--)
    {
        var id = '#' + order[i];
        var buttonToMove = $(id);
        buttonToMove.prependTo(container);
        buttonToMove.removeClass('unanswered');
    }
}

function SSI_getScrollBarWidth()
{
    var inner = document.createElement('p');
    inner.style.width = "100%";
    inner.style.height = "200px";
    var outer = document.createElement('div');
    outer.style.position = "absolute";
    outer.style.top = "0px";
    outer.style.left = "0px";
    outer.style.visibility = "hidden";
    outer.style.width = "200px";
    outer.style.height = "150px";
    outer.style.overflow = "hidden";
    outer.appendChild(inner);
    document.body.appendChild(outer);
    var w1 = inner.offsetWidth;
    outer.style.overflow = 'scroll';
    var w2 = inner.offsetWidth;
    if (w1 == w2) w2 = outer.clientWidth;
    document.body.removeChild(outer);
    return (w1 - w2);
}

var rankPlaceHolder = '<span style="visibility:hidden">8</span>';
var dragAnimationSpeed = 500; //animation speed in miliseconds

//uses this event so that all images are loaded before any sizes are standardized
GlobalWindowLoadArray.push(function ()
{
    // =============Drag and drop ranking=======================
    // check for drag and drop ranking question
    if ($('.sort_container').length > 0)
    {
        // make drag and drop happen for every question on the page
        $('.question.ranking').each(function ()
        {
            var question = $(this);
            // var drag_container_width = 0;
            var drag_helper_height = 0;
            var drag_helper_width = 0;
            var rank_display_elems = question.find('.rank_display');

            if (rank_display_elems.length > 0)
            {
                var maxWidth = 0;
                rank_display_elems.each(function ()
                {
                    currentElem = $(this);
                    if (currentElem.width() > maxWidth)
                    {
                        maxWidth = currentElem.width();
                    }
                });
                var new_content_margin = 5 + maxWidth;
                rank_display_elems.width(maxWidth);
            }
            if (question.find('.horizontal_rank').length > 0)
            {
                SSI_StandardizeSortableSize(question);
            }
            question.find('.draggable_button').mousedown(function ()
            {
                var clickedButton = $(this);
                var otherButtons = question.find('.one_click_rank  .unanswered');
                if (otherButtons.length > 0)
                {
                    otherButtons.removeClass('unanswered');
                    otherButtons.each(function ()
                    {
                        $(this).SSI_updateSortInputs(question);
                    });
                }
                else if (clickedButton.is('.unanswered'))
                {
                    clickedButton.removeClass('unanswered');
                    clickedButton.SSI_updateSortInputs(question);
                }
            });
            question.find('.draggable_button').mousedown(function (event, element)
            {
                var clickedButton = $(this);
                // drag_container_width = clickedButton.closest('.sort_container').width();
                drag_helper_height = clickedButton.height();
                drag_helper_width = clickedButton.width();
            });
            //check to see if there's a previous answer and if so reorder options
            var order = SSI_getPreviousSortableOrder(question);
            if (order.length > 0)
            {
                SSI_setSortableOrder(order, question.find('.sort_container'));
                question.find('.sort_container').SSI_sortableSort(rankPlaceHolder, 1);
            }
            //show the question
            question.find('.hide_for_processing').removeClass('hide_for_processing');
            question.find('.sort_container').sortable({
                revert: dragAnimationSpeed,
                sort: function ()
                {
                    var items_list = $(this).children();
                    items_list.each(function ()
                    {
                        var list_item = $(this);
                        var helper_index = items_list.filter('.ui-sortable-helper').index();
                        if (!list_item.is('.ui-sortable-helper'))
                        {
                            var index = list_item.index();
                            index = index < helper_index ? index + 1 : index;
                            var maxRank = list_item.closest('.sort_container').attr('data-max_rank');
                            if (list_item.is('.draggable_button'))
                            {
                                var rankNumberObj = list_item.find('.rank_number');
                                //change the display
                                if (index <= maxRank)
                                {
                                    rankNumberObj.html(index);
                                }
                                else
                                {
                                    rankNumberObj.html(rankPlaceHolder);
                                }
                            }
                            if (list_item.is('.ui-sortable-placeholder') && list_item.is(".draggable_button"))
                            {
                                var placeHolderRankObj = items_list.filter('.ui-sortable-helper').find(".rank_number");
                                if (index <= maxRank)
                                {
                                    placeHolderRankObj.html(index);
                                }
                                else
                                {
                                    placeHolderRankObj.html(rankPlaceHolder);
                                }
                            }
                        }
                    });
                },
                start: function (event, ui)
                {
                    $(this).SSI_sortableStart(ui, drag_helper_width, drag_helper_height)
                },
                stop: function ()
                {
                    //reorder the aswers in the hidden input.
                    var items_list = $(this).children();
                    items_list.each(function ()
                    {
                        $(this).SSI_updateSortInputs(question);
                    });
                }
            });
            // question.find('.sort_container .draggable_button .button_content').mousemove(function (e)
            // {
                // var currentObj = $(this);
                // var blnHztlScrollBar = SSI_hasHztlScrollBar(this);
                // var blnVrtScrollBar = SSI_hasVertScrollBar(this);
                // if (blnHztlScrollBar || blnVrtScrollBar)
                // {
                //     var elemWidth = currentObj.width();
                //     var elemHeight = currentObj.height();
                //     var scrollbarWidth = SSI_getScrollBarWidth();
                //     var scrollbarHeight = scrollbarWidth;
                //     var xLimit = elemWidth;
                //     var yLimit = elemHeight;
                //     if (blnHztlScrollBar)
                //     {
                //         yLimit = elemHeight - scrollbarHeight;
                //     }
                //     if (blnVrtScrollBar)
                //     {
                //         xLimit = elemWidth - scrollbarWidth;
                //     }
                //     if ((e.offsetX > xLimit) || (e.offsetY > yLimit))
                //     {
                //         question.find('.sort_container').sortable('disable');
                //         currentObj.addClass('scroll_bar_hover');
                //     }
                //     else
                //     {
                //         question.find('.sort_container').sortable('enable');
                //         currentObj.removeClass('scroll_bar_hover');
                //     }
                // }
            // }).mouseout(function (e)
            // {
                // question.find('.sort_container').sortable('enable');
                // $(this).removeClass('scroll_bar_hover');
            // });
        });
    }
    //=====================drag and drop(container) ranking===================
    // check for a contianers quesiton
    // questions
    if ($('.sort_containers').length > 0)
    {
        // make drag and drop happen for every question on the page
        $('.question.ranking').each(function ()
        {
            var question = $(this);
            var drag_helper_height = 0;
            var drag_helper_width = 0;
            var container_height = 0;
            var container_width = 0;
            var drag_area_height = question.find('.unranked_sort_area').height();
            var drag_area_width = 0;
            var rank_display_elems = question.find('.rank_display');

            if (rank_display_elems.length > 0)
            {
                var maxWidth = 0;
                rank_display_elems.each(function ()
                {
                    currentElem = $(this);
                    if (currentElem.width() > maxWidth)
                    {
                        maxWidth = currentElem.width();
                    }
                });
                var new_content_margin = 5 + maxWidth;
                rank_display_elems.width(maxWidth);
            }
            question.find('.draggable_button').mousedown(function (event, element)
            {
                var clickedButton = $(this);
                drag_helper_height = clickedButton.height();
                drag_helper_width = clickedButton.width();
            });
            //fix the height of the drag area that holds the items to be ranked
            question.find('.container_sort_area').height(drag_area_height);

            question.find('.rank_drag_container').each(function ()
            {
                var container = $(this);
                if (container.width() > container_width)
                {
                    container_width = container.width();
                }
            });
            question.find('.rank_drag_container').width(container_width);
            //check to see if there's a previous answer and if so reorder options
            var order = SSI_getPreviousSortableOrder(question);
            if (order.length > 0)
            {
                SSI_setSortableOrder(order, question.find('.ranked_sort_area'));
                question.find('.ranked_sort_area').SSI_sortableSort(rankPlaceHolder, 1);
            }
            //show the question
            question.find('.hide_for_processing').css('visibility', 'visible');
            //create the sortables
            var connectWithString = "#" + question.attr('id') + " .container_sort_area";
            question.find('.ranked_sort_area').sortable({
                revert: dragAnimationSpeed,
                sort: function ()
                {
                    $(this).SSI_sortableSort(rankPlaceHolder, 0);
                },
                connectWith: connectWithString,
                stop: function ()
                {
                    question.find('.ranked_sort_area').SSI_sortableStop(question);
                },
                receive: function ()
                {
                    question.find('.sort_container .unanswered').removeClass('unanswered');
                    $(this).SSI_sortableSort(rankPlaceHolder, 1);
                }
            });
            //create the sortables
            connectWithString = "#" + question.attr('id') + " .container_sort_area";
            question.find('.unranked_sort_area').sortable({
                revert: dragAnimationSpeed,
                sort: function ()
                {
                    question.find('.ranked_sort_area').SSI_sortableSort(rankPlaceHolder, 1);
                },
                connectWith: connectWithString,
                stop: function ()
                {
                    question.find('.ranked_sort_area').SSI_sortableStop(question);
                },
                receive: function ()
                {
                    $(this).find('.draggable_button').find('input:first').val("");
                }
            });
            });
    }
});

function SSI_ScreenWidth()
{
    return $(window).width();
}

function SetScreenWidth()
{
    if ($("#hid_screenwidth").length)
    {
        $("#hid_screenwidth").val(SSI_ScreenWidth());
    }
}

function getMobileOtherClass(clickableOtherDiv)
{
    var classList = clickableOtherDiv.attr('class').split(/\s+/);
    var otherClass = "";
    $.each(classList, function (index, item)
    {
        if (item.match(/^other_/i))
        {
            otherClass = item;
            return false;
        }
    });
    return otherClass;
}

function GetClickableOtherTextObj(clickableObj)
{
    var inputObj = clickableObj.find(".label_text input[type=text]");
    if (!inputObj.length)
    {
        inputObj = clickableObj.find(".label_text textarea");
    }
    return inputObj;
}

function GetMobileOtherInputName(clickableObj)
{
    var inputObj = clickableObj.find(".input_cell input");
    var inputName = inputObj.attr("name");
    if (inputObj.is(":radio"))
    {
        inputName = inputObj.attr("id");
    }
    return inputName;
}

function RemoveMobileOtherText(otherClickableObj)
{
    var inputName = GetMobileOtherInputName(otherClickableObj);
    var inputObj = GetClickableOtherTextObj(otherClickableObj);
    otherClickableObj.removeClass("mobile_selected");
    if (inputObj.length)
    {
        inputObj.val("");
    }
}

//called when selection is changed from other specify to a different raido button
function ClearAllMobileGridOther(otherClickableObj)
{
    var otherClass = getMobileOtherClass(otherClickableObj);
    var associatedOtherClickables = otherClickableObj.closest(".mobile_grid").find("." + otherClass);
    //make sure all other associated other boxes have been cleared
    associatedOtherClickables.each(function ()
    {
        var currentClickable = $(this);
        currentClickable.find('.user_defined_label').hide();
        currentClickable.find('.label_text').show();
        RemoveMobileOtherText(currentClickable);
    });
}

function InitializeMobile()
{
    if ($('.mobile_grid_other').length > 0)
    {
        var mobileGrids = $('.mobile_grid');
        mobileGrids.each(function ()
        {
            var grid = $(this);
            var cards = grid.find(".mobile_grid_card");
            var other_hash = new SSIHash();
            cards.each(function ()
            {
                var card = $(this);
                var others = card.find(".mobile_grid_other");
                others.each(function ()
                {
                    var other_row = $(this);
                    var col_num = other_row.attr("data-col");
                    var input = other_row.find(".input_cell input");
                    if (input.length == 0)
                    {
                        input = other_row.find(".input_cell select");
                        if (input.length == 0)
                        {
                            input = other_row.find(".input_cell textarea");
                        }
                    }
                    var input_selected = false;
                    var other_input = other_row.find(".option_cell .open_end_text_box");
                    if (other_input.length == 0)
                    {
                        other_input = other_row.find(".option_cell textarea");
                    }
                    if (other_input.length && input.length && !other_hash.has(col_num))
                    {
                        var type = input.attr("type");
                        if (type == "radio" || type == "checkbox")
                        {
                            if (input[0].checked)
                            {
                                input_selected = true;
                            }
                        }
                        else if (input.val())
                        {
                            input_selected = true;
                        }
                        if (input_selected)
                        {
                            other_hash.set(col_num, 1);
                            ToggleMobileGridOther(other_input, grid, true);
                        }
                    }
                });
            });
            grid.find('.mobile_grid_other .other_label input[type=text], .mobile_grid_other .other_label textarea').on('keyup', function ()
            {
                ToggleMobileGridOther($(this), grid, false);
            });
        });
    }
    $('.mobile_select').each(function ()
    {
        var mobileButton = $(this);
        var inputObj = mobileButton.find('input')[0];
        if ($(inputObj).is(':checked'))
        {
            mobileButton.addClass('mobile_selected');
        }
    });
}

function ToggleMobileGridOther(clickedBox, grid, initialize)
{
    var labelText = clickedBox.val();
    var otherClass = getMobileOtherClass(clickedBox.closest('.mobile_grid_other'));
    var otherLabels = grid.find('.' + otherClass + ' .other_label');
    var cardNum = clickedBox.data('card_num');
    //if text isn't empty, select the option
    if (labelText != "")
    {
        var clickable_row = clickedBox.closest(".clickable");
        if (clickable_row.length)
        {
            var inputName = GetMobileOtherInputName(clickable_row);
            SSI_SetSelect(inputName, true);
        }
        clickedBox.addClass("mobile_selected");
        if (!initialize)
        {
            clickedBox.focus();
        }
    }
    otherLabels.each(function ()
    {
        var label = $(this);
        label.find('.user_defined_label').text(labelText);
        label.find('.label_text input[type=text]').val(labelText);
        if (clickedBox.is('textarea'))
        {
            var hidMultilineName = clickedBox.attr('name');
            grid.find('textarea[name="' + hidMultilineName + '"]').each(function ()
            {
                $(this).val(clickedBox.val());
            });
        }
        if (label.closest('.mobile_grid_card').data('card_num') != cardNum)
        {
            label.find('.user_defined_label').show();
            label.find('.label_text').hide();
        }
        if (labelText == "")
        {
            label.find('.user_defined_label').hide();
            label.find('.label_text').show();
            //unselect if other specify was selected and boxes are now empty
            var clickableObj = label.closest(".mobile_select");
            if (clickableObj.length && clickableObj.is(".mobile_selected"))
            {
                RemoveMobileOtherText(clickableObj);
                if (!initialize)
                {
                    clickedBox.focus();
                }
            }
        }
    });
}

//====== new cbc =======

//takes and array of elements, finds the tallest elememnt,
//and sets the heigh of all elements to match the height of the tallest.
//Heights are only set if the elements aren't the same height already
function SSI_StandardizeHeight(elements, setHeightAlways)
{
    var topHeight = -1;
    var blnSetHeights = false;
    elements.each(function() {
        var elem = $(this);
        var elemHeight = elem.height();
        if (topHeight >= 0 && topHeight != elemHeight) {
            blnSetHeights = true;
        }
        if (elemHeight > topHeight)
        {
            topHeight = elemHeight;
        }
    });
    //only set the height explicitly if there is a height that differs from the others
    // or becasue the caller wants it done no matter what
    if (blnSetHeights || setHeightAlways) {
        elements.each(function() {
            $(this).height(topHeight);
            $(this).addClass('adjusted_height');
        });
    }
}

GlobalWindowLoadArray.push(function ()
{
    var cbcQuestion = $('.question.cbc');
    if (cbcQuestion.length)
    {
        cbcQuestion.each(function ()
        {
            initializeCBC($(this));
        });
    }
});

function SSI_SetScrollPosition(position)
{
    //scroll to position on the page
    $("body, html").animate({
        scrollTop: position
    }, 600);
}

function ClearInactiveArrow(question)
{
    var inactiveNavArrow = question.find('.carousel_arrow.disable');
    if (inactiveNavArrow.length)
    {
        inactiveNavArrow.removeClass('disable');
    }
}

//there can only be one active nav dot per page.
//even if there is more than one task on the page there can
//be only one active nav dot. This is how we keep track of
//where the page should go when it flips into the mobile
//vertical view.
function SSI_SetActiveNavDot(question, index)
{
    var navDots = question.find('.nav_dot');
    if (navDots.length)
    {
        //deactivate previously active dot
        var activeDot = question.find('.nav_dot.active');
        if (activeDot.length)
        {
            activeDot.removeClass('active');
        }
        //set the new active dot
        navDots.eq(index).addClass('active');
        //check to see if we're on either end and need to deactivate the nav arrows
        ClearInactiveArrow(question);
        if (index == 0) {
            question.find('.carousel_arrow.carousel_prev').addClass('disable');
        }
        else if (index == navDots.length - 1) {
            question.find('.carousel_arrow.carousel_next').addClass('disable');
        }
    }
}

function SSI_SetBestResponseDot(question, index)
{
    var navDots = question.find('.nav_dot');
    if (navDots.length)
    {
        //remove previous best dot
        var activeDot = question.find('.nav_dot.best');
        if (activeDot.length)
        {
            activeDot.removeClass('best');
        }
        //set the new best dot
        navDots.eq(index).addClass('best');
    }
}

function SSI_SetWorstResponseDot(question, index)
{
    var navDots = question.find('.nav_dot');
    if (navDots.length)
    {
        //remove previous worst dot
        var currentBest = question.find('.nav_dot.worst');
        if (currentBest.length)
        {
            currentBest.toggleClass('worst');
        }
        //set the new worst dot
        navDots.eq(index).toggleClass('worst');
    }
}

//conceptIndex is 0 based, concept classes are 1 based
function getConceptClassString(conceptIndex)
{
    var conceptNumber = conceptIndex + 1;
    return '.concept_' + conceptNumber;
}

function SSI_ClearBestConcept(question)
{
    var concept = question.find('.cbc_concept.best, .custom_position_none.best');
    var bestDot = question.find('.nav_dot.best');
    if (concept.length)
    {
        var inputID = concept.find('.best_button input').attr('id');
        SSI_SetSelect(inputID, false);
        concept.removeClass('best');
    }
    if (bestDot.length)
    {
        bestDot.removeClass('best');
    }
}

function SSI_ClearWorstConcept(question)
{
    var concept = question.find('.cbc_concept.worst, .custom_position_none.worst');
    var bestDot = question.find('.nav_dot.worst');
    if (concept.length)
    {
        var inputID = concept.find('.worst_button input').attr('id');
        SSI_SetSelect(inputID, false);
        concept.removeClass('worst');
    }
    if (bestDot.length)
    {
        bestDot.removeClass('worst');
    }
}

function SSI_SetBestConcept(question, conceptIndex)
{
    var conceptClass = getConceptClassString(conceptIndex);
    var concept = question.find(conceptClass);
    if (concept.length)
    {
        SSI_ClearBestConcept(question);
        //if this is the worst concept, clear worst
        if (concept.is('.worst'))
        {
            SSI_ClearWorstConcept(question);
        }
        //set the new best concept
        concept.addClass('best');

        SSI_SetBestResponseDot(question, conceptIndex);
    }
}

function SSI_SetWorstConcept(question, conceptIndex)
{
    var conceptClass = getConceptClassString(conceptIndex);
    var concept = question.find(conceptClass);
    if (concept.length)
    {
        SSI_ClearWorstConcept(question);
        //if this is the worst concept, clear worst
        if (concept.is('.best'))
        {
            SSI_ClearBestConcept(question);
        }
        //set the new best concept
        concept.addClass('worst');
        SSI_SetWorstResponseDot(question, conceptIndex);
    }
}

function SSI_InitializeCarousel(question, carousel)
{
    if (!carousel)
    {
        carousel = question.find(".owl-carousel"); //todo: change in HTML?
        //anything bound to this event, initializse.owl.carousel, must be bound
        //before the .owlCarousel function is called and initialization happens
        carousel.on('initialized.owl.carousel', function ()
        {
            SSI_StandardizeTaskRowHeights(question);
            question.find('.cbc_task').css({
                'visibility': 'visible'
            });
        });
        carousel.owlCarousel({
            loop: false,
            margin: 18,
            items: 1,
            callbacks: true,
            responsive: {
                0: {
                    items: 1
                },
                500: {
                    items: 2
                },
            },
            center: true,
            stagePadding: 36,
        });
        question.find('.carousel_next').on('click', function ()
        {
            carousel.trigger('next.owl.carousel');
        });
        question.find('.carousel_prev').on('click', function ()
        {
            carousel.trigger('prev.owl.carousel');
        });
        carousel.on('changed.owl.carousel', function (event)
        {
            var currentIndex = event.item.index;
            SSI_SetActiveNavDot(question, currentIndex);
            $(event.item).focus();
            // remove focus from current element to prevent unwanted input from going into previous concept that is no longer shown
            $(document.activeElement).blur();

        });
        carousel.on('resized.owl.carousel', function (event)
        {
            SSI_StandardizeTaskRowHeights(question);
        });
        question.find('.mobile_horizontal .nav_dot').on('click', function ()
        {
            var clickedDot = $(this);
            var dotIndex = clickedDot.index();
            carousel.trigger('to.owl.carousel', [dotIndex]);
        });
        question.find('.owl-item').on('click', function ()
        {
            var clickedItemIndex = $(this).index();
            var activeIndex = question.find('.nav_dot.active').index();
            if (clickedItemIndex == activeIndex - 1)
            {
                carousel.trigger('prev.owl.carousel');
            }
            else if (clickedItemIndex == activeIndex + 1)
            {
                carousel.trigger('next.owl.carousel');
            }
        });
    }
    return carousel;
}

function SSI_DestroyCarousel(question, carousel)
{
    if (carousel)
    {
        question.find('.carousel_next').unbind();
        question.find('.carousel_prev').unbind();
        question.find('.mobile_horizontal .nav_dot').unbind();
        question.find('.owl-item').unbind();
        carousel.trigger('destroy.owl.carousel');
        question.find('.cbc_concept.none_concept').removeStyle('height');
        carousel = null;
    }
    return carousel;
}

function SSI_ScrollTop()
{
    var htmlMargin = 0;
    var testModeHtmlElem = $('html.test_mode');
    var testModeIframe = $('html.test_mode.test_frame');
    if (testModeHtmlElem.length && !testModeIframe.length)
    {
        htmlMargin = parseInt(testModeHtmlElem.css('margin-top'));
    }
    return $(window).scrollTop() + htmlMargin;
}

function ClearAdjustedHeightElements(question)
{
    var adjustedElems = question.find('.adjusted_height');
    if (adjustedElems.length)
    {
        adjustedElems.each(function ()
        {
            var elem = $(this);
            elem.removeStyle('height');
            elem.removeClass('adjusted_height');
        });
    }
}

function FixButtonWidths(question, responseCells)
{
    if (responseCells.length)
    {
        question.find('.fixed_width_button').each(function ()
        {
            $(this).removeStyle('width');
            $(this).removeClass('fixed_width_button');
        });
        responseCells.each(function ()
        {
            button = $(this).find('.task_select_button');
            button.addClass('fixed_width_button');
            button.width(button.width());
        });
    }
}

function SSI_StandardizeTaskRowHeights(question)
{
    var taskButtons = question.find('.task_select_button');
    ClearAdjustedHeightElements(question);

    if ((SSI_IsMobile() && question.find('.mobile_vertical').length) || question.find('.grow_cell').length)
    {
        SSI_StandardizeHeight(taskButtons, true);
    }
    else {
        var headerCells = question.find('.concept_label_cell, .top_corner_label');
        var responseCells = question.find('.cbc_response_cell');
        var attributeNumber = 1;
        if (headerCells.length) {
            if (!question.find('.cbc_concept .concept_label_cell').length) {
                //this means ther was a top corner label but no concept labels
                AdjustForCornerLabel(question);
            }
            else {
                SSI_StandardizeHeight(headerCells, false);
            }
        }
        while (attributeNumber > 0) {
            var attributeClass = ".att_" + attributeNumber;
            var rowCells = question.find(attributeClass);
            if (rowCells.length) {
                SSI_StandardizeHeight(rowCells, false);
                attributeNumber++;
            }
            else {
                attributeNumber = -1; //this will break the loop
            }
        }
        if (taskButtons.length) {
            SSI_StandardizeHeight(taskButtons, true);
        }
        if (responseCells.length) {
            SSI_StandardizeHeight(responseCells, false);
        }
        if (question.find('.shelf_display').length) {
            SetupShelves(question);
            FixButtonWidths(question, responseCells);
        }
    }
}

function SSI_IsMobile()
{
    return Modernizr.mq(MOBILE_MEDIA_QUERY);
}

function CloneAttColumn(question)
{
    var clone = null;
    var attColumn = question.find(".attribute_label_column").first();
    if (attColumn.length)
    {
        clone = attColumn.clone();
    }
    return clone;
}

function GetAttColumnIndecis(question)
{
    var indecis = [];
    var taskChildren = question.find('.cbc_task').children();
    taskChildren.each(function ()
    {
        var child = $(this);
        if (child.is('.attribute_label_column'))
        {
            indecis.push(child.index());
        }
    });
    return indecis;
}

function AdjustForCornerLabel(question)
{
    var adjustedConcepts = question.find('.adjusted_for_corner_label');
    if (adjustedConcepts.length)
    {
        adjustedConcepts.removeStyle('margin-top');
    }
    if (!SSI_IsMobile() || question.find('.no_mobile').length)
    {
        var topCornerCell = question.find('.top_corner_label').first();
        var cornerHeight = $(topCornerCell).outerHeight();
        var concepts = question.find('.cbc_concept');
        concepts.each(function ()
        {
            var conceptmargin = parseInt($(this).css('margin-top'));
            var newMargin = (cornerHeight + conceptmargin); //cornerHeight; //(cornerHeight + conceptmargin);
            $(this).addClass('adjusted_for_corner_label');
            $(this).css('margin-top', newMargin);
        });
    }
}

function SetupShelves(question)
{
    //move the shelves to the right positions
    var task = question.find('.cbc_task');
    var shelfItems = question.find('.cbc_concept .att_1');
    var conceptHeight = question.find('.cbc_concept').first().height();
    var shelfFrontHeight = 0;
    var currentShelfPosition = 0;
    var currentShelfNumber = 0;
    var shelfwidth = task.width();
    var shelfLeftPosition = task.offset().left;
    var shelfTopWidth = shelfwidth - 50;
    var currentShelf = null;
    var currentShelfFront = null;
    var currentShelfTop = null;
    shelfItems.each(function() {
        var shelfItem = $(this);
        var itemHeight = shelfItem.innerHeight();
        var itemShelfPosition = shelfItem.offset().top + itemHeight - 15; //-15 so the the image sits in the middle of the shelf top
        if (itemShelfPosition != currentShelfPosition) {
            //we have found a new shelf
            currentShelfNumber++;
            currentShelfPosition = itemShelfPosition;
            currentShelf = question.find('#shelf_' + currentShelfNumber);
            currentShelfFront = currentShelf.find('.shelf_edge');
            currentShelfTop = currentShelf.find('.shelf_top');
            shelfFrontHeight = conceptHeight - itemHeight; //the item sits on top of the shelf, everything else goes on the shelf front
            currentShelf.offset({
                top: currentShelfPosition,
                left: shelfLeftPosition
            });
            currentShelf.width(shelfwidth);
            currentShelfTop.width(shelfTopWidth);
            currentShelfFront.height(shelfFrontHeight);
        }
    });
}

function RestoreCBC(question, concepts)
{
    concepts.each(function (conceptIndex)
    {
        var concept = $(this);
        var input = concept.find('input');

        if (concept.is('.dual_response_none'))
        {
            input.each(function ()
            {
                if ($(this).is(':checked'))
                {
                    $(this).closest('.dual_response_none_button').addClass('selected');
                }
            });
        }
        else if(concept.is('.discrete'))
        {
            if(input.is(':checked'))
            {
                SSI_SetBestConcept(question, conceptIndex);
                SSI_SetBestResponseDot(question, conceptIndex);
            }
        }
        else if (concept.is('.best_worst'))
        {
            var bestInput = concept.find('.best_button input');
            if (bestInput.is(':checked'))
            {
                SSI_SetBestConcept(question, conceptIndex);
                SSI_SetBestResponseDot(question, conceptIndex);
            }
            var worstInput = concept.find('.worst_button input');
            if (worstInput.is(':checked'))
            {
                SSI_SetWorstConcept(question, conceptIndex);
                SSI_SetWorstResponseDot(question, conceptIndex);
            }
        }
    })
}

function initializeCBC(question)
{
    //the margin of HTML element is for sticky navs in preview mode
    var HtmlMargin = parseInt($('html').css('margin-top'));
    var task = question.find('.cbc_task');
    var taskNav = question.find('.task_nav');
    var vertTask = question.find('.mobile_vertical .cbc_task');
    var taskControls = question.find('.task_controls');
    var taskDots = taskNav.find('.task_nav_dots');
    var horizTask = question.find('.mobile_horizontal .cbc_task');
    var concepts = question.find('.cbc_concept');
    var totalBox = question.find('.cbc_totals_box');
    var carousel = null;
    var attColumn = null;
    var attColumnIndecis = [];

    RestoreCBC(question, concepts);

    question.find('.task_select_button').on('click', function (event)
    {
        var clickedButton = $(this);
        var concept = clickedButton.closest('.cbc_concept');
        var conceptIndex = question.find('.cbc_concept').index(concept);
        var inputID = clickedButton.find('input').attr('id');
        var selected = true;

        if (clickedButton.is('.best_button'))
        {
            if (concept.length)
            {
                if (concept.is('.best'))
                {
                    SSI_ClearBestConcept(question);
                    selected = false;
                }
                else
                {
                    SSI_SetBestConcept(question, conceptIndex);
                }
            }
            else
            {
                //this means it was a custom position none selection
                var noneDiv = clickedButton.closest('.custom_position_none');
                if (noneDiv.is('.best'))
                {
                    SSI_ClearBestConcept(question);
                    selected = false;
                }
                else
                {
                    SSI_ClearBestConcept(question);
                    if (noneDiv.is('.worst'))
                    {
                        SSI_ClearWorstConcept(question);
                    }
                    noneDiv.addClass('best');
                }
            }
        }
        else
        {
            if (concept.length)
            {
                if (concept.is('.worst'))
                {
                    SSI_ClearWorstConcept(question);
                    selected = false;
                }
                else
                {
                    SSI_SetWorstConcept(question, conceptIndex);
                }
            }
            else
            {
                //this means it was a custom position none selection
                var noneDiv = clickedButton.closest('.custom_position_none');
                if (noneDiv.is('.worst'))
                {
                    SSI_ClearWorstConcept(question);
                    selected = false;
                }
                else
                {
                    SSI_ClearWorstConcept(question);
                    if (noneDiv.is('.best'))
                    {
                        SSI_ClearBestConcept(question);
                    }
                    noneDiv.addClass('worst');
                }
            }
        }
        SSI_SetSelect(inputID, selected);
    });

    question.find('.task_select_button, .dual_response_none_button').on('keyup', function (event)
    {
        switch (event.keyCode)
        {
            // Enter
            case 13:
                SSI_SubmitMe(false);
                break;

            // Space
            case 32:
                $(this).trigger('click');
                break;
        }
    });

    question.find('.dual_response_none_button').on('click', function ()
    {
        var clickedButton = $(this);
        var inputID = clickedButton.find('input').attr('id');
        var selected = true;
        var selectedButton = question.find('.dual_response_none_button.selected');

        if (clickedButton.is('.selected'))
        {
            selected = false;
        }

        SSI_SetSelect(inputID, selected);
        if (selectedButton.length)
        {
            selectedButton.removeClass('selected');
        }

        if (selected)
        {
            clickedButton.addClass('selected');
        }
    });
    $(window).on('resize', function ()
    {
        SSI_StandardizeTaskRowHeights(question);
    });
    if (vertTask.length)
    {
        taskDots.find('.nav_dot').on('click', function ()
        {
            var dot = $(this);
            var conceptIndex = dot.index();
            var concept = vertTask.find(getConceptClassString(conceptIndex));
            SSI_SetScrollPosition(concept.offset().top);
        });
        $(window).on('resize', function() {
            if (SSI_IsMobile()) {
                HandleVerticalCBCScroll();
            }
            else if(totalBox.length && totalBox.is('.fixed_total'))
            {
                totalBox.removeStyle('bottom');
                totalBox.removeClass('fixed_total');
            }
        });
        HandleVerticalCBCScroll();
    }
    else if (horizTask.length)
    {
        attColumnIndecis = GetAttColumnIndecis(question);
        if (attColumnIndecis.length)
        {
            attColumn = CloneAttColumn(question);
        }
        //monitor the screensize
        $(window).on('resize', CarouselScreenCheck);
        CarouselScreenCheck();
    }
    $(window).scroll(function ()
    {
        if (SSI_IsMobile() && taskNav.length)
        {
            if (vertTask.length)
            {
                HandleVerticalCBCScroll();
            }
            else if (horizTask.length)
            {
                HandleHorizontalCBCScroll();
            }
        }
    });

    function StickyTotalCheck(scrolltop, firstConcept)
    {
        if (totalBox.length && SSI_IsMobile())
        {
            var windowHeight = $(window).outerHeight();
            var scrollBottom = scrolltop + windowHeight;
            var totalBoxTop = totalBox.offset().top;
            var totalBoxHeight = totalBox.outerHeight();
            var bottomLimit = task.offset().top + task.height(); //the top of the totals box should go right below this point
            var fixedStartingPoint = firstConcept.offset().top + ACTIVE_TASK_BUFFER;

            if (totalBox.is('.fixed_total'))
            {
                //take out the height of the totals box from the widow height becasue it's stuck to the bottom
                windowHeight -= totalBoxHeight;
                scrollBottom -= totalBoxHeight;

                if ((bottomLimit <= scrollBottom) || (fixedStartingPoint > (scrollBottom + totalBoxHeight)))
                {
                    totalBox.removeStyle('bottom');
                    totalBox.removeStyle('left');
                    totalBox.removeClass('fixed_total');
                }
            }
            else if((bottomLimit > (scrollBottom - totalBoxHeight)) && (fixedStartingPoint < scrollBottom))
            {
                //turn on the sticky total
                totalBox.addClass('fixed_total');
                totalBox.css({
                    bottom: 0,
                    left: 0
                });
            }
        }
    }

    function StickyNavCheck(taskOffset, scrollTop, navXOffset, navYOffset)
    {
        var currentNavX = taskNav.offset().left;
        var currentNavY = taskNav.offset().top;
        if (!taskNav.is('.fixed_nav') && taskOffset < scrollTop)
        {
            taskNav.addClass('fixed_nav');
        }
        if (taskNav.is('.fixed_nav'))
        {
            if (navXOffset >= 0 && navXOffset != currentNavX)
            {
                taskNav.css({
                    left: navXOffset + "px"
                });
            }
            if (navYOffset >= 0 && navYOffset != currentNavY)
            {
                taskNav.css({
                    top: navYOffset + "px"
                });
            }
        }
        if (taskNav.is('.fixed_nav') && taskOffset >= scrollTop)
        {
            taskNav.removeClass('fixed_nav');
        }
    }

    function HandleHorizontalCBCScroll()
    {
        var scrollTop = SSI_ScrollTop();
        var navHeight = $(taskNav).height();
        var taskOffset = $(taskControls).offset().top;
        var controlsHeight = $(taskControls).height();
        var bottomStickyBoundary = question.find('.cbc_response_cell').first().offset().top - navHeight;

        StickyNavCheck(taskOffset, scrollTop, -1, -1);
        if (taskNav.is('.fixed_nav'))
        {
            $(taskNav).width(SSI_ScreenWidth());
            $(taskControls).height(controlsHeight);
        }
        else
        {
            $(taskNav).removeStyle('width');
            $(taskControls).removeStyle('height');
        }
        //check to see if we've reached the bottom boundary
        if ((bottomStickyBoundary - navHeight) <= scrollTop)
        {
            taskNav.addClass('absolute_nav');
            taskNav.offset({
                top: (bottomStickyBoundary - navHeight)
            });
        }
        else if (taskNav.is('.absolute_nav'))
        {
            taskNav.removeClass('absolute_nav');
            taskNav.removeStyle('top');
        }
    }

    function HandleVerticalCBCScroll()
    {
        var scrollTop = SSI_ScrollTop();
        var taskTopMargin = parseInt(task.css('margin-top'));
        var navBottomMargin = parseInt(taskNav.css('margin-bottom'));
        var navDotsHeight = $(taskDots).height();
        var taskOffset = $(vertTask).offset().top - taskTopMargin;
        var navBottomBoundary = taskOffset + $(vertTask).height() - navDotsHeight - navBottomMargin;
        var navXOffset = $(taskControls).offset().left;
        var testModeElem = $('html.test_mode');

        if (testModeElem.length)
        {
            taskTopMargin += parseInt(testModeElem.css('margin-top'));
        }

        StickyNavCheck(taskOffset, scrollTop, navXOffset, taskTopMargin);
        StickyTotalCheck(scrollTop, concepts.first());
        //check to see if we've scrolled far enough to update the active nav_dot
        if (taskNav.is('.fixed_nav') && concepts.length)
        {
            var oldActiveIndex = $('.nav_dot.active').index();
            var newActiveIndex = oldActiveIndex;
            concepts.each(function ()
            {
                var concept = $(this);
                var conceptOffset = concept.offset().top - taskTopMargin - ACTIVE_TASK_BUFFER;
                if (conceptOffset <= scrollTop)
                {
                    newActiveIndex = concepts.index(concept);
                }
                else
                {
                    return false;
                }
            });
            if (newActiveIndex != oldActiveIndex)
            {
                SSI_SetActiveNavDot(question, newActiveIndex);
            }
        }
        if (scrollTop < question.find('.cbc_task').offset().top) {
            SSI_SetActiveNavDot(question, 0);
        }
        //check to see if the task has scolled off the page
        if (taskNav.is('.fixed_nav') && navBottomBoundary <= scrollTop) {
            taskNav.removeClass('fixed_nav');
            taskControls.addClass('flex_end');
        }
        else if (taskControls.is('.flex_end'))
        {
            taskControls.removeClass('flex_end');
        }
    }

    function CarouselScreenCheck()
    {
        var screenWidth = SSI_ScreenWidth();
        if (SSI_IsMobile())
        {
            //remove any attribute label columns
            $('.attribute_label_column').remove();
            carousel = SSI_InitializeCarousel(question, carousel);
            var bestConcept = question.find('.cbc_concept.best');
            var worstConcept = question.find('.cbc_concept.worst');
            var activeIndex =  question.find('.owl-item').index(question.find('.owl-item.active.center'));
            if (bestConcept.length)
            {
                var bestIndex = concepts.index(bestConcept);
                SSI_SetBestResponseDot(question, bestIndex);
            }
            if (worstConcept.length)
            {
                var worstIndex = concepts.index(worstConcept);
                SSI_SetWorstResponseDot(question, worstIndex);
            }
            if (taskNav.is('.fixed_nav') || taskNav.is('.absolute_nav'))
            {
                taskNav.width(screenWidth);
            }
            SSI_SetActiveNavDot(question,activeIndex);
        }
        else if (carousel)
        {
            carousel = SSI_DestroyCarousel(question, carousel);
            //add back in the attribute label columns
            if (attColumnIndecis.length)
            {
                attColumnIndecis.forEach(function (index)
                {
                    if (index === 0)
                    {
                        task.prepend(attColumn.clone());
                    }
                    else
                    {
                        task.children().eq(index).before(attColumn.clone().addClass('extra_concept_row'));
                    }
                });
            }
            SSI_StandardizeTaskRowHeights(question);
        }
    }
    if (horizTask.length && SSI_IsMobile())
    {
        //this is handled by the carousel initialization event itself
    }
    else
    {
        SSI_StandardizeTaskRowHeights(question);
        var hiddenTask = question.find('.hide_for_processing');
        if (hiddenTask.length)
        {
            hiddenTask.removeClass('hide_for_processing');
        }
    }
}

// Keyboard focus indicator for low-visibility users
$(document).on('keydown', function(){
    $('body').addClass('using-keyboard');
}).on('click', function(){
    $('body').removeClass('using-keyboard');
});