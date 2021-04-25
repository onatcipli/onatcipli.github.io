import 'package:flutter/material.dart';
import 'package:onatcipli_github_io/profile/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TheAvatar extends StatefulWidget {
  @override
  _TheAvatarState createState() => _TheAvatarState();
}

class _TheAvatarState extends State<TheAvatar> with TickerProviderStateMixin {
  List<Offset> removeOffsets = [];
  double top = -100;
  double left = 50;

  Offset local = Offset.zero;

  var duration = const Duration(milliseconds: 1800);

  final _globalKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        top = 100;
      });
      Future.delayed(duration).then((value) {
        duration = const Duration(milliseconds: 0);
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: _globalKey,
      duration: duration,
      curve: Curves.elasticOut,
      left: left,
      top: top,
      child: GestureDetector(
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanUpdate: onPanUpdate,
        child: CircleAvatar(
          backgroundImage: const NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGf1xTQLvI3AJz_moWk5Uj8baR9B0ffwSGyuxn9jdgiEf-fEpC',
          ),
          child: const Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          minRadius: minRadius(),
          maxRadius: minRadius(),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }

  double minRadius() => 50;

  void onPanStart(DragStartDetails details) {}

  void onPanEnd(DragEndDetails details) {}

  void onPanUpdate(DragUpdateDetails details) {}

  void onLongPressStart(LongPressStartDetails details) {
    log(details);
    local = details.localPosition;
    handleUpdate(details);
    setState(() {});
  }

  void log(LongPressStartDetails details) {
    print('local dx : ${details.localPosition.dx}');
    print('local dy : ${details.localPosition.dy}');
    print('global dx : ${details.globalPosition.dx}');
    print('global dy : ${details.globalPosition.dy}');
  }

  void handleUpdate(details) {
    left = details.globalPosition.dx - local.dx;
    top = details.globalPosition.dy - local.dy;
    var findRenderObject =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    var h = findRenderObject.size.height / 2;
    var w = findRenderObject.size.width / 2;
    var localToGlobal = findRenderObject.localToGlobal(Offset(w, h));
    removeOffsets.add(localToGlobal);
    context.read<ProfileCubit>().addRemoveOffsets(removeOffsets);
  }

  void onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    handleUpdate(details);
    setState(() {});
  }

  void onLongPressEnd(LongPressEndDetails details) {
    handleUpdate(details);
    setState(() {});
  }
}
