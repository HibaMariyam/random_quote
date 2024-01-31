part of 'quotes_cubit.dart';

@immutable
sealed class QuotesState {}

final class QuotesInitial extends QuotesState {}
final class QuotesLoading extends QuotesState {}
final class QuotesSuccess extends QuotesState {
  final String quotes;
  QuotesSuccess(this.quotes);
}
final class QuotesFailure extends QuotesState {
  final String msg;

  QuotesFailure(this.msg);
}