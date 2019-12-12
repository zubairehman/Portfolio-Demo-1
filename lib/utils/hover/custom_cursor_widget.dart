import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:universal_html/html.dart' as html;

class CustomCursor extends MouseRegion {
  static final appContainer =
  html.window.document.getElementById('app-container');

  // cursor types from http://www.javascripter.net/faq/stylesc.htm
  static final String pointer = 'pointer';
  static final String auto = 'auto';
  static final String move = 'move';
  static final String noDrop = 'no-drop';
  static final String colResize = 'col-resize';
  static final String allScroll = 'all-scroll';
  static final String notAllowed = 'not-allowed';
  static final String rowResize = 'row-resize';
  static final String crosshair = 'crosshair';
  static final String progress = 'progress';
  static final String eResize = 'e-resize';
  static final String neResize = 'ne-resize';
  static final String text = 'text';
  static final String nResize = 'n-resize';
  static final String nwResize = 'nw-resize';
  static final String help = 'help';
  static final String verticalText = 'vertical-text';
  static final String sResize = 's-resize';
  static final String seResize = 'se-resize';
  static final String inherit = 'inherit';
  static final String wait = 'wait';
  static final String wResize = 'w-resize';
  static final String swResize = 'sw-resize';

  CustomCursor({Widget child, String cursorStyle = 'pointer'})
      : super(
    onHover: (PointerHoverEvent evt) {
      if (kIsWeb) {
        appContainer.style.cursor = cursorStyle;
      }
    },
    onExit: (PointerExitEvent evt) {
      if (kIsWeb) {
        appContainer.style.cursor = 'default';
      }
    },
    child: child,
  );
}

// ignore: prefer_generic_function_type_aliases
typedef void OnPointerEnter(PointerEvent event);

// ignore: prefer_generic_function_type_aliases
typedef void OnPointerExit(PointerEvent event);

class StrikeThroughOnHover extends StatefulWidget {
  final OnPointerEnter onEnterListener;
  final OnPointerExit onExitListener;
  final Widget child;

  // You can also pass the translation in here if you want to
  StrikeThroughOnHover({
    Key key,
    this.child,
    this.onEnterListener,
    this.onExitListener,
  }) : super(key: key);

  @override
  _StrikeThroughOnHoverState createState() => _StrikeThroughOnHoverState();
}

class _StrikeThroughOnHoverState extends State<StrikeThroughOnHover> {
  final nonHoverTransform = Matrix4.identity()
    ..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()
    ..translate(0, -10, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => widget.onEnterListener(e),
      onExit: (e) => widget.onExitListener(e),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
