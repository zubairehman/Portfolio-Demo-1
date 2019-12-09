import 'dart:html' as html;

import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1a1a1a),
      child: Scaffold(
        backgroundColor: Colors.transparent,
//          appBar: _buildAppBar(context),
//          drawer: _buildDrawer(context),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildVerticalDivider(),
                    _buildVerticalDivider(),
                    _buildVerticalDivider(),
                    _buildVerticalDivider(),
                    _buildVerticalDivider(),
                  ],
                ),
                ResponsiveWidget.isLargeScreen(context)
                    ? _buildDesign()
                    : SizedBox.shrink(),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.15,
                  top: MediaQuery.of(context).size.width * 0.11,
                  child: _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
                ),
                _buildAppBar(context),
                _buildBody(context, constraints),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.30,
                  top: MediaQuery.of(context).size.width * 0.15,
                  child: _buildCircle(40, 40, 15.0, 4.0, Color(0xFF00bcd5)),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.37,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                  child: _buildCircle(50, 50, 20.0, 4.0, Color(0xFFb2ebf2)),
                ),
                _buildMadeWith(),
              ],
            );
          },
        ),
      ),
    );
  }

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
//      actions:
//          !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
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
              : MediaQuery.of(context).size.width * 0.25,
        ),
        _buildCookies(),
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

  Widget _buildSocialButtons() {
    return Wrap(
      direction: Axis.vertical,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: MaterialButton(
            child: Text(
              Strings.menu_medium,
              style: TextStyles.menu_item.copyWith(
                fontFamily: 'Inconsolata',
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: MaterialButton(
            child: Text(
              Strings.menu_github,
              style: TextStyles.menu_item
                  .copyWith(fontFamily: 'Inconsolata', color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: MaterialButton(
            child: Text(
              Strings.menu_contact,
              style: TextStyles.menu_item.copyWith(
                fontFamily: 'Inconsolata',
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: MaterialButton(
            child: Text(
              Strings.menu_about,
              style: TextStyles.menu_item.copyWith(
                fontFamily: 'Inconsolata',
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: MaterialButton(
            child: Text(
              Strings.menu_home,
              style: TextStyles.menu_item.copyWith(
                color: Colors.white,
                fontFamily: 'Inconsolata',
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context),
        ),
      ),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildLargeScreenContent(context)),
                _buildSocialButtons()
              ],
            ),
          ),
          Text(
            'Large',
            style: TextStyle(color: Colors.white),
          )
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
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildMediumScreenContent(context)),
                _buildSocialButtons()
              ],
            ),
          ),
          Text(
            'Medium',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _buildLargeScreenContent(context)),
          Divider(),
          Text(
            'Small',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          _buildSocialIcons(),
          SizedBox(
              height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
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

  Widget _buildLargeScreenContent(BuildContext context) {
    return Row(
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
              _buildAboutMe(fontSize: MediaQuery.of(context).size.width * 0.015),
            ],
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.30),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: _buildHello(fontSize: MediaQuery.of(context).size.width * 0.12),
        ),
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.20,
        left: MediaQuery.of(context).size.height * 0.10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHello(fontSize: MediaQuery.of(context).size.width * 0.23),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          _buildAboutMe(quarterTurns: 4, fontSize: MediaQuery.of(context).size.width * 0.035),
        ],
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

  Widget _buildMadeWith() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50.0,
        left: (ScreenUtil.getInstance().setWidth(40)),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          color: Color(0xFF1e1e1e),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  '❤',
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
}
