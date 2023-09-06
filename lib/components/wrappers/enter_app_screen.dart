import 'package:flutter/material.dart';

import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../wrappers/screen.dart';

class EnterAppScreen extends StatefulWidget {
  const EnterAppScreen({
    super.key,
    this.appBar,
    this.icon,
    required this.title,
    this.description,
    required this.content,
  });

  final AppBar? appBar;
  final IconData? icon;
  final Widget title;
  final Widget? description;
  final Widget content;

  @override
  State<EnterAppScreen> createState() => _EnterAppScreenState();
}

class _EnterAppScreenState extends State<EnterAppScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      lowerBound: 0.9,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: widget.appBar,
      child: Column(
        children: [
          if (widget.icon != null)
            Expanded(
              child: Hero(
                tag: enterAppIconHeroTag,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: _animation,
                    child: Icon(
                      widget.icon,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          widget.title,
          if (widget.description != null) HeightSpacer.xxs,
          if (widget.description != null) widget.description!,
          HeightSpacer.xxl,
          widget.content,
        ],
      ),
    );
  }
}
