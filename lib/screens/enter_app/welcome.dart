import 'package:flutter/material.dart';
import 'package:wherewithal/components/wrappers/enter_app_screen.dart';
import 'package:wherewithal/constants/styles/filled_button.dart';

import '../../components/social_auth.dart';
import '../../constants/hero_tags.dart';
import '../../constants/spacers.dart';
import '../../extensions/build_context.dart';
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/button_style_button.dart';
import '../../utils/app_localizations.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return EnterAppScreen(
      appBar: AppBar(
        title: const Text('Wherewithal'),
        backgroundColor: Colors.transparent,
      ),
      icon: Icons.wallet_rounded,
      title: Text(
        AppLocalizations.of(context).personalFinanceTracker,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      description: Text(
        'Track your expenses, gain insights and plan for the future to take charge of your finances',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: signInBtnHeroTag,
            child: FilledButton(
              onPressed: () => context.goToSignIn(),
              child: const Text('Sign in'),
            )
                .addColorStyle(colorStyle: FilledButtonStyles.primary(context))
                .addBigStyle(
                  constructor: FilledButton.new,
                ),
          ),
          HeightSpacer.xs,
          Hero(
            tag: createAccountBtnHeroTag,
            child: FilledButton(
              onPressed: () => context.goToCreateAccount(),
              child: const Text('Create account'),
            )
                .addColorStyle(
                    colorStyle: FilledButtonStyles.secondary(context))
                .addBigStyle(
                  constructor: FilledButton.new,
                ),
          ),
          HeightSpacer.xs,
          const SocialAuth(),
        ],
      ),
    );
  }
}
