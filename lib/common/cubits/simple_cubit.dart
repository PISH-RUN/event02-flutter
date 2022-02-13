import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_need_pishrun_event_02/common/failures.dart';
import 'package:kid_need_pishrun_event_02/common/states/simple_3_state.dart';

class SimpleCubit<T> extends Cubit<Simple3State<T>> {
  Future<Either<Failure, T>> Function() main;

  SimpleCubit({this.main}) : super(Simple3State.loading());

  Future<void> getDataFromMain() async {
    emit(Simple3State.loading());
    final response = await main();
    response.fold(
      (failure) => emit(Simple3State.error(failure: failure)),
      (data) => emit(Simple3State.success(data: data)),
    );
  }

  void changeMain(Future<Either<Failure, T>> Function() newMain) {
    main = newMain;
  }
}
