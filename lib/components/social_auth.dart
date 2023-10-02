import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../change_notifiers/repo_factory.dart';
import '../constants/hero_tags.dart';
import '../constants/styles/outlined_button.dart';
import '../extensions/button/button_style_button.dart';
import '../extensions/button/outlined_button.dart';
import '../l10n/app_localizations.dart';
import '../utils/overlay_banner.dart';

class SocialAuth extends StatefulWidget {
  const SocialAuth({super.key});

  @override
  State<SocialAuth> createState() => _SocialAuthState();
}

class _SocialAuthState extends State<SocialAuth> {
  final _googleIcon = SvgPicture.asset(
    'assets/icons/google.svg',
    semanticsLabel: 'Google logo',
  );

  bool _loading = false;
  OverlayEntry? _resultBanner;

  Future<void> _continueWithGoogle() async {
    setState(() {
      _loading = true;
    });

    await GetIt.I<RepoFactoryChangeNotifier>()
        .repoFactory
        .authRepo
        .continueWithGoogle()
        .then((result) {
      setState(() {
        _loading = false;
      });
      if (!result.success) {
        _resultBanner = showActionResultOverlayBanner(context, result);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Hero(
          tag: socialAuthHeroTag,
          child: OutlinedButton(
            onPressed: _loading ? null : _continueWithGoogle,
            child: Text(localizations.continueWithGoogle),
          )
              .colorStyle(OutlinedButtonStyles.inverseSurface)
              .bigHeight(constructor: OutlinedButton.new)
              .loadingBtn(
                constructor: OutlinedButton.new,
                isLoading: _loading,
                colorStyle: OutlinedButtonStyles.primary,
                icon: _googleIcon,
              ),
        ),
      ],
    );
  }
}
