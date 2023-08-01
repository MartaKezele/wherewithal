import 'package:go_router/go_router.dart';

class NamedGoRoute extends GoRoute {
  NamedGoRoute({
    required this.nonNullableName,
    required super.path,
    required super.builder,
    super.routes,
    super.redirect,
  }) : super(
          name: nonNullableName,
        );

  final String nonNullableName;
}