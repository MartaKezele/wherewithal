import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../app_models/action_result.dart';
import '../change_notifiers/auth.dart';
import '../change_notifiers/repo_factory.dart';
import '../components/wrappers/screen.dart';
import '../constants/spacers.dart';
import '../constants/styles/filled_button.dart';
import '../l10n/app_localizations.dart';
import '../utils/overlay_banner.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

class DataSetupScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  DataSetupScreen({super.key});

  @override
  State<DataSetupScreen> createState() => _DataSetupScreenState();
}

class _DataSetupScreenState extends State<DataSetupScreen>
    with GetItStateMixin {
  bool _settingUpData = false;
  OverlayEntry? _resultBanner;
  bool _showRetryBtn = false;

  Future<void> _setUpData() async {
    setState(() {
      _settingUpData = true;
      _showRetryBtn = false;
    });

    if (GetIt.I<AuthChangeNotifier>().uid == null) {
      setState(() {
        _settingUpData = false;
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

    if (!GetIt.I<AuthChangeNotifier>().shouldSetUpUserData) {
      setState(() {
        _settingUpData = false;
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: AppLocalizations.of(context).dataIsSetUp,
          ),
        );
      });
      return;
    }

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .userRepo2
        .create(GetIt.I<AuthChangeNotifier>().uid!)
        .then((result) {
      setState(() {
        _settingUpData = false;
      });
      if (!result.success) {
        setState(() {
          _showRetryBtn = true;
        });
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _setUpData());
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final shouldSetUpUserData = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.shouldSetUpUserData,
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
                  _settingUpData
                      ? localizations.settingUpData
                      : localizations.setUpData,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          HeightSpacer.md,
          Visibility(
            visible: _settingUpData == true,
            child: const CircularProgressIndicator(),
          ),
          Visibility(
            visible: _showRetryBtn && shouldSetUpUserData,
            child: FilledButton(
              onPressed: _setUpData,
              child: Text(localizations.retry),
            ).colorStyle(FilledButtonStyles.primaryContainer).loadingBtn(
                  constructor: FilledButton.new,
                  isLoading: _settingUpData,
                  colorStyle: FilledButtonStyles.primaryContainer,
                ),
          ),
        ],
      ),
    );
  }
}
