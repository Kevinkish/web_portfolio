import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portfolio/state%20management/state.dart';

class MainBloc extends Cubit<MainState> {
  MainBloc() : super(InitialState());
  static MainBloc get(context) => BlocProvider.of(context);

  int selectedPage = 0;
  navigationChanged(int page) {
    selectedPage = page;
    emit(NavigationPressedState());
  }

  bool onContact = false;
  hoverOnContact(bool isHover) {
    onContact = isHover;
    emit(HoverOnContactState());
  }

  bool onProject0 = false;
  bool onProject1 = false;
  bool onProject2 = false;
  hoveronProject0(bool isHover) {
    onProject0 = isHover;
    emit(HoverOnProject0State());
  }

  hoveronProject1(bool isHover) {
    onProject1 = isHover;
    emit(HoverOnProject1State());
  }

  hoveronProject2(bool isHover) {
    onProject2 = isHover;
    emit(HoverOnProject2State());
  }

  bool onHome1 = false;
  hoveronHome1(bool isHover) {
    onHome1 = isHover;
    emit(HoverOnHome1State());
  }

  bool onHome0 = false;
  hoveronHome0(bool isHover) {
    onHome0 = isHover;
    emit(HoverOnHome0State());
  }

  bool onAbout = false;
  hoveronAbout(bool isHover) {
    onAbout = isHover;
    emit(HoverOnAboutState());
  }

  bool isAnimated = false;
  animate(bool animated) {
    isAnimated = animated;
    emit(AnimateState());
  }
}
