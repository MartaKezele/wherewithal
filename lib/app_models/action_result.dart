class ActionResult<T> {
  ActionResult({
    required this.success,
    required this.messageTitle,
    this.messageDescription,
    this.data,
    this.show = true,
  });

  final bool success;
  final String messageTitle;
  final String? messageDescription;
  final T? data;
  final bool? show;
}
