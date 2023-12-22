import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

(ScrollController, AnimationController) useAutoHideScroll() {
  final scrollController = useScrollController();
  final hideFabController = useAnimationController(
    duration: kThemeAnimationDuration,
    initialValue: 1,
  );

  useEffect(() {
    scrollController.addListener(() {
      switch (scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          hideFabController.forward();
          break;
        case ScrollDirection.reverse:
          hideFabController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
    return null;
  }, []);

  return (scrollController, hideFabController);
}
