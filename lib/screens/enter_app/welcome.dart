import 'package:flutter/material.dart';

import '../../components/social_auth.dart';
import '../../components/wrappers/enter_app_screen.dart';
import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../extensions/build_context.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';
import '../../utils/app_localizations.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return EnterAppScreen(
      appBar: AppBar(
        title: Text(localizations.wherewithal),
        backgroundColor: Colors.transparent,
      ),
      icon: Icons.wallet_rounded,
      title: Text(
        localizations.personalFinanceTracker,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      description: Text(
        localizations.appPossibilitiesDescription,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: signInBtnHeroTag,
            child: FilledButton(
              onPressed: () => context.goToSignIn(),
              child: Text(localizations.signIn),
            )
                .addColorStyle(FilledButtonStyles.primary)
                .addBigHeight(constructor: FilledButton.new),
          ),
          HeightSpacer.xs,
          Hero(
            tag: createAccountBtnHeroTag,
            child: FilledButton(
              onPressed: () => context.goToCreateAccount(),
              child: Text(localizations.createAccount),
            )
                .addColorStyle(FilledButtonStyles.secondary)
                .addBigHeight(constructor: FilledButton.new),
          ),
          HeightSpacer.xs,
          const SocialAuth(),
        ],
      ),
    );
  }
}
