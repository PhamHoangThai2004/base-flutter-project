import 'base_bloc.src.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BaseEvent {}

extension StatusEmitter<State extends BaseState<State>>
    on Emitter<State> {

  void showLoading(State state) {
    call(
      state.copyWith(
        status: StatusEnum.processing,
      ),
    );
  }

  void isSuccess(State state) {
    call(
      state.copyWith(
        status: StatusEnum.success,
      ),
    );
  }

  void showError(State state) {
    call(
      state.copyWith(
        status: StatusEnum.failure,
      ),
    );
  }

  void resetStatus(State state) {
    call(
      state.copyWith(
        status: StatusEnum.initial,
      ),
    );
  }
}