import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  final bool fromLeft;
  final bool fromRight;
  final bool fromTop;
  const DelayedAnimation({
    super.key,
    required this.child,
    required this.delay,
    this.fromLeft = false,
    this.fromRight = false,
    this.fromTop = false,
  });

  @override
  // ignore: no_logic_in_create_state
  State<DelayedAnimation> createState() => _DelayedAnimationState(
      fromLeft: fromLeft, fromRight: fromRight, fromTop: fromTop);
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animOffset;
  bool fromLeft = false;
  bool fromRight = false;
  bool fromTop = true;
  _DelayedAnimationState({
    required this.fromLeft,
    required this.fromRight,
    required this.fromTop,
  });
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );

    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    animOffset = Tween<Offset>(
      begin: fromLeft
          ? const Offset(-0.5, 0.0)
          : fromRight
              ? const Offset(0.5, 0.0)
              : const Offset(0.0, -0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    // cubit(context).isAnimated
    //     ? {
    //         Timer(const Duration(milliseconds: 0), () {
    //           controller.toggle().whenComplete(
    //                 () => controller.forward(),
    //               );

    //           cubit(context).animate(false);
    //         }),
    //       }
    //     : null;
    return FadeTransition(
      opacity: controller,
      child: SlideTransition(
        position: animOffset,
        child: widget.child,
      ),
    );
  }
}
