class ReceiptApiQuotaData {
  static const quotaField = 'quota';
  static const quotaUsedField = 'quotaUsed';
  static const currentMonthField = 'currentMonth';

  final int quota;
  final int quotaUsed;
  final String currentMonth;

  ReceiptApiQuotaData({
    required this.quota,
    required this.quotaUsed,
    required this.currentMonth,
  });

  factory ReceiptApiQuotaData.fromJson(Map<String, dynamic> json) {
    return ReceiptApiQuotaData(
      quota: json[quotaField],
      quotaUsed: json[quotaUsedField],
      currentMonth: json[currentMonthField],
    );
  }
}
