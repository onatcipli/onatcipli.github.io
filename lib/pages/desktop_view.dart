import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/widgets/user_card.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
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
        Padding(
          padding: const EdgeInsets.fromLTRB(80, 100, 0, 250),
          child: Container(
              width: 100,
              child: Card(elevation: 5, child: MyCustomNavigationBar())),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 40, 80),
            child: Card(
              child: CustomViewOfTheSelected(),
              elevation: 5,
            ),
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
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: activeColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: 5,),
              child,
              SizedBox(
                height: 8,
              ),
              Text(
                text,
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomNavigationBar extends StatefulWidget {
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
    final activeColor = Theme.of(context).hoverColor;
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
          },
          activeColor:
              currentView == Views.flutter ? activeColor : disableColor,
        ),
      ],
    );
  }
}

class CustomViewOfTheSelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum Views { about, flutter }
