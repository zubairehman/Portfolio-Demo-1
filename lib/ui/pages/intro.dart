import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class IntroWidget extends StatefulWidget {
  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
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
            ? _buildDesign()
            : SizedBox.shrink(),
        _buildAppBar(context),
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
          left: MediaQuery.of(context).size.width * 0.37,
          bottom: MediaQuery.of(context).size.width * 0.10,
          child: _buildCircle(50, 50, 20.0, 4.0, Color(0xFFb2ebf2)),
        ),
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 30.0),
                    _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
                    SizedBox(width: 40.0),
                    _buildAboutMe(
                        fontSize: MediaQuery.of(context).size.width * 0.015),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.30),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: _buildHello(
                    fontSize: MediaQuery.of(context).size.width * 0.12),
              ),
            ],
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
        _buildAppBar(context),
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHello(fontSize: MediaQuery.of(context).size.width * 0.23),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                _buildAboutMe(
                  quarterTurns: 4,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                ),
              ],
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
        _buildAppBar(context),
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
                  _buildHello(
                      fontSize: MediaQuery.of(context).size.width * 0.23),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildAboutMe(
                    quarterTurns: 4,
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              _buildCookies(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            ],
          ),
        )
      ],
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (ScreenUtil.getInstance().setWidth(40)),
        vertical: (ScreenUtil.getInstance().setWidth(20)),
      ),
      child: AppBar(
        titleSpacing: 0.0,
        title: _buildTitle(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        _buildPortfolio(),
        SizedBox(
          width: ResponsiveWidget.isSmallScreen(context)
              ? MediaQuery.of(context).size.width * 0.10
              : ResponsiveWidget.isMediumScreen(context)
                  ? MediaQuery.of(context).size.width * 0.05
                  : MediaQuery.of(context).size.width * 0.20,
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? SizedBox.shrink()
            : _buildCookies(),
      ],
    );
  }

  Widget _buildPortfolio() {
    return Text(
      Strings.portfolio,
      style: TextStyles.logo.copyWith(
        fontFamily: 'AquateScript',
        color: Colors.white,
      ),
    );
  }

  Widget _buildCookies() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          Assets.cookies,
          height: 20.0,
          color: Colors.white, //480.0
        ),
        SizedBox(width: 12.0),
        RichText(
          text: TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: Strings.this_web,
                style: TextStyles.logo.copyWith(
                    fontFamily: 'Inconsolata',
                    color: Colors.grey,
                    fontSize: 12.0),
              ),
              TextSpan(
                text: Strings.cookies,
                style: TextStyles.logo.copyWith(
                    fontFamily: 'Inconsolata',
                    color: Colors.white,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12.0),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDesign() {
    return Center(
      child: Text(
        'DES_\nIGN',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.27,
          color: Color(0xFF1e1e1e),
          fontFamily: 'NexaBold',
        ),
      ),
    );
  }

  Widget _buildAboutMe({int quarterTurns = 3, double fontSize}) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Text(
        'Mobile App Developer\nbased in Islamabad\nPakistan.',
        style: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Inconsolata',
          fontSize: fontSize,
          height: 1.5,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildHello({double fontSize}) {
    return RichText(
      text: TextSpan(
        text: 'Hello',
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
          letterSpacing: 1.5,
          height: 1.0,
          fontFamily: 'ProductSans',
          fontWeight: FontWeight.w700,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '.',
            style: TextStyle(
              fontSize: fontSize,
              color: Color(0xFFff5353),
              height: 1.0,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '\nI am\nZubair',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              height: 1.0,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w700,
            ),
          )
        ],
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
