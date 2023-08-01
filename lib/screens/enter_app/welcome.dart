import 'package:flutter/material.dart';

import '../../components/social_auth.dart';
import '../../extensions/build_context.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Welcome'),
          const SocialAuth(),
          ElevatedButton(
            onPressed: () => context.navigateToSignIn(),
            child: const Text('Sign in'),
          ),
          ElevatedButton(
            onPressed: () => context.navigateToCreateAccount(),
            child: const Text('Create account'),
          ),
        ],
      ),
    );
  }
}
