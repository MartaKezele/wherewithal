import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_models/action_result.dart';
import '../../../constants/styles/text_button.dart';
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/text_button.dart';
import '../../../extensions/button/button_style_button.dart';

class SubmitDialogButton extends StatefulWidget {
  const SubmitDialogButton({
    super.key,
    required this.onSubmit,
    required this.text,
    required this.formKey,
  });

  final Future<ActionResult> Function() onSubmit;
  final String text;
  final GlobalKey<dynamic> formKey;

  @override
  State<SubmitDialogButton> createState() => _SubmitDialogButtonState();
}

class _SubmitDialogButtonState extends State<SubmitDialogButton> {
  bool _submitting = false;
  OverlayEntry? _resultBanner;

  Future<void> _submit() async {
    setState(() {
      _submitting = true;
    });
    await widget.onSubmit().then((result) {
      setState(() {
        _submitting = false;
      });
      if (result.success) {
        context.pop(result);
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => executeFnIfFormValid(
        formKey: widget.formKey,
        fn: _submit,
      ),
      child: Text(widget.text),
    ).colorStyle(TextButtonStyles.surface).loadingBtn(
          constructor: TextButton.new,
          isLoading: _submitting,
          colorStyle: TextButtonStyles.surface,
        );
  }
}
