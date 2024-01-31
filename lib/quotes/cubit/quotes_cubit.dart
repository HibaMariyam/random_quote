import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit() : super(QuotesInitial());
  void getQuote()async{
    emit(QuotesLoading());
    try{
      final response=await Dio().get('https://ron-swanson-quotes.herokuapp.com/v2/quotes');
      emit(QuotesSuccess(response.data[0].toString()));
    }catch(e){
      emit(QuotesFailure(e.toString()));
    }
  }
}
