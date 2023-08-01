import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../change_notifiers/auth.dart';
import '../../components/action_result_message.dart';
import '../../components/buttons/loading_label_button.dart';
import '../../constants/query_param_keys.dart';
import '../../dal/repo_factory.dart';
import '../../models/action_result.dart';

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
  ActionResult? _result;

  Future<void> _reauthenticate() async {
    setState(() {
      _result = null;
      _reauthenticating = true;
    });

    if (Auth.instance.email == null) {
      setState(() {
        _result = ActionResult(
          success: false,
          message: 'You\'re not signed in.',
        );
        _reauthenticating = false;
      });
      return;
    }

    RepoFactory.authRepo().reauthWithGoogle().then((result) {
      setState(() {
        _result = result;
        _reauthenticating = false;
      });

      if (result.success) {
        context.pushReplacementNamed(
          widget.nextRouteName,
          queryParameters: {
            QueryParamKeys.hasReauthenticated: true.toString(),
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _reauthenticate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Reauthenticate with google account'),
          Visibility(
            visible: _result == null,
            child: const CircularProgressIndicator(),
          ),
          Visibility(
            visible: _result != null && !_result!.success,
            child: LoadingLabelButton(
              label: 'Retry',
              onPressed: _reauthenticate,
              isLoading: _reauthenticating,
              constructor: TextButton.new,
            ),
          ),
          ActionResultMessage(
            result: _result,
          ),
        ],
      ),
    );
  }
}
