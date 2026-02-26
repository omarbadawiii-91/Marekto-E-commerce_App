import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  int currentindex = 0;

  void changeindex(int index) {
    currentindex = index;
    emit(NavBarInitial());
  }
}
