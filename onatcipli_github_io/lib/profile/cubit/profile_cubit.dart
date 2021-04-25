import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial(removeOffsets: []));

  void addRemoveOffsets(List<Offset> offsets) {
    emit(ProfileInitial(removeOffsets: offsets));
  }
}
