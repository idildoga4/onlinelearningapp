import 'package:flutter_bloc/flutter_bloc.dart';
import 'welcome_events.dart';
import 'welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on<WelcomePageChanged>((event, emit) {
      emit(WelcomeState(page: event.page));
    });
  }
}
