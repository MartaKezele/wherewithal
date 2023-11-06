class PieSectionData {
  final String id;
  final double value;
  final String legendTitle;
  final double percentage;
  final bool disableLegend;

  PieSectionData({
    required this.id,
    required this.value,
    required this.legendTitle,
    required this.percentage,
    this.disableLegend = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PieSectionData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value &&
          legendTitle == other.legendTitle &&
          percentage == other.percentage &&
          disableLegend == other.disableLegend;

  @override
  int get hashCode => Object.hash(
        runtimeType,
        id,
        value,
        legendTitle,
        percentage,
        disableLegend,
      );
}
