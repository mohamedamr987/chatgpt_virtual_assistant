import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class HomePageController extends Cubit<HomeState>
{
  HomePageController() :super(HomeInit());
  static HomePageController of(context)=> BlocProvider.of(context);
  
}
