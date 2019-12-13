import 'dart:html' as html;

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/ui/pages/about.dart';
import 'package:portfolio/ui/pages/hire.dart';
import 'package:portfolio/ui/pages/intro.dart';
import 'package:portfolio/ui/pages/skills.dart';
import 'package:portfolio/utils/hover/custom_cursor_widget.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1a1a1a),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildBackground(),
                _buildBody(context, constraints),
                _buildMadeWith(
                  alignment: ResponsiveWidget.isSmallScreen(context)
                      ? Alignment.topRight
                      : Alignment.bottomLeft,
                ),
                isSmallScreen
                    ? SizedBox.shrink()
                    : _buildSocialButtons()
              ],
            );
          },
        ),
      ),
    );
  }

  // background:----------------------------------------------------------------
  Widget _buildBackground() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 2,
      height: double.maxFinite,
      color: Colors.black26,
      child: VerticalDivider(
        color: Colors.black26,
      ),
    );
  }

  // body:----------------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: ResponsiveWidget(
              largeScreen: _buildLargeScreen(context),
              mediumScreen: _buildMediumScreen(context),
              smallScreen: _buildSmallScreen(context),
              onSmallScreen: () {
                if(!isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      print('insdie callback');
                      isSmallScreen = true;
                    });
                  });
                }
              },
              onMediumScreen: () {
                if(isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      print('insdie callback');
                      isSmallScreen = false;
                    });
                  });
                }
              },
              onLargeScreen: () {
                if(isSmallScreen) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      print('insdie callback');
                      isSmallScreen = false;
                    });
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: IntroWidget()),
                Expanded(flex: 1, child: AboutWidget()),
                Expanded(flex: 1, child: SkillsWidget()),
                Expanded(flex: 1, child: HireWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IntroWidget(),
            AboutWidget(),
            SkillsWidget(),
            HireWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IntroWidget(),
          AboutWidget(),
          SkillsWidget(),
          HireWidget(),
          _buildSocialButtons(
            axis: Axis.horizontal,
            quarterTurns: 4,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  // general widgets:-----------------------------------------------------------
  Widget _buildSocialButtons({
    int quarterTurns = 3,
    Axis axis = Axis.vertical,
    alignment = Alignment.centerRight,
  }) {
    return Align(
      alignment: alignment,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: axis,
        children: <Widget>[
          _buildMenuItem(quarterTurns, Strings.menu_medium_link, Strings.menu_medium),
          _buildMenuItem(quarterTurns, Strings.menu_github_link, Strings.menu_github),
          _buildMenuItem(quarterTurns, Strings.menu_linked_in_link, Strings.menu_linked_in),
          _buildMenuItem(quarterTurns, Strings.menu_twitter_link, Strings.menu_twitter),
          _buildMenuItem(quarterTurns, Strings.menu_facebook_link, Strings.menu_facebook),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int quarterTurns, String link, String title) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: MaterialButton(
          hoverColor: Color(0xFF00bcd5),
          child: Text(
            title,
            style: TextStyles.menu_item,
          ),
          onPressed: () {
            html.window.open(link, title);
          },
        ),
      ),
    );
  }

  Widget _buildMadeWith({Alignment alignment = Alignment.bottomLeft}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50.0,
        left: (ScreenUtil.getInstance().setWidth(40)),
      ),
      child: Align(
        alignment: alignment,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          color: Color(0xFF1e1e1e),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.in_flutter,
                  style: TextStyles.strikeThrough,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.heart,
                  style: TextStyles.strikeThrough.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.made_with,
                  style: TextStyles.strikeThrough,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
