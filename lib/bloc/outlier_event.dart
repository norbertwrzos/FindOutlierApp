part of 'outlier_bloc.dart';

abstract class OutlierEvent extends Equatable {
  const OutlierEvent();

  @override
  List<Object> get props => [];
}

class GetOutlierValue extends OutlierEvent {
  final List<int> numbers;

  const GetOutlierValue(this.numbers);

  @override
  List<Object> get props => [numbers];
}
