import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onatcipli_github_io/profile/cubit/profile_cubit.dart';
import 'package:onatcipli_github_io/the_avatar/cubit/the_avatar_cubit.dart';
import 'package:onatcipli_github_io/the_avatar/view/scratch.dart';
import 'package:onatcipli_github_io/the_avatar/view/the_avatar.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ProfileBodyView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.eighteen_mp),
        onPressed: () {
          context.read<TheAvatarCubit>().animateTo(
                Offset(
                  size.width - 100,
                  size.height - 500,
                ),
              );
        },
      ),
    );
  }
}

class ProfileBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatarCubit = context.watch<TheAvatarCubit>();
    return Stack(
      children: [
        Scratcher(
          removeOffsets: (avatarCubit.state as TheAvatarInitial).removeOffsets,
          strokeWidth: 50,
          color: Theme.of(context).secondaryHeaderColor,
          child: realBody(context),
        ),
        TheAvatar(),
      ],
    );
  }

  Container realBody(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: Text('here')),
    );
  }
}
