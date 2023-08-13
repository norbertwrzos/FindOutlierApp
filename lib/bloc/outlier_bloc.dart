import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'dart:async';

import '../outlier_util.dart';

part 'outlier_event.dart';
part 'outlier_state.dart';

class OutlierBloc extends Bloc<OutlierEvent, OutlierState> {
  OutlierBloc() : super(OutlierInitial());

// @override
// OutlierState get initialState => OutlierInitial();

  Stream<OutlierState> mapEventToState(
    OutlierEvent event,
  ) async* {
    // oczekuj na event (button click)
    if (event is GetOutlierValue) {
      //po kliknieciu stan ladowania
      yield OutlierLoading();

      //pokaz outlier
      final outlierValue = findOutlier(event.numbers);

      //delay
      await Future.delayed(const Duration(seconds: 1));

      //stan loaded + przekaz outlier
      yield OutlierLoaded(outlierValue: outlierValue);
    }
  }
}
