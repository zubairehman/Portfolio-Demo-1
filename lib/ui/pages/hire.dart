import 'dart:html' as html;

import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/utils/hover/custom_cursor_widget.dart';
import 'package:portfolio/widgets/circle_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class HireWidget extends StatefulWidget {
  @override
  _HireWidgetState createState() => _HireWidgetState();
}

class _HireWidgetState extends State<HireWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    var child;

    if (ResponsiveWidget.isLargeScreen(context)) {
      child = _buildLargeScreenContent(context);
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      child = _buildMediumScreenContent(context);
    } else if (ResponsiveWidget.isSmallScreen(context)) {
      child = _buildSmallScreenContent(context);
    }

    return child;
  }

  Widget _buildLargeScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        ResponsiveWidget.isLargeScreen(context)
            ? _buildHire()
            : SizedBox.shrink(),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.16,
          top: MediaQuery.of(context).size.width * 0.10,
          child: CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.45,
          bottom: MediaQuery.of(context).size.width * 0.12,
          child: CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 120.0),
                    child: Wrap(
                      children: <Widget>[
                        SizedBox(width: 30.0),
                        CircleWidget(
                          width: 60,
                          height: 60,
                          outerRadius: 25.0,
                          innerRadius: 8.0,
                          circleColor: Color(0xFF0098a6),
                        ),
                        SizedBox(width: 40.0),
                        _buildHireSummary(
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: MediaQuery.of(context).size.width * 0.70,
          top: MediaQuery.of(context).size.width * 0.30,
          child: CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.65,
          top: MediaQuery.of(context).size.width * 0.65,
          child: CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.30,
          top: MediaQuery.of(context).size.width * 1.2,
          child: CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.20,
//            left: MediaQuery.of(context).size.height * 0.10,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.17),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildHireSummary(
                      fontSize: MediaQuery.of(context).size.width * 0.10),
//                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSmallScreenContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.70,
            top: MediaQuery.of(context).size.width * 0.30,
            child: CircleWidget(
              width: 60,
              height: 60,
              outerRadius: 25.0,
              innerRadius: 8.0,
              circleColor: Color(0xFF0098a6),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.65,
            top: MediaQuery.of(context).size.width * 0.65,
            child: CircleWidget(
              width: 40,
              height: 40,
              outerRadius: 15.0,
              innerRadius: 4.0,
              circleColor: Color(0xFF00bcd5),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.30,
            top: MediaQuery.of(context).size.width * 1.2,
            child: CircleWidget(
              width: 0,
              height: 50,
              outerRadius: 20.0,
              innerRadius: 4.0,
              circleColor: Color(0xFFb2ebf2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHireSummary(
                        fontSize: MediaQuery.of(context).size.width * 0.10),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              ],
            ),
          )
        ],
      ),
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildHire() {
    return Center(
      child: Text(
        Strings.hire,
        style: TextStyles.heading,
      ),
    );
  }

  Widget _buildHireSummary({double fontSize}) {
    return StrikeThroughOnHover(
      onEnterListener: (e) => _mouseEnter(true),
      onExitListener: (e) => _mouseEnter(false),
      child: CustomCursor(
        child: RichText(
          text: TextSpan(
            text: Strings.always_interested,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                html.window.open(Strings.menu_mail_link, Strings.menu_mail);
              },
            style: TextStyles.sub_heading.copyWith(
              fontSize: fontSize,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: Strings.lets_talk,
                style: TextStyles.sub_heading.copyWith(
                  fontSize: fontSize,
                  height: 1.5,
                  color: Color(0xFFff5353),
                  decoration: _hovering
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // general methods:-----------------------------------------------------------
  void _mouseEnter(bool hover) {
    print('mouse event: $hover');
    setState(() {
      _hovering = hover;
    });
  }
}
