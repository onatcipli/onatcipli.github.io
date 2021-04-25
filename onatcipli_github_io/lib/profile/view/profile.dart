import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onatcipli_github_io/profile/cubit/profile_cubit.dart';
import 'package:onatcipli_github_io/profile/view/the_avatar.dart';
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
