$(function () {
    function init()
    {
        $(".add-btn").click(addBtnHandler);
        $(".save-btn").click(saveBtnHandler);
        $(".load-btn").click(openBtnHandler);
        $("#loadDialog").dialog({
            autoOpen:false,
            resizable: false,
            modal: true,
            open: loadSavedPages,
            buttons: {
                "Load": function () {
                    var selectedPage = $("#list-of-saved-pages").val();
                    loadPage(selectedPage);
                    console.log(selectedPage);
                    $(this).dialog("close");
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    init();

    function loadPage(pageName) {
        var ide = localStorage.getItem("ide");
        ide = JSON.parse(ide);
        console.log(ide);
        if (typeof ide == "undefined" || ide == null) {
            return;
        }
        var pages = ide.pages;
        for (var p in pages) {
            if (p == pageName) {
                pageContent = pages[p];
                $(".ide").remove();
                console.log(pageContent);
            }
        }
    }

    function loadSavedPages() {
        var ide = localStorage.getItem("ide");
        ide = JSON.parse(ide);
        console.log(ide);
        if (typeof ide == "undefined" || ide == null) {
            return;
        }
        var pages = ide.pages;
        var select = $("#list-of-saved-pages");
        select.empty();
        for (var p in pages) {
            var option = $("<option>");
            option.append(p);
            select.append(option);
        }
    }

    function openBtnHandler()
    {
        $("#loadDialog").dialog("open");
    }
    function saveBtnHandler() {
        var elements = $(".ide");
        console.log(elements);
    }

    function addBtnHandler()
    {
        var elementType = $(".element-type").val();
        console.log("Adding Element " + elementType);
        var html = htmlTemplates[elementType];
        var dom = $(html)
            .css({ position: "absolute", top: 100, left: 100, width: 200, height: 100 })
            .click(elementClickHandler);
        $("body").append(dom);
    }

    function elementClickHandler() {
        var element = $(this);      // Grab the element we click
        unselectAllElements(element);
        selectElement(element);
    }

    function unselectAllElements(element) {
        //if (element.hasClass("selected"))
          //  return;

        $(".selected").find(".delete-btn").remove();
        $(".selected").find(".edit-btn").remove();

        $(".selected")
            .css("box-shadow", "0px 0px 0px #888888")
            .draggable("destroy")
            .resizable("destroy")
            .removeClass("selected");
    }

    function selectElement(element) {
        if (element.hasClass("selected"))
            return;

        var deleteBtnHtml = "<button class='delete-btn btn btn-danger'>X</button>";
        var $deleteBtn = $(deleteBtnHtml).click(deleteBtnHandler);

        var editBtnHtml = "<button class='edit-btn btn btn-alert'>...</button>";
        var $editBtn = $(editBtnHtml).click(editBtnHandler);

        element
            .addClass("selected")
            .css("box-shadow", "0px 0px 5px #888888")
            .draggable({ grid: [10, 10] })
            .resizable({ grid: [10, 10] })
            .append($deleteBtn)
            .append($editBtn);
    }

    function deleteBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();   // The parent element should be removed, not just the btn
        parentElement.remove();
    }

    function editBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();
        console.log("Editing");
        console.log(parentElement);
        if (parentElement.hasClass("img")) {
            var url = prompt("Provide Image URL");
            console.log("The url is:" + url);
            if (url != null && url != "") {
                parentElement.find("img").attr("src", url);
            }
            
        }
    }

    var htmlTemplates = {
        // The 'ide' class makes these element easier to be recoganized
        "H1": "<h1 class='ide h1'>Heading 1</h1>",
        "H2": "<h2 class=ide h2>Heading 2</h2>",
        "H3": "<h3 class=ide h3>Heading 3</h3>",
        // The contenteditable is an HTML5 attribute
        "P": "<p contenteditable='true' class='ide div'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>",
        "DIV": "<div contenteditable='true' class='ide div'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </div>",
        "IMG": "<div class='ide img'><img width='100%' height='100%' src='http://img2.wikia.nocookie.net/__cb20090524204255/starwars/images/1/1a/R2d2.jpg'/></div>"
    };
});