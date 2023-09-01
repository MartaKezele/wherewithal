import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wherewithal/components/wrappers/screen.dart';
import 'package:wherewithal/extensions/button/button_style_button.dart';
import 'package:wherewithal/extensions/button/filled_button.dart';
import 'package:wherewithal/utils/overlay_banner.dart';

import '../../change_notifiers/auth.dart';
import '../../constants/query_param_keys.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../dal/repo_factory.dart';
import '../../app_models/action_result.dart';

class GoogleReauth extends StatefulWidget {
  const GoogleReauth({
    super.key,
    required this.nextRouteName,
  });

  final String nextRouteName;

  @override
  State<GoogleReauth> createState() => _GoogleReauthState();
}

class _GoogleReauthState extends State<GoogleReauth> {
  bool _reauthenticating = false;
  OverlayEntry? _resultBanner;
  bool _showRetryBtn = false;

  Future<void> _reauthenticate() async {
    setState(() {
      _reauthenticating = true;
      _showRetryBtn = false;
    });

    if (AuthChangeNotifier.instance.email == null) {
      setState(() {
        _reauthenticating = false;
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: 'You\'re not signed in.',
          ),
        );
      });
      return;
    }

    await RepoFactory.authRepo().reauthWithGoogle().then((result) {
      setState(() {
        _reauthenticating = false;
        _showRetryBtn = !result.success;
      });

      if (result.success) {
        context.pushReplacementNamed(
          widget.nextRouteName,
          queryParameters: {
            QueryParamKeys.hasReauthenticated: true.toString(),
          },
        );
      } else {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _reauthenticate());
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                _reauthenticating
                    ? 'Reauthenticating with google account'
                    : 'Reauthenticate with google account',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          HeightSpacer.md,
          Visibility(
            visible: _reauthenticating == true,
            child: const CircularProgressIndicator(),
          ),
          Visibility(
            visible: _showRetryBtn,
            child: FilledButton(
              onPressed: _reauthenticate,
              child: const Text('Retry'),
            )
                .addColorStyle(colorStyle: FilledButtonStyles.primary(context))
                .loadingBtn(
                  constructor: FilledButton.new,
                  isLoading: _reauthenticating,
                  colorStyle: FilledButtonStyles.primary(context),
                ),
          ),
        ],
      ),
    );
  }
}
