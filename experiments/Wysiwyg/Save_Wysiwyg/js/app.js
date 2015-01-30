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

        var objContent = [];

        // iterate by using for loop or jquery element.each
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
                width:width,
                height:height
            }

            if (element.hasClass("youTube")) {
                obj.type = "YOU_TUBE";
                obj.src = element.find(".content").attr("src");
            } else if (element.find(".content").hasClass("h1")) {
                obj.type = "H1";
            } else if (element.find(".content").hasClass("h2")) {
                obj.type = "H2";
            } else if (element.find(".content").hasClass("h3")) {
                obj.type = "H3";
            } else if (element.find(".content").hasClass("p")) {
                obj.type = "P";
            } else if (element.find(".content").hasClass("div")) {
                obj.type = "DIV";
            } else if (element.find(".content").hasClass("img")) {
                obj.type = "IMG";
            }
            // Convert the raw element to jquery element so we can use find
            objContent.push(obj);
        });

        // Convert the object content, store it and print it
        var objStr = JSON.stringify(objContent);

        console.log(objStr);

        localStorage.setItem("ide",objStr);
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
            .css("z-index", 0)
            .draggable({ grid: [10, 10] })
            .resizable({ grid: [10, 10],handles:"n,e,s,w,ne,se,sw,nw" })
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
        } else if (parentElement.hasClass("youTube")) {
            var url = prompt("Provide YouTube URL");
            //split the url
            if (url != "" && url != null) {
                var parts = url.split("/");
                console.log(parts);

                var part = parts[parts.length - 1];
                console.log(part);

                var src = "//www.youtube.com/embed/" + part;
                parentElement.find("iframe").attr("src", src);
            }
            
//            if (url != "" && url != null)
//                parentElement.find("iframe").attr("src", url);
        }
    }

    var htmlTemplates = {
        // The 'ide' class makes these element easier to be recoganized
        "H1": "<div class='ide h1'><h1 contenteditable='true' class='content'>Heading 1</h1></div>",
        "H2": "<div class=ide h2><h2 contenteditable='true' class='content'>Heading 2</h2></div>",
        "H3": "<div class=ide h3><h3 contenteditable='true' class='content'>Heading 3</h3></div>",
        // The contenteditable is an HTML5 attribute
        "P": "<div class='ide div'><p contenteditable='true' class='content'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p></div>",
        "DIV": "<div class='ide div'><div contenteditable='true' class='content'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </div></div>",
        "IMG": "<div class='ide img'><img class='content' width='100%' height='100%' src='http://img2.wikia.nocookie.net/__cb20090524204255/starwars/images/1/1a/R2d2.jpg'/></div>",
        "YOU_TUBE": '<div class="ide youTube" style="padding:10px"><iframe class="content" width="100%" height="100%" src="//www.youtube.com/embed/8ISgVguTI-M" frameborder="0" allowfullscreen></iframe></div>'
    };
});