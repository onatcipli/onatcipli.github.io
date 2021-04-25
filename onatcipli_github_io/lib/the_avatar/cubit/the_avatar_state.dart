part of 'the_avatar_cubit.dart';

@immutable
abstract class TheAvatarState {}

class TheAvatarInitial extends TheAvatarState {
  TheAvatarInitial({required this.removeOffsets, this.nextOffset});

  final List<Offset> removeOffsets;
  final Offset? nextOffset;
}
