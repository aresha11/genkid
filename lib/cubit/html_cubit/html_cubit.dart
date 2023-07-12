import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'html_state.dart';

class HtmlCubit extends Cubit<HtmlState> {
  HtmlCubit() : super(HtmlInitial());

  bool empty=true;
  List<String> htmlCode =[];

  getCode({var code}){
    htmlCode=code;
    empty=false;
    emit(GetCodeSuccess());
    print(htmlCode);
  }

}
