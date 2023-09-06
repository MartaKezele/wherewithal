class Currency {
  final String nativeName;
  final String code;
  final String symbol;
  String? flagAssetPath;

  Currency({
    required this.nativeName,
    required this.code,
    required this.symbol,
    this.flagAssetPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;
}
