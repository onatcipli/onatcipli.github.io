import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/constants/constants.dart';
import 'package:onatcipli_github_io/pages/flutter_view.dart';
import 'package:onatcipli_github_io/widgets/user_card.dart';

class MobileView extends StatefulWidget {
  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  List pages = [
    UserCard(),
    Card(elevation:8,child: FlutterView()),
  ];

  var _controller = PageController();

  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          onPageChanged: (_index){
            _currentPage = _index;
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return pages.elementAt(index);
          },
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: () {
                    if (_currentPage != 0) {
                      _currentPage -= 1;
                      _controller.animateToPage(_currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInCubic);
                    }
                  },
                  child: Icon(Icons.arrow_upward),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: () {
                    if (_currentPage != pages.length) {
                      _currentPage += 1;
                      _controller.animateToPage(_currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInCubic);
                    }
                  },
                  child: Icon(Icons.arrow_downward),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  LayoutBuilder buildLayoutBuilder() {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth > 400) {
          return UserCard(
            width: 350,
          );
        } else if (constrains.maxWidth > 250) {
          return UserCard(
            width: 200,
          );
        } else if (constrains.maxWidth > 200) {
          return UserCard(
            width: 150,
          );
        } else if (constrains.maxWidth > 150) {
          return UserCard(
            width: 100,
          );
        } else if (constrains.maxWidth > 100) {
          return UserCard(
            width: 60,
          );
        } else {
          return UserCard(
            width: 50,
          );
        }
      },
    );
  }
}
