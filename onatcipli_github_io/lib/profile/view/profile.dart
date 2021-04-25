import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onatcipli_github_io/profile/cubit/profile_cubit.dart';
import 'package:onatcipli_github_io/profile/view/the_foreground_painter.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profileCubit = context.watch<ProfileCubit>();
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            foregroundPainter: TheForegroundPainter(
              50,
              (profileCubit.state as ProfileInitial).removeOffsets,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const Center(child: Text('here')),
            ),
          ),
          TheAvatar(),
        ],
      ),
    );
  }
}

class TheAvatar extends StatefulWidget {
  @override
  _TheAvatarState createState() => _TheAvatarState();
}

class _TheAvatarState extends State<TheAvatar> with TickerProviderStateMixin {
  late AnimationController offsetController;
  late Animation offsetAnimation;
  late AnimationController idleController;
  late Animation idleAnimation;
  List<Offset> removeOffsets = [];

  Offset local = Offset.zero;

  var duration = const Duration(milliseconds: 1200);

  final _globalKey = GlobalKey();

  Offset currentCenter = const Offset(
    500,
    -300,
  );

  late Offset nextOffset;

  @override
  void initState() {
    nextOffset = const Offset(
      5,
      10,
    );
    offsetController = AnimationController(vsync: this, duration: duration);
    idleController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    setAnimation();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      offsetController.forward().then((value) async {
        // duration = const Duration(milliseconds: 0);
        setIdleAnimation();
        // idleController.repeat(period: Duration(milliseconds: 1000),reverse: true);
        // await offsetController.reverse(from: .1);
      });
    });

    idleController.addListener(() {
      setState(() {});
      setIdleAnimation();
    });
    offsetController.addListener(() {
      handleLocationChanges();
      setState(() {});
    });
    super.initState();
  }

  void setAnimation() {
    offsetAnimation = Tween<Offset>(
      begin: currentCenter,
      end: nextOffset,
    ).animate(
      CurvedAnimation(
        parent: offsetController,
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  void setIdleAnimation() {
    final random = math.Random();
    var nextInt = random.nextInt(4);
    final plus = random.nextBool();
    final value = plus == true ? nextInt * (1.0) : nextInt * (-1.0);
    idleAnimation = Tween<Offset>(
      begin: currentCenter,
      end: currentCenter.translate(value, value),
    ).animate(
      CurvedAnimation(
        parent: idleController,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _globalKey,
      left: 4 * 2 * (offsetAnimation.value as Offset).dx,
      top: ((offsetAnimation.value as Offset).dy * (offsetAnimation.value as Offset).dy),
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
            padding: EdgeInsets.all(8.0),
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
    var dx = details.globalPosition.dx - local.dx;
    var dy = details.globalPosition.dy - local.dy;
    nextOffset = Offset(dx, dy);
    setAnimation();
    setState(() {});
    offsetController.forward(from: .9);
    // handleLocationChanges();
  }

  void handleLocationChanges() {
    var findRenderObject =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    var h = findRenderObject.size.height / 2;
    var w = findRenderObject.size.width / 2;
    currentCenter = findRenderObject.localToGlobal(Offset(w, h));
    removeOffsets.add(currentCenter);
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
