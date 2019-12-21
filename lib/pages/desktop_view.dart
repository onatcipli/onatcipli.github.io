import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/pages/about_view.dart';
import 'package:onatcipli_github_io/pages/flutter_view.dart';
import 'package:onatcipli_github_io/widgets/animations/fade_out_page.dart';
import 'package:onatcipli_github_io/widgets/user_card.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView>
    with SingleTickerProviderStateMixin {
  Views currentView = Views.about;

  AnimationController animationController;

  Duration _duration = Duration(milliseconds: 500);

  Curve currentCurve = Curves.bounceOut;

  @override
  void initState() {
    animationController = AnimationController(duration: _duration, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 60, 0, 60),
            child: LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth > 450) {
                  return UserCard(
                    width: 210,
                  );
                } else if (constrains.maxWidth > 350) {
                  return UserCard(
                    width: 190,
                  );
                } else if (constrains.maxWidth > 250) {
                  return UserCard(
                    width: 175,
                  );
                } else if (constrains.maxWidth > 200) {
                  return UserCard(
                    width: 150,
                  );
                } else {
                  return UserCard(
                    width: 100,
                  );
                }
              },
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 80, 40, 80),
                child: CustomViewOfTheSelected(
                  animationController: animationController,
                  currentView: currentView,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 0, 250),
                child: Container(
                  width: 100,
                  child: Card(
                    elevation: 5,
                    child: MyCustomNavigationBar(
                      handleOnChange: (Views view) async {
                        animationController.reverse();
                        await Future.delayed(_duration);
                        setState(() {
                          currentView = view;
                        });
                        animationController.forward();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final Widget child;

  final String text;

  final Function onTap;

  final Color activeColor;

  const CustomNavBarItem({
    Key key,
    @required this.text,
    @required this.child,
    @required this.onTap,
    this.activeColor = const Color(0xff31313A),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: activeColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              child,
              SizedBox(
                height: 8,
              ),
              Text(
                text,
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomNavigationBar extends StatefulWidget {
  final Function(Views) handleOnChange;

  const MyCustomNavigationBar({
    Key key,
    @required this.handleOnChange,
  }) : super(key: key);

  @override
  _MyCustomNavigationBarState createState() => _MyCustomNavigationBarState();
}

class _MyCustomNavigationBarState extends State<MyCustomNavigationBar> {
  Views currentView = Views.about;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).backgroundColor;
    final disableColor = Theme.of(context).cardColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomNavBarItem(
          text: 'About',
          child: Icon(Icons.person),
          onTap: () {
            setState(() {
              currentView = Views.about;
            });
            widget.handleOnChange(currentView);
          },
          activeColor: currentView == Views.about ? activeColor : disableColor,
        ),
        CustomNavBarItem(
          text: 'Flutter',
          child: FlutterLogo(),
          onTap: () {
            setState(() {
              currentView = Views.flutter;
            });
            widget.handleOnChange(currentView);
          },
          activeColor:
              currentView == Views.flutter ? activeColor : disableColor,
        ),
      ],
    );
  }
}

class CustomViewOfTheSelected extends StatefulWidget {
  final AnimationController animationController;
  final Views currentView;

  const CustomViewOfTheSelected({
    Key key,
    this.currentView,
    this.animationController,
  }) : super(key: key);

  @override
  _CustomViewOfTheSelectedState createState() =>
      _CustomViewOfTheSelectedState();
}

class _CustomViewOfTheSelectedState extends State<CustomViewOfTheSelected>
    with SingleTickerProviderStateMixin {
  Animation<double> opacityForward;

  Animation<double> transitionXForward;

  var curve = Curves.linear;

  @override
  void initState() {
    opacityForward = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: widget.animationController, curve: Curves.easeInCubic));
    transitionXForward = Tween<double>(begin: -100, end: 0).animate(
        CurvedAnimation(parent: widget.animationController, curve: curve));

    widget.animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeOutAnimation(
      opacity: opacityForward,
      transitionX: transitionXForward,
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 1,
            child:
                widget.currentView == Views.about ? AboutView() : FlutterView(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DropdownButton<Curve>(
                value: curve,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'linear',
                    ),
                    value: Curves.linear,
                  ),
                  DropdownMenuItem(
                    child: Text('easeInCubic'),
                    value: Curves.easeInCubic,
                  ),
                  DropdownMenuItem(
                    child: Text('easeInBack'),
                    value: Curves.easeInBack,
                  ),
                  DropdownMenuItem(
                    child: Text('easeIn'),
                    value: Curves.easeIn,
                  ),
                  DropdownMenuItem(
                    child: Text('bounceOut'),
                    value: Curves.bounceOut,
                  ),
                  DropdownMenuItem(
                    child: Text('bounceIn'),
                    value: Curves.bounceIn,
                  ),
                  DropdownMenuItem(
                    child: Text('bounceInOut'),
                    value: Curves.bounceInOut,
                  ),
                  DropdownMenuItem(
                    child: Text('elasticOut'),
                    value: Curves.elasticOut,
                  ),
                  DropdownMenuItem(
                    child: Text('elasticIn'),
                    value: Curves.elasticIn,
                  ),
                  DropdownMenuItem(
                    child: Text('elasticInOut'),
                    value: Curves.elasticInOut,
                  ),
                ],
                onChanged: (Curve _current) {
                  setState(() {
                    curve = _current;
                  });
                  transitionXForward = Tween<double>(begin: -100, end: 0)
                      .animate(CurvedAnimation(
                          parent: widget.animationController, curve: curve));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Views { about, flutter }
