import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../change_notifiers/auth.dart';
import '../../change_notifiers/repo_factory.dart';
import '../../components/error_content.dart';
import '../../components/loading_content.dart';
import '../../constants/padding_size.dart';
import '../../l10n/app_localizations.dart';
import '../../models/models.dart' as models;
import '../../utils/overlay_banner.dart';

class Notifications extends StatefulWidget with GetItStatefulWidgetMixin {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> with GetItStateMixin {
  OverlayEntry? _resultBanner;

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    final errorContent = Center(
      child: Padding(
        padding: const EdgeInsets.all(PaddingSize.md),
        child: ErrorContent(
          text: localizations.couldNotLoadCategoriesFilter,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.notifications),
      ),
      body: FirestoreBuilder(
        ref: models.usersRef.doc(userId),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return errorContent;
          }

          if (!snapshot.hasData) {
            return const LoadingContent();
          }

          final user = snapshot.requireData.data;

          if (user == null) {
            return errorContent;
          }

          return Column(
            children: [
              SwitchListTile(
                title: Text(localizations.recurringTransactionsNotifications),
                subtitle: Text(
                  localizations.remindsAboutUpcomingScheduledPayments,
                ),
                value: user.recurringTransactionsNotifications,
                onChanged: (value) async {
                  await GetIt.I<RepoFactoryChangeNotifier>()
                      .repoFactory
                      .userRepo2
                      .updateNotifications(
                        id: user.id,
                        recurringTransactionsNotifications: value,
                      )
                      .then((result) {
                    if (!result.success) {
                      _resultBanner = showActionResultOverlayBanner(
                        context,
                        result,
                      );
                    }
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
