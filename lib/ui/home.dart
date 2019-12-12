import 'dart:html' as html;

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/education.dart';
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
  // boolean to hold hover
  bool _hovering = false;

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
                ResponsiveWidget.isSmallScreen(context) ? SizedBox.shrink() : _buildSocialButtons()
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
    return IntrinsicHeight(
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
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    print('inside small layout home');
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
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: MaterialButton(
                hoverColor: Color(0xFF00bcd5),
                child: Text(
                  Strings.menu_medium,
                  style: TextStyles.menu_item.copyWith(
                    fontFamily: 'Inconsolata',
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  html.window
                      .open("https://medium.com/@zubairehman.work", "Medium");
                },
              ),
            ),
          ),
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: MaterialButton(
                hoverColor: Color(0xFF00bcd5),
                child: Text(
                  Strings.menu_github,
                  style: TextStyles.menu_item
                      .copyWith(fontFamily: 'Inconsolata', color: Colors.white),
                ),
                onPressed: () {
                  html.window.open("https://github.com/zubairehman", "Github");
                },
              ),
            ),
          ),
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: MaterialButton(
                hoverColor: Color(0xFF00bcd5),
                child: Text(
                  Strings.menu_linked_in,
                  style: TextStyles.menu_item.copyWith(
                    fontFamily: 'Inconsolata',
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  html.window.open(
                      "https://www.linkedin.com/in/zubairehman/", "LinkedIn");
                },
              ),
            ),
          ),
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: MaterialButton(
                hoverColor: Color(0xFF00bcd5),
                child: Text(
                  Strings.menu_twitter,
                  style: TextStyles.menu_item.copyWith(
                    fontFamily: 'Inconsolata',
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  html.window.open("https://twitter.com/zubair340", "Twitter");
                },
              ),
            ),
          ),
          CustomCursor(
            cursorStyle: CustomCursor.pointer,
            child: RotatedBox(
              quarterTurns: quarterTurns,
              child: MaterialButton(
                hoverColor: Color(0xFF00bcd5),
                child: Text(
                  Strings.menu_facebook,
                  style: TextStyles.menu_item.copyWith(
                    color: Colors.white,
                    fontFamily: 'Inconsolata',
                  ),
                ),
                onPressed: () {
                  html.window
                      .open("https://www.facebook.com/zubair340", "Facebook");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return Image.network(
      Assets.programmer3,
      height: ScreenUtil.getInstance().setWidth(345), //480.0
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
                  'in flutter',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Inconsolata',
                    fontSize: 18.0,
                    decoration: TextDecoration.lineThrough,
                    height: 1.5,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  '❤ ',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Inconsolata',
                    fontSize: 18.0,
                    height: 1.5,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Made with',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontFamily: 'Inconsolata',
                    fontSize: 18.0,
                    decoration: TextDecoration.lineThrough,
                    height: 1.5,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Text(
      ResponsiveWidget.isSmallScreen(context)
          ? Strings.headline
          : Strings.headline.replaceFirst(RegExp(r' f'), '\nf'),
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: EdgeInsets.only(right: 80.0),
      child: Text(
        Strings.summary,
        style: TextStyles.body,
      ),
    );
  }

  Widget _buildSkillsAndEducation(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _buildEducation(),
        ),
        SizedBox(width: 40.0),
        Expanded(
          flex: 1,
          child: _buildSkills(context),
        ),
      ],
    );
  }

  final skills = [
    'Java',
    'Kotlin',
    'Dart',
    'Flutter',
    'Android',
    'iOS',
    'Xamarin',
    'Reactive Programming',
    'Jenkins',
    'Photoshop',
    'JFrog Atrtifactory',
    'Code Magic',
  ];

  Widget _buildSkills(BuildContext context) {
    final List<Widget> widgets = skills
        .map((skill) => Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: _buildSkillChip(context, skill),
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSkillsContainerHeading(),
        Wrap(children: widgets),
//        _buildNavigationArrows(),
      ],
    );
  }

  Widget _buildSkillsContainerHeading() {
    return Text(
      Strings.skills_i_have,
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyles.chip.copyWith(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.0 : 11.0,
        ),
      ),
    );
  }

  final educationList = [
    Education(
      'Apr 2018',
      'Present',
      'Embrace-it Pakistan',
      'Sr. Software Engineer',
    ),
    Education(
      'Apr 2016',
      'Apr 2018',
      'TEO International',
      'Sr. Software Engineer',
    ),
    Education(
      'July 2014',
      'March 2016',
      'Citrusbits',
      'Software Engineer',
    ),
  ];

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildEducationContainerHeading(),
        _buildEducationSummary(),
        SizedBox(height: 8.0),
        _buildEducationTimeline(),
      ],
    );
  }

  Widget _buildEducationContainerHeading() {
    return Text(
      Strings.experience,
      style: TextStyles.sub_heading,
    );
  }

  Widget _buildEducationSummary() {
    return Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      style: TextStyles.body,
    );
  }

  Widget _buildEducationTimeline() {
    final List<Widget> widgets = educationList
        .map((education) => _buildEducationTile(education))
        .toList();
    return Column(children: widgets);
  }

  Widget _buildEducationTile(Education education) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${education.post}',
            style: TextStyles.company,
          ),
          Text(
            '${education.organization}',
            style: TextStyles.body.copyWith(
              color: Color(0xFF45405B),
            ),
          ),
          Text(
            '${education.from}-${education.to}',
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                child: _buildCopyRightText(context),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: _buildSocialIcons(),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCopyRightText(BuildContext context) {
    return Text(
      Strings.rights_reserved,
      style: TextStyles.body1.copyWith(
        fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0,
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            html.window
                .open("https://www.linkedin.com/in/zubairehman/", "LinkedIn");
          },
          child: Image.network(
            Assets.linkedin,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            html.window.open("https://medium.com/@zubairehman.work", "Medium");
          },
          child: Image.network(
            Assets.evernote,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            html.window.open("https://github.com/zubairehman", "Github");
          },
          child: Image.network(
            Assets.google,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        SizedBox(width: 16.0),
        GestureDetector(
          onTap: () {
            html.window.open("https://twitter.com/zubair340", "Twitter");
          },
          child: Image.network(
            Assets.twitter,
            color: Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
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
