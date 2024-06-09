import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_Events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>(event,emit){
      emit(WelcomeState(page:state.page));
    }
  }
}