import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/member_datasource.dart';
import '../../../../data/models/responses/members_response_model.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(const _Initial()) {
     on<_GetMember>((event, emit) async {
      emit(const _Loading());
      final response = await MemberDataSource().getMember(event.filter);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
