import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

// Also add id="app_container" to web/index.html body tag
//
//
//<!DOCTYPE html>
//<html>
//<head>
//<meta charset="UTF-8">
//<title>onatcipli_github_io</title>
//</head>
//<body id="app_container">
//<script src="main.dart.js" type="application/javascript"></script>
//</body>
//</html>
//

class HoverDetector extends MouseRegion {
  // get a reference to the body element that we previously altered
  static final appContainer =
      html.window.document.getElementById('app_container');

  HoverDetector({Widget child, void onHover(), void onExit()})
      : super(
            onHover: (PointerHoverEvent evt) {
              appContainer.style.cursor = 'pointer';
              onHover();
              // you can use any of these:
              // 'help', 'wait', 'move', 'crosshair', 'text' or 'pointer'
              // more options/details here: http://www.javascripter.net/faq/stylesc.htm
            },
            onExit: (PointerExitEvent evt) {
              onExit();
              // set cursor's style 'default' to return it to the original state
              appContainer.style.cursor = 'default';
            },
            child: child);
}
