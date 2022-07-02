import 'package:flutter/widgets.dart';

class OverBoardAnimator {

  //  static final OverBoardAnimator _singleton = new OverBoardAnimator._internal();

  // factory OverBoardAnimator(_vsync) {
  //   _singleton._vsync = _vsync;
  //   _singleton._controller = AnimationController(
  //       vsync: _vsync, duration: const Duration(milliseconds: 500));
  //   _singleton._animation = CurvedAnimation(parent: _singleton._controller, curve: Curves.easeIn);
  //   return _singleton;
  // }

  // OverBoardAnimator._internal();

  OverBoardAnimator(TickerProvider vsync) {
    _vsync = vsync;
    _controller = AnimationController(
        vsync: _vsync, duration: const Duration(milliseconds: 300),);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart);
    print('creating new animator');
  }
  late TickerProvider _vsync;
  late AnimationController _controller;
  late Animation _animation;

  AnimationController getController() {
    return _controller;
  }

  Animation getAnimator() {
    return _animation;
  }

  void dispose() {
    _controller.dispose();
  }
}
