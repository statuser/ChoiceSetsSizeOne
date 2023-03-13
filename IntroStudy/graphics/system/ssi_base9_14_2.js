/*
SSI Web - Web Surveying System
Copyright Sawtooth Software, Inc. All rights reserved.
Orem, UT  USA  801-477-4700 
*/

function CreateBarChart(id_name, data_input, settings)
{
    if (settings == null)
    {
        settings = {};
    }

	nv.addGraph(function() 
	{
		var bar_chart = nv.models.discreteBarChart()
			.x(function(d) { return d.label })    //Specify the data accessors.
			.y(function(d) { return d.value })
			// .staggerLabels(true)    //Too many bars and not enough room? Try staggering labels.
			.showValues(true)       //...instead, show the bar value right on top of each bar.

			;

		if (settings.min_yAxis_value)
		{
		    bar_chart.forceY([0, settings.min_yAxis_value]);

		}
		
        //Set to integer
		bar_chart.valueFormat(function (d) { return d});
		bar_chart.yAxis.tickFormat(function (d) { return d});

		if (settings.percent)
		{
		    bar_chart.valueFormat(function (d) { return d + "%" });

		    bar_chart.yAxis.tickFormat(function (d) { return d + "%" });

		    bar_chart.yAxis.tickValues([0, 25, 50, 75, 100]);
		}

		data =
        [
		    {
		        key: "",
		        values: data_input
		    }
        ];

		d3.select("#" + id_name + " svg")
			.datum(data)
			.call(bar_chart);

		nv.utils.windowResize(bar_chart.update);

		return bar_chart;
	});
}

function CreateMultiBarChart(id_name, data_input, settings)
{
    if (settings == null)
    {
        settings = {};
    }

    nv.addGraph(function ()
    {
        var bar_chart = nv.models.multiBarChart()
            .showControls(false) //Control for toggle grouped vs stacked
			//// .staggerLabels(true)    //Too many bars and not enough room? Try staggering labels.
        //.showLegend(false)
        ;

        if (settings.scale_100)
        {
            bar_chart.forceY([0, 100]);
        }

        if (settings.percent)
        {
            bar_chart.yAxis.tickFormat(function (d) { return d + "%" });
        }

        data = ChangeFromLabelValue(data_input);

        d3.select("#" + id_name + " svg")
			.datum(data)
			.call(bar_chart);

        nv.utils.windowResize(bar_chart.update);

        return bar_chart;
    });
}

function CreatePieChart(id_name, data_input, settings)
{
    if (settings == null)
    {
        settings = {};
    }

	nv.addGraph(function() 
	{
		var pie_chart = nv.models.pieChart()
			.x(function(d) { return d.label })
			.y(function(d) { return d.value })
			.showLabels(true)
			.labelsOutside(true)
			.showLegend(false);

		pie_chart.valueFormat(function (d) { return d;});

		if (settings.percent)
		{
		    pie_chart.valueFormat(function (d) { return d + "%" });
		}

		d3.select("#" + id_name + " svg")
			.datum(data_input)
			.transition().duration(1200)
			.call(pie_chart);

		nv.utils.windowResize(pie_chart.update);

		return pie_chart;
	});    
}

//This function changes the data input from "label" "value" pairs to "x" "y" pairs for the multibar chart.
function ChangeFromLabelValue(data)
{
    jQuery.each(data, function (index, item)
    {
        var values = item.values;
        jQuery.each(values, function (data_index, data_item)
        {
            data_item.x = data_item.label;
            data_item.y = data_item.value;

            delete data_item.label;
            delete data_item.value;
        });
    });

    return data;
}

function SSI_ShowAlert(message, title, width, height, callback)
{
    $("#alert_dialog").dialog(
    {
        draggable: true,
        responsive: true,
        modal: true,
        width: 400,
        height: 300,
        buttons:
		[
			{
                text: "OK",
                class: "primary_button",
				id: "alert_ok_button",
				click: function ()
				{                    
					$(this).dialog("close");
				}
			}
        ],
        open: function()
        {
            ResetFocusOnDialogOpen();
        }
    });

    $("#alert_dialog").dialog({ "title": title });

    if (width)
    {
        $("#alert_dialog").dialog({ "width": width });
    }

    if (height)
    {
        $("#alert_dialog").dialog({ "height": height });
    }

    $("#alert_dialog").html(message);

    if (callback)
    {
        $("#alert_dialog").dialog({
            close: function (event, ui)
            {
                callback();
            }
        });
    }
    else
    {
        //Reset the close call back to do nothing (because might have been set above)
        $("#alert_dialog").dialog({
            close: function (event, ui) { }
        });
    }

    $("#alert_dialog").dialog("open");

    $("#alert_dialog").scrollTop("0");
}

function ResetFocusOnDialogOpen()
{
    document.activeElement.blur();
}