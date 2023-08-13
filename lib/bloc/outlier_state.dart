part of 'outlier_bloc.dart';

abstract class OutlierState extends Equatable {
  const OutlierState();

  @override
  List<Object> get props => [];
}

class OutlierInitial extends OutlierState {}

class OutlierLoading extends OutlierState {}

class OutlierLoaded extends OutlierState {
  final int outlierValue;

  const OutlierLoaded({required this.outlierValue});
  

  @override
  List<Object> get props => [outlierValue];
}
