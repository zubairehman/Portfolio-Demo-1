import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/widgets/circle_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
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
          left: MediaQuery.of(context).size.width * 0.29,
          top: MediaQuery.of(context).size.width * 0.12,
          child: CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.37,
          bottom: MediaQuery.of(context).size.width * 0.10,
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
            width: MediaQuery.of(context).size.width * 0.80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 120.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        _buildAbout(
                            fontSize: MediaQuery.of(context).size.width * 0.12),
                      ],
                    ),
                  ),
                ),
//              SizedBox(width: MediaQuery.of(context).size.width * 0.30),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: _buildSummary(
                        fontSize: MediaQuery.of(context).size.width * 0.012),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: MediaQuery.of(context).size.width * 0.16,
          top: MediaQuery.of(context).size.width * 0.20,
          child: CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.25,
          top: MediaQuery.of(context).size.width * 0.65,
          child: CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
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
                  _buildAbout(
                      fontSize: MediaQuery.of(context).size.width * 0.23),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildSummary(
                    quarterTurns: 4,
                    fontSize: MediaQuery.of(context).size.width * 0.022,
                  ),
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
            left: MediaQuery.of(context).size.width * 0.50,
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
            right: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 1.4,
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildAbout(
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
      ),
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildDesign({double fontSize}) {
    return Center(
      child: Text(
        Strings.about,
        style: TextStyles.heading.copyWith(fontSize: fontSize),
      ),
    );
  }

  Widget _buildSummary({int quarterTurns = 3, double fontSize}) {
    return Text(
      Strings.summary,
      textAlign: TextAlign.justify,
      style: TextStyles.body.copyWith(fontSize: fontSize),
    );
  }

  Widget _buildAbout({double fontSize}) {
    return RichText(
      text: TextSpan(
        text: Strings.about,
        style: TextStyles.sub_heading.copyWith(fontSize: fontSize),
        children: <TextSpan>[
          TextSpan(
            text: ':',
            style: TextStyles.sub_heading.copyWith(
              color: Color(0xFFff5353),
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
