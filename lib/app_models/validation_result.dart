class ValidationResult {
  ValidationResult({
    required this.success,
    this.message,
  });

  final bool success;
  final String? message;
}
