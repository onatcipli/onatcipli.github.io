import 'package:flutter/material.dart';

class FadeOutAnimation extends StatelessWidget {
  final Widget child;

  final Animation<double> opacity;
  final Animation<double> transitionX;

  const FadeOutAnimation({Key key, this.child, this.opacity, this.transitionX}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([opacity, transitionX]),
      child: child,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: opacity.value,
          child: Transform.translate(
            offset: Offset(
              transitionX.value,
              0,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

