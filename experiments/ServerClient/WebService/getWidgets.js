$(function () {
    $(".getById").click(getByIdHandler);
    $(".getAllWidgetsBtn").click(getAllWidgetsBtnHandler)
});

function getAllWidgetsBtnHandler() {
    getAllWidgets(renderAllWidgets);
}

function renderAllWidgets(widgets) {
    console.log(widgets);
    var ul = $(".allWidgets");
    for (var w in widgets) {
        var widget = widgets[w];
        var li = $("<li>").append(widget.id);
        ul.append(li);
    }
}

function getByIdHandler() {
    var id = $(".id").val();
    getWidgetById(id, renderWidget);
}

function renderWidget(widget) {
    $(".widget-id").html(widget.id);
    $(".widget-html").html(widget.html);
    $(".widget-top").html(widget.top);
}

function getAllWidgets(callback) {
    $.ajax({
        url: "../../../WidgetsService.asmx/getAllWidgets",
        contentType: "application/json",
        success: function (response) {
            if (typeof callback == "function") {
                callback(response.d);
            }
            // Data for widget is in response.d
            // d is the wrapper contains the widget
        }
    });
}

function getWidgetById(id, callback) {
    // ajax allows us to do asycrhonize java, xml, queries
    // We use post we we are sending data           
    $.ajax({
        url: "../../../WidgetsService.asmx/getWidgetById",
        contentType: "application/json",
        data: { id: id },
        success: function (response) {
            callback(response.d);
        }
    });
}

function getSomeWidget() {
    $.ajax({
        url: "../../../WidgetsService.asmx/getSomeWidget",
        contentType: "application/json",
        success: function (response) {
            console.log(response.d);
        }
    });
}