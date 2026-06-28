import 'package:base_flutter_project/core/base/base_bloc/base_bloc.src.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc<Event extends BaseEvent,
    State extends BaseState<State>> extends Bloc<Event, State> {

  BaseBloc(super.initialState);

  void showLoading(Emitter<State> emit) {
  emit(
    state.copyWith(
      status: StatusEnum.processing,
    ),
  );
}

void isSuccess(Emitter<State> emit) {
  emit(
    state.copyWith(
      status: StatusEnum.success,
    ),
  );
}

  void showError(Emitter<State> emit) {
    emit(
      state.copyWith(
        status: StatusEnum.failure,
      ),
    );
  }

  void resetStatus(Emitter<State> emit) {
    emit(
      state.copyWith(
        status: StatusEnum.initial,
      ),
    );
  }
}