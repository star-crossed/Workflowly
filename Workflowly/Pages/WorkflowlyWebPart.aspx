<%@ Page Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<WebPartPages:AllowFraming ID="AllowFraming" runat="server" />

<html>
<head>
    <title></title>

    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>

    <script type="text/javascript">
        // Set the style of the client web part page to be consistent with the host web.
        (function () {
            'use strict';

            var hostUrl = '';
            if (document.URL.indexOf('?') != -1) {
                var params = document.URL.split('?')[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var p = decodeURIComponent(params[i]);
                    if (/^SPHostUrl=/i.test(p)) {
                        hostUrl = p.split('=')[1];
                        document.write('<link rel="stylesheet" href="' + hostUrl + '/_layouts/15/defaultcss.ashx" />');
                        break;
                    }
                }
            }
            if (hostUrl == '') {
                document.write('<link rel="stylesheet" href="/_layouts/15/1033/styles/themable/corev15.css" />');
            }
        })();
    </script>

    <script src="../blockly/blockly_compressed.js"></script>
    <script src="../blockly/blocks_compressed.js"></script>
    <script src="../blockly/msg/js/en.js"></script>

    <link rel="stylesheet" href="https://appsforoffice.microsoft.com/fabric/2.1.0/fabric.min.css">
    <link rel="stylesheet" href="https://appsforoffice.microsoft.com/fabric/2.1.0/fabric.components.min.css">
</head>
<body>
    <div class="ms-Grid"> 
        <div class="ms-Grid-row">
            <div id="blocklyArea" class="ms-Grid-col ms-u-sm12 ms-u-md12 ms-u-lg12" style="height:100%"></div>
        </div>
    </div>
    <div id="blocklyDiv" style="position: absolute"></div>
    <xml id="toolbox" style="display: none">
        <category name="Logic" colour="210">...</category>
        <category name="Loops" colour="120">...</category>
        <category name="Math" colour="230">...</category>
        <category name="Colour" colour="20">...</category>
        <category name="Variables" colour="330" custom="VARIABLE"></category>
        <category name="Functions" colour="290" custom="PROCEDURE"></category>
    </xml>
    <script>
        var blocklyArea = document.getElementById('blocklyArea');
        var blocklyDiv = document.getElementById('blocklyDiv');
        var workspace = Blockly.inject(blocklyDiv, {toolbox: document.getElementById('toolbox')});
        var onresize = function(e) {
            // Compute the absolute coordinates and dimensions of blocklyArea.
            var element = blocklyArea;
            var x = 0;
            var y = 0;
            do {
                x += element.offsetLeft;
                y += element.offsetTop;
                element = element.offsetParent;
            } while (element);
            // Position blocklyDiv over blocklyArea.
            blocklyDiv.style.left = x + 'px';
            blocklyDiv.style.top = y + 'px';
            blocklyDiv.style.width = blocklyArea.offsetWidth + 'px';
            blocklyDiv.style.height = blocklyArea.offsetHeight + 'px';
        };
        window.addEventListener('resize', onresize, false);
        onresize();
    </script>
</body>
</html>
