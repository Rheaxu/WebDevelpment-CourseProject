$(function init() {
    function init() {
        console.log("Hello");
        $(".add-btn").click(addBtnHandler);
        $(".save-btn").click(saveBtnHandler);
        $(".load-btn").click(loadBtnHandler);
        $(".clear-btn").click(clearBtnHandler);
        $("#loadPageDialog").dialog({
            autoOpen: false,
            modal: true,
            resizable: false,
            buttons: {
                "Load": function () {
                $("#loadPageDialog")},
                "Cancel": function () { $("#loadPageDialog").dialog("close"); }
            },
            open:populatePageList
        });
    }

    function loadPage() {
        var objStr = localStorage.getItem("ide");
        if (objStr == null) return;
        var ide = JSON.parse(objStr);

        var pageName = $("#pageListSelector").val();
        console.log();
    }

    function populatePageList() {
        var objStr = localStorage.getItem("ide");
        console.log(objStr);
        if (objStr == null) return;
        var ide = JSON.parse(objStr);
        var pages = ide.pages();

        var pageListSelector = $("#pageListSelector");
        pageListSelector.empty();

        for (var p in pages) {
            console.log(p);
            var option = $()
        }
    }

    init();

    function clearBtnHandler() {
        localStorage.clear();
    }

    function renderObjectArray(contentArray) {

    }

    function loadBtnHandler() {
        var objStr = localStorage.getItem("ide");
        console.log(objStr);

        if (objStr != null) {
            var contentArray = JSON.parse(objStr);
            console.log(contentArray);
            for (var c in contentArray) {
                var obj = contentArray[c];
                var elementType = obj.type;
                var dom = addElementForType(elementType);
                dom.css({
                    top: obj.top,
                    left: obj.left,
                    width: obj.width,
                    height: obj.height
                });
            }

        }
    }


    function saveBtnHandler() {
        var elements = $(".ide");
        if (elements.length == 0) return;

        var pageName = prompt("Page Name");
        if (pageName == null || pageName == "") return;

        var objContent = [];

        elements.each(function (index, element) {
            element = $(element);
            var html = element.find(".content").html();

            var position = element.position();

            var top = position.top;
            var left = position.left;
            var width = element.outerWidth();
            var height = element.outerHeight();
            var type = null;

            
            obj = {
                html: html,
                top: top,
                left: left,
                width: width,
                height:height
            };


            if (element.hasClass("youTube")) {
                obj.type = "YOU_TUBE";
                obj.src = element.attr("src","asdasdfs");
            } else if (element.hasClass("img")) {
                obj.type = "IMG";
                obj.src = element.attr("src", "asdasdfs");
            }else if(element.hasClass("p")) {
                obj.type = "P";
            } else if (element.hasClass("h1")) {
                obj.type = "H1";
            } else if (element.hasClass("h2")) {
                obj.type = "H2";
            } else if (element.hasClass("h3")) {
                obj.type = "H3";
            } else if (element.hasClass("div")) {
                obj.type = "DIV";
                obj.src = element.find(".cotent").attr("src", "asdasdfs");
            }

            objContent.push(obj);
            console.log(html);

            
        });

        

        var ideString = localStorage.getItem("ide");

        console.log(ide)

        if (ide == null) {
            ide = {};
            ide.pages = {};
        }
        else{
            ide = JSON.parse(ide);
        }

        ide.pages[pageName] = objContent;

        var objStr = JSON.stringify(ide);
        console.log(objStr);

        localStorage.setItem("ide", objStr);
    }

    function addBtnHandler() {
        var elementType = $(".element-type").val();
        console.log("Adding " + elementType);
        addElementForType(elementType);
    }

    function addElementForType(type) {
        var html = htmlTemplates[elementType];
        var dom = $(html)
            .css({ position: "absolute", top: 100, left: 100 })
            .click(elementClickHandler)
        //.draggable({ grid: [10, 10] })
        //.resizable({ grid: [10, 10] });
        $("body").append(dom);
        return dom;
    }

    function elementClickHandler() {
        var element = $(this);
        unselectAllElements(element);
        selectElement(element);
    }

    function unselectAllElements(element) {
        if (element.hasClass("selected")) return;
        $(".selected").find(".delete-btn").remo
        $(".selected")
            .css("box-shadow", "0px 0px 0px #888888;")
            .draggable("destroy")
            .resizable("destroy")
            .removeClass("selected");

    }

    function selectElement(element) {

        console.log();

        if (element.hasClass("selected")) {
            return;
        }

        console.log("selecting Element");
        console.log(element);

        var deleteBtnHtml = "<button class='delete-btn btn btn-danger'>X</button>"
        var $deleteBtn = $(deleteBtnHtml).click(deleteBtnHandler);

        var editBtnHtml = "<button class='edit-btn btn btn-warning'>-</button>"
        var $editBtn = $(editBtnHtml).click(editBtnHandler);

        element
            .addClass("selected")
            .css("box-shadow", "0px 0px 5px #888888;")
            .draggable({ grid: [10, 10] })
            .resizable({ grid: [10, 10] })
            .append($deleteBtn)
            .append($editBtn);
    }

    function deleteBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();
        parentElement.remove();

        console.log(parentElement);
        console.log(btn);
    }

    function editBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();

        console.log("Editing ");
        console.log(parentElement);

        if (parentElement.hasClass("img")) {
            console.log("This is an img");
            var url = prompt("Provide Image URL");
            console.log(url);
            parentElement.find("img").attr("src", url);
        }
    }

    var htmlTemplates = {
        "H1": "<div class='ide h1'><h1 contenteditable='true' class='content'>Heading 1</h1></div>",
        "H2": "<div class='ide h2'><h2 contenteditable='true' class='content'>Heading 2</h2></div>",
        "H3": "<div class='ide h3'><h3 contenteditable='true' class='ide'>Heading 3</h3></div>",
        "P": "<div class='ide p'><p class='ide'>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p></div>",
        "DIV": "<div class='ide div'><div class='ide'>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div></div>",
        "IMG": "<div class='ide img'><img width='100%' height='100%' src='http://starwars.wikia.com/wiki/R2-D2?file=R2parts_CVD.jpg'/></div>",
        "YOU_TUBE": '<div class="ide youTube" style="padding:10px" ><ifram></ifram></div>'
    };
});