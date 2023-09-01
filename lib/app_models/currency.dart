class Currency {
  final String _nativeName;
  final String _code;
  final String _symbol;
  String? flagAssetPath;

  Currency({
    required String nativeName,
    required String code,
    required String symbol,
    this.flagAssetPath,
  })  : _nativeName = nativeName,
        _code = code,
        _symbol = symbol;

  String get nativeName => _nativeName;

  String get code => _code;

  String get symbol => _symbol;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Currency &&
          runtimeType == other.runtimeType &&
          _code == other._code;

  @override
  int get hashCode => _code.hashCode;
}
