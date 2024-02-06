part of 'member_bloc.dart';

@freezed
class MemberState with _$MemberState {
  const factory MemberState.initial() = _Initial;
  const factory MemberState.loading() = _Loading;
  const factory MemberState.loaded(MemberResponModel model) = _Loaded;
  const factory MemberState.error(String message) = _Error;
}
