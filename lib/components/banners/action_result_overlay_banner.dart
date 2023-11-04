import 'package:flutter/material.dart';

import '../../app_models/action_result.dart';
import '../../app_models/color_style.dart';
import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/action_result.dart';
import '../../constants/styles/container.dart';
import '../../constants/styles/overlay_banner.dart';
import '../../l10n/app_localizations.dart';
import '../../extensions/button/text_button.dart';
import '../drag_indicator.dart';

class ActionResultOverlayBanner extends StatefulWidget {
  const ActionResultOverlayBanner({
    Key? key,
    required this.onDismissed,
    required this.result,
  }) : super(key: key);

  final VoidCallback onDismissed;
  final ActionResult result;

  @override
  State<ActionResultOverlayBanner> createState() =>
      _ActionResultOverlayBannerState();
}

class _ActionResultOverlayBannerState extends State<ActionResultOverlayBanner>
    with SingleTickerProviderStateMixin {
  static const Curve _curve = Curves.easeOut;
  static const _animationDuration = Duration(milliseconds: animationDurationMs);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _animationDuration,
  );

  bool _entering = false;

  Future<void> _playEnterAnimation() async {
    setState(() {
      _entering = true;
    });
    await _controller.forward();
  }

  Future<void> _playExitAnimation() async {
    setState(() {
      _entering = false;
    });
    await _controller.reverse();
    widget.onDismissed.call();
  }

  void _dismissByDragging() {
    setState(() {
      _entering = false;
    });
    widget.onDismissed.call();
  }

  @override
  void initState() {
    super.initState();
    _playEnterAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final ColorStyle buttonColorStyle = textBtnActionResultColorStyle(
      resultSuccess: widget.result.success,
    );

    final Color containerColor = actionResultContainerColor(
      context: context,
      resultSuccess: widget.result.success,
    );

    final Color textColor = actionResultTextColor(
      context: context,
      resultSuccess: widget.result.success,
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedOpacity(
          opacity: _entering ? 1.0 : 0.0,
          duration: _animationDuration,
          curve: Curves.easeInCubic,
          child: SafeArea(
            child: GestureDetector(
              onTap: _playExitAnimation,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          builder: (context, child) {
            final double animationValue = _curve.transform(_controller.value);
            return FractionalTranslation(
              translation: Offset(0, 1 - animationValue),
              child: child,
            );
          },
          animation: _controller,
          child: SafeArea(
            child: Dismissible(
              direction: DismissDirection.down,
              key: const Key('dismissibleOverlayBanner'),
              onDismissed: (_) => _dismissByDragging(),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(containerBorderRadius),
                      topRight: Radius.circular(containerBorderRadius),
                    ),
                    color: containerColor,
                  ),
                  padding: const EdgeInsets.only(
                    top: PaddingSize.xxs,
                    bottom: PaddingSize.md,
                    left: PaddingSize.md,
                    right: PaddingSize.md,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [DragIndicator(color: textColor)],
                      ),
                      HeightSpacer.lg,
                      Text(
                        widget.result.messageTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: textColor,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      HeightSpacer.sm,
                      if (widget.result.messageDescription != null)
                        Text(
                          widget.result.messageDescription!,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: textColor,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      HeightSpacer.sm,
                      TextButton(
                        onPressed: _playExitAnimation,
                        child: Text(localizations.close.toUpperCase()),
                      ).colorStyle(buttonColorStyle)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
