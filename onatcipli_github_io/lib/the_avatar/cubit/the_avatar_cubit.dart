import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'the_avatar_state.dart';

class TheAvatarCubit extends Cubit<TheAvatarState> {
  TheAvatarCubit() : super(TheAvatarInitial(removeOffsets: []));

  void addRemoveOffsets(List<Offset> offsets) {
    emit(TheAvatarInitial(removeOffsets: offsets));
  }

  animateTo(Offset offset) {
    emit(
      TheAvatarInitial(
        removeOffsets: (state as TheAvatarInitial).removeOffsets,
        nextOffset: offset,
      ),
    );
  }
}
