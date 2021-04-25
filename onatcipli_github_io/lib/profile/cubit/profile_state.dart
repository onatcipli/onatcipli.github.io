part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {
  ProfileInitial({required this.removeOffsets});

  final List<Offset> removeOffsets;
}
