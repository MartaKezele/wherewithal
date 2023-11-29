import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../../change_notifiers/auth.dart';
import '../../change_notifiers/repo_factory.dart';
import '../../components/wrappers/screen.dart';
import '../../config/auth_provider.dart';
import '../../config/keys/query_param.dart';
import '../../config/routes.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../app_models/action_result.dart';
import '../../constants/styles/text_button.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/overlay_banner.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';
import '../../extensions/button/text_button.dart';

class GoogleReauth extends StatefulWidget with GetItStatefulWidgetMixin {
  GoogleReauth({
    super.key,
    required this.nextRouteName,
  });

  final String nextRouteName;

  @override
  State<GoogleReauth> createState() => _GoogleReauthState();
}

class _GoogleReauthState extends State<GoogleReauth> with GetItStateMixin {
  bool _reauthenticating = false;
  OverlayEntry? _resultBanner;
  bool _showRetryBtn = false;

  Future<void> _reauthenticate() async {
    setState(() {
      _reauthenticating = true;
      _showRetryBtn = false;
    });

    if (GetIt.I<AuthChangeNotifier>().email == null) {
      setState(() {
        _reauthenticating = false;
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: AppLocalizations.of(context).notSignedIn,
          ),
        );
      });
      return;
    }

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .reauthWithGoogle()
        .then((result) {
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
    final localizations = AppLocalizations.of(context);

    final authProviders = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.authProviders,
    );

    return Screen(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Text(
                  _reauthenticating
                      ? localizations.reauthenticatingWithGoogle
                      : localizations.reauthenticateWithGoogle,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
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
              child: Text(localizations.retry),
            ).colorStyle(FilledButtonStyles.primaryContainer).loadingBtn(
                  constructor: FilledButton.new,
                  isLoading: _reauthenticating,
                  colorStyle: FilledButtonStyles.primaryContainer,
                ),
          ),
          HeightSpacer.md,
          Visibility(
            visible:
                _showRetryBtn && authProviders.contains(AuthProvider.password),
            child: TextButton(
              onPressed: () => context.push(
                  '${TopLevelRoutes.passwordReauth.path}?${QueryParamKeys.nextRouteName}=${widget.nextRouteName}'),
              child: Text(localizations.reauthenticateWithPassword),
            ).colorStyle(TextButtonStyles.primary),
          ),
        ],
      ),
    );
  }
}
