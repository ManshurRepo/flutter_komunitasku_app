import 'package:bloc/bloc.dart';
import 'package:flutter_komunitas_app/data/datasources/member_datasource.dart';
import 'package:flutter_komunitas_app/data/models/responses/members_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await MemberDataSource().getAllMember();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
