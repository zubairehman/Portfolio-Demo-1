import 'dart:html' as html;

import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/utils/hover/custom_cursor_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class HireWidget extends StatefulWidget {
  @override
  _HireWidgetState createState() => _HireWidgetState();
}

class _HireWidgetState extends State<HireWidget> {
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
        Text(
          'large',
          style: TextStyle(color: Colors.white),
        ),
        ResponsiveWidget.isLargeScreen(context)
            ? _buildHire()
            : SizedBox.shrink(),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.16,
          top: MediaQuery.of(context).size.width * 0.10,
          child: _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.29,
          top: MediaQuery.of(context).size.width * 0.15,
          child: _buildCircle(40, 40, 15.0, 4.0, Color(0xFF00bcd5)),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.45,
          bottom: MediaQuery.of(context).size.width * 0.12,
          child: _buildCircle(50, 50, 20.0, 4.0, Color(0xFFb2ebf2)),
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
                        _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
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
        Text(
          'medium',
          style: TextStyle(color: Colors.white),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.70,
          top: MediaQuery.of(context).size.width * 0.30,
          child: _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.65,
          top: MediaQuery.of(context).size.width * 0.65,
          child: _buildCircle(40, 40, 15.0, 4.0, Color(0xFF00bcd5)),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.30,
          top: MediaQuery.of(context).size.width * 1.2,
          child: _buildCircle(50, 50, 20.0, 4.0, Color(0xFFb2ebf2)),
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
//                  _buildSummary(
//                    quarterTurns: 4,
//                    fontSize: MediaQuery.of(context).size.width * 0.025,
//                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSmallScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          'small',
          style: TextStyle(color: Colors.white),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.70,
          top: MediaQuery.of(context).size.width * 0.30,
          child: _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.65,
          top: MediaQuery.of(context).size.width * 0.65,
          child: _buildCircle(40, 40, 15.0, 4.0, Color(0xFF00bcd5)),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.30,
          top: MediaQuery.of(context).size.width * 1.2,
          child: _buildCircle(50, 50, 20.0, 4.0, Color(0xFFb2ebf2)),
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
                      fontSize: MediaQuery.of(context).size.width * 0.23),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildSummary(
                    quarterTurns: 4,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            ],
          ),
        )
      ],
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildHire() {
    return Center(
      child: Text(
        'HIRE',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.27,
          color: Color(0xFF1e1e1e),
          fontFamily: 'NexaBold',
        ),
      ),
    );
  }

  Widget _buildSummary({int quarterTurns = 3, double fontSize}) {
    return Text(
      Strings.summary,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Inconsolata',
        fontSize: fontSize,
        height: 1.5,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildHireSummary({double fontSize}) {
    return CustomCursor(
      child: RichText(
        text: TextSpan(
          text:
              "I'm always interested about cool stuff. Are you minding a project?\n",
          recognizer: TapGestureRecognizer()
            ..onTap = () => html.window
                .open("https://www.linkedin.com/in/zubairehman/", "LinkedIn"),
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            letterSpacing: 1.5,
            height: 1.5,
            fontFamily: 'ProductSans',
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: "Let's talk.",
              style: TextStyle(
                fontSize: fontSize,
                color: Color(0xFFff5353),
                height: 1.0,
                decoration: TextDecoration.lineThrough,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(double width, double height, double outerRadius,
      double innerRadius, Color color) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(outerRadius),
      ),
      child: Center(
        child: Container(
          height: height * 0.45,
          width: width * 0.45,
          decoration: BoxDecoration(
            color: Color(0XFF1a1a1a),
            borderRadius: BorderRadius.circular(innerRadius),
          ),
        ),
      ),
    );
  }
}
