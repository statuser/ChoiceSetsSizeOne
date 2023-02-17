/*
Lighthouse Studio - Web Surveying System
Copyright Sawtooth Software, Inc. All rights reserved.
Orem, UT  USA  801-477-4700 
*/

(function ()
{
    window.TestMode = function () { };

    TestMode.global_url = "";
    TestMode.display_window = "";

    //Width by height (portrait)
    TestMode.sizes = [
        [320, 568], //iPhone 5
        [375, 667], //iPhone 6
        [414, 736], //iPhone 6 plus
        [768, 1024] //iPad
    ];

    GlobalDocumentReadyArray.push(function ()
    {
        SetDisplayWindow();
        
        LoadPage(false);

        $("#desktop_view").on("click", function ()
        {
            SetMode("desktop");
            SetDesktopView();
        });

        $("#mobile_view").on("click", function ()
        {
            SetMode("mobile");
            LoadPage(true);
        });

        $("#mobile_size").on("change", function ()
        {
            sessionStorage.mobile_size = $("#mobile_size").val();

            if ($("#rotate").hasClass("portrait"))
            {
                SetPortrait();
            }
            else
            {
                SetLandscape(false);
            }
        });

        $("#rotate").on("click", function ()
        {
            if ($("#rotate").hasClass("portrait"))
            {
                SetLandscape();
            }
            else
            {
                SetPortrait();
            }
        });

        $("#test_options_link, #close_test_options_link").on("click", function (event)
        {
            event.preventDefault();
            event.stopPropagation();

            if($("#test_options_dialog").hasClass("open"))
            {
                CloseOptionsDialog();
            }
            else
            {
                OpenOptionsDialog();
            }
        });

        $("#test_options_box").on("click", function (event)
        {
            event.stopPropagation();
        });

        $("#overlay, #test_mode_bar").on("click", function ()
        {
            CloseOptionsDialog();
        });

        $(".test_options_row input").on("click", function ()
        {
            SetTestOptions();
        });

        $("#skip_question_name").on("change", function ()
        {
            SetTestOptions();

            if ($("#skip_question_name").val())
            {
                TestMode.display_window.SSI_SubmitMe(true);
            }
        });

        $("#remove_skip_logic, #remove_randomization, #remove_terminate, #use_respnum").on("click", function ()
        {
            ShowTestPageSubmitMsg();
        });

        $("#test_respnum").on("keydown", function (event)
        {
            return RespNumCheckKeys(event);
        }).on("keyup", function(event)
        {
            var value = $(this).val();

            RespNumCheckValue(value);
        });
    });

    function SetDisplayWindow()
    {
        TestMode.display_window = window;
    }

    function LoadPage(mobile_click)
    {
        if (sessionStorage.mode == "mobile")
        {
            var mobile_size = sessionStorage.mobile_size;

            if (mobile_size)
            {
                $("#mobile_size").val(mobile_size);
            }

            var orientation = sessionStorage.orientation;
            if (orientation == "landscape")
            {
                SetLandscape();
            }
            else
            {
                SetPortrait();
            }
        }
        //Default
        else if (mobile_click)
        {
            SetPortrait();
        }
    }

    function SetDesktopView()
    {
        $("#mobile_view").removeClass("selected");
        $("#desktop_view").addClass("selected");

        $(".mobile_view_settings").hide();

        $("#display").removeClass("mobile_display");
        $("#display").css("width", "100%");
        $(".iframe_container").css("height", "100%");

        LoadDesktopWindow();
    }

    function SetMobileView(width)
    {
        $("#mobile_display").show();
        $("#desktop_view").removeClass("selected");
        $("#mobile_view").addClass("selected");
        $(".mobile_view_settings").show();
        $(".page").hide(); //Hide parent page
        $("html").addClass("test_mode_shell"); //This allows us to set CSS for container of iframe.  Will get overwritten when desktop view loads.

        LoadMobileFrame(width);
    }

    function SetMode(mode)
    {
        sessionStorage.mode = mode;
    }

    function ShowTestPageSubmitMsg()
    {
        if ($("#remove_skip_logic")[0].checked
            || $("#remove_randomization")[0].checked
            || $("#remove_terminate")[0].checked
            || $("#use_respnum")[0].checked)
        {
            TestMode.display_window.ShowTestPageSubmitMsg();
        }
        else
        {
            TestMode.display_window.HideTestPageSubmitMsg();
        }
    }

    function SetTestOptions()
    {
        var skip_to_quest = $("#skip_question_name").val();
        var show_quest_names = 0;
        var show_var_names = 0;
        var remove_skip_logic = 0;
        var remove_randomization = 0;
        var remove_terminate = 0;
        var resp_num = 0;

        if(IsChecked("show_quest_names"))
        {
            show_quest_names = 1;
            TestMode.display_window.ShowTestQuestionNames();
        }
        else
        {
            TestMode.display_window.HideTestQuestionNames();
        }

        if (IsChecked("show_var_names"))
        {
            show_var_names = 1;
            TestMode.display_window.ShowTestVars();
        }
        else
        {
            TestMode.display_window.HideTestVars();
        }

        if (IsChecked("remove_skip_logic"))
        {
            remove_skip_logic = 1;
        }

        if (IsChecked("remove_randomization"))
        {
            remove_randomization = 1;
        }

        if (IsChecked("remove_terminate"))
        {
            remove_terminate = 1;
        }

		//use_respnum is not available in Discover
        if (IsChecked("use_respnum"))
        {
            var entered_value = $("#test_respnum").val();

            if (entered_value.match(/^\d+$/))
            {
                resp_num = entered_value
            }
        }

        var test_mode_settings = skip_to_quest + "," + show_quest_names + "," + show_var_names + "," + remove_skip_logic + "," + remove_randomization + "," + remove_terminate + "," + resp_num;

        TestMode.display_window.SetTestModeSettings(test_mode_settings);
    }

	function IsChecked(check_name)
	{
		var is_checked = false;

		if($("#" + check_name).length && $("#" + check_name)[0].checked)
		{
			is_checked = true;
		}

		return is_checked;
	}

    function OpenOptionsDialog()
    {
        var box = $("#test_options_dialog");

        box.addClass("open");
        $("#overlay").show();
        box.show();
    }

    function CloseOptionsDialog()
    {
        var box = $("#test_options_dialog");

        box.removeClass("open");
        $("#overlay").hide();
        box.hide();
    }

    function SetPortrait()
    {
        var selected_size = $("#mobile_size").val();

        var width = TestMode.sizes[selected_size - 1][0];
        var height = TestMode.sizes[selected_size - 1][1];

        SetDisplaySize(width, height);

        $("#size_display").html(width + " x " + height);

        var rotate_obj = $("#rotate");

        rotate_obj.removeClass("landscape");
        rotate_obj.addClass("portrait");

        sessionStorage.orientation = "portrait";

        SetMobileView(width);
    }

    function SetLandscape()
    {
        var selected_size = $("#mobile_size").val();

        //Switch width and height from sizes array
        var height = TestMode.sizes[selected_size - 1][0];
        var width = TestMode.sizes[selected_size - 1][1];

        SetDisplaySize(width, height);

        $("#size_display").html(width + " x " + height);

        var rotate_obj = $("#rotate");

        rotate_obj.removeClass("portrait");
        rotate_obj.addClass("landscape");

        sessionStorage.orientation = "landscape";

        SetMobileView(width);
    }

    function SetDisplaySize(width, height)
    {
        $("#mobile_display").css("width", width);

        $("#mobile_display .iframe_container").css("height", height);
    }

    function GetURL(mobile, width)
    {
        var url = "";
        var params_array = [];
        var url_restore = false;

        if (sessionStorage.iframe_url)
        {
            url = sessionStorage.iframe_url;
        }
        else
        {
            url = window.location.href;
        }

        var s_value = "";
        var regex = new RegExp("hid_s=(.*?)(&|$)", "i");
        var match_array = regex.exec(url);

        if (match_array && match_array.length)
        {
            s_value = match_array[1];
        }

        if (s_value == "")
        {
            var hid_s = TestMode.display_window.document.mainform["hid_s"];

            if (hid_s)
            {
                s_value = hid_s.value;
                params_array.push("hid_s=" + s_value);
                url_restore = true;
            }
        }
        else
        {
            url_restore = true;
        }

        if(url_restore)
        {
            //Remove if already there
            url = url.replace(/&hid_url_restore=\d+/i, "");
            
            params_array.push("hid_url_restore=1");
        }

        url = url.replace(/&hid_test_frame=\d+/i, "");

        if (mobile)
        {
            //Seems like IE 11 needs a link different than parent to work
            params_array.push("hid_test_frame=1");
        }

        //Put in new screen width
        url = url.replace(/&hid_screenwidth=\d+/i, "");
        params_array.push("hid_screenwidth=" + width);

        var test_mode_settings = "";
        var test_mode_input = TestMode.display_window.document.mainform["hid_test_mode_settings"];

        if (test_mode_input)
        {
            test_mode_settings = test_mode_input.value;

            if (test_mode_settings)
            {
                //This gets involved because these settings are hard to parse
                regex = new RegExp("(&hid_test_mode_settings=.*?)(&|$)", "i");
                match_array = regex.exec(url);

                if (match_array && match_array.length && match_array[1])
                {
                    url = url.replace(match_array[1], "");
                }

                params_array.push("hid_test_mode_settings=" + test_mode_settings);
            }
        }

        var test_db = TestMode.display_window.document.mainform["hid_test_db"];

        if (test_db && url.indexOf("&hid_test_db") < 0)
        {
            params_array.push("hid_test_db=1");
        }

        var preview = TestMode.display_window.document.mainform["hid_preview"];

        if (preview && url.indexOf("&hid_preview") < 0)
        {
            params_array.push("hid_preview=" + preview.value);
        }

        if (params_array.length)
        {
            if (url.indexOf("?") < 0)
            {
                url += "?";
            }
            else
            {
                url += "&";
            }

            url += params_array.join("&");
        }

        return url;
    }

    function LoadMobileFrame(width)
    {
        var url = GetURL(true, width);

        $("#display_iframe").attr("src", url);

        TestMode.display_window = $("#display_iframe")[0].contentWindow;
    }

    function LoadDesktopWindow(url)
    {
        var width = $(window).width();
        var url = GetURL(false, width);

        sessionStorage.iframe_url = "";

        window.location = url;
    }

    function GetContainerWidth()
    {
        return $(window).width();
    }

    TestMode.ResetSkipTo = function ResetSkipTo()
    {
        $("#skip_question_name").val("");
    }

    TestMode.StartPageSkip = function StartPageSkip()
    {
        if ($("#skip_question_name").val())
        {
            TestMode.display_window.SSI_SubmitMe(true);
        }
    }

    TestMode.ShowRespNumRow = function ShowRespNumRow()
    {
        var respnum_row = $("#respnum_row");

        if (respnum_row.length)
        {
            $("#respnum_row").show();
        }
    }

    TestMode.HideRespNumRow = function HideRespNumRow()
    {
        var respnum_row = $("#respnum_row");

        if (respnum_row.length)
        {
            $("#respnum_row").hide();
        }
    }

    //Make sure they only enter numbers for the Internal Respondent Number
    function RespNumCheckKeys(event)
    {
        var key_code = GetKeyCode(event);

        //Backspace, initial numbers, and key pad numbers allowed
        if (key_code == 8 || (key_code >= 48 && key_code <= 57) || (key_code >= 96 && key_code <= 105))
        {
            return true;
        }
        else
        {
            event.preventDefault();
            return false;
        }
    }

    function RespNumCheckValue(value)
    {
        var checkbox = $("#use_respnum")[0];

        if(value)
        {
            checkbox.checked = true;
            SetTestOptions();
        }
        else
        {
            checkbox.checked = false;
            SetTestOptions();
        }
    }

    function GetKeyCode(event)
    {
        var key_code = event.which || event.keyCode || event.charCode;

        return key_code;
    }

})();