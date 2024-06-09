import 'package:ulearning/appevents.dart';
import 'package:ulearning/appstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates>
{
  AppBlocs():super(InitStates())
  {
    on<Increment>((event,ask)
    {
      ask(AppStates(counter: state.counter+1));
    });
    
    on<Decrement>((event, ask)
    {
      ask(AppStates(counter:state.counter-1));
    });
  }


}