import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh>
    with SingleTickerProviderStateMixin {
  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: 100,
      onRefresh: widget.onRefresh,
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: <Widget>[
            if (controller.isIdle)
              const SizedBox()
            else
              AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? _) {
                  prevScrollDirection = controller.scrollingDirection;
                  //TODO: need to see with design about that animation
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10),
                    height: 40,
                    width: double.maxFinite,
                    child: OverflowBox(
                      maxHeight: 30,
                      minHeight: 30,
                      maxWidth: 30,
                      minWidth: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor,
                        ),
                        value: controller.value,
                      ),
                    ),
                  );
                },
              ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
