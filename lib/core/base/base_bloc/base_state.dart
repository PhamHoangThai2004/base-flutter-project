import 'base_bloc.src.dart';

abstract class BaseState<T extends BaseState<T>> {
  final StatusEnum status;

  const BaseState({
    this.status = StatusEnum.initial,
  });

  T copyWith({
    StatusEnum? status,
  });
}