import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/screen/screen_utils.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class SkillsWidget extends StatefulWidget {
  @override
  _SkillsWidgetState createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
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
//        ResponsiveWidget.isLargeScreen(context)
//            ? _buildDesign()
//            : SizedBox.shrink(),
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 50.0,
                        left: MediaQuery.of(context).size.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildSkillsList(context),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        _buildEducation(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      _buildSkills(
                          fontSize: MediaQuery.of(context).size.width * 0.12),
                      _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
                      SizedBox(width: 30.0),
                    ],
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
                  _buildSkills(
                      fontSize: MediaQuery.of(context).size.width * 0.23),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildEducation(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildSkillsList(context),
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
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.20,
            top: MediaQuery.of(context).size.width * 0.30,
            child: _buildCircle(60, 60, 25.0, 8.0, Color(0xFF0098a6)),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.65,
            top: MediaQuery.of(context).size.width * 0.65,
            child: _buildCircle(40, 40, 15.0, 4.0, Color(0xFF00bcd5)),
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
                    _buildSkills(
                        fontSize: MediaQuery.of(context).size.width * 0.23),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    _buildEducation(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    _buildSkillsList(context),
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
        'SK_\nILLS',
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

  Widget _buildSkills({double fontSize}) {
    return RichText(
      text: TextSpan(
        text: 'Sk_\nills',
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
            text: ':',
            style: TextStyle(
              fontSize: fontSize,
              color: Color(0xFFff5353),
              height: 1.0,
              fontFamily: 'ProductSans',
              fontWeight: FontWeight.w700,
            ),
          ),
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

  Widget _buildSkillsAndEducation(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: _buildEducation(),
        ),
        SizedBox(width: 40.0),
        Expanded(
          flex: 1,
          child: _buildSkillsList(context),
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

  Widget _buildSkillsList(BuildContext context) {
    final List<Widget> widgets = skills
        .map((skill) => Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: _buildSkillChip(context, skill),
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSkillsContainerHeading(),
        SizedBox(height: 8.0),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildEducationContainerHeading(),
        SizedBox(height: 8.0),
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
    return Column(
      children: widgets,
      mainAxisSize: MainAxisSize.min,
    );
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
              color: Colors.grey[300],
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
}
