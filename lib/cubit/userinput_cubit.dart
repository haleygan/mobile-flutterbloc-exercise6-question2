import 'package:bloc/bloc.dart';

class UserInputCubit extends Cubit<String> {
  UserInputCubit() : super('');

  void capitilizeText(text) => emit(text.toUpperCase());
}
