import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quesitions_state.dart';

class QuesitionsCubit extends Cubit<QuesitionsState> {
  QuesitionsCubit() : super(QuesitionsInitial());
}
