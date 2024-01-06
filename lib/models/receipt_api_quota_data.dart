class ReceiptApiQuotaData {
  static const _quotaField = 'quota';
  static const _quotaUsedField = 'quotaUsed';
  static const _currentMonthField = 'currentMonth';

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
      quota: json[_quotaField],
      quotaUsed: json[_quotaUsedField],
      currentMonth: json[_currentMonthField],
    );
  }
}
