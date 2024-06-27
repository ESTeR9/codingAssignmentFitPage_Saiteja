import 'package:json_annotation/json_annotation.dart';

part "stock_scan_resp.g.dart";

@JsonSerializable(includeIfNull: false)
class StockScan {
  @JsonKey(name: "id")
  late int id;

  @JsonKey(name: "name")
  late String name;

  @JsonKey(name: "tag")
  late String tag;

  @JsonKey(name: "color")
  late String color;

  @JsonKey(name: "criteria")
  late List<Criteria> criteria;

  StockScan(
      {required this.id,
      required this.name,
      required this.tag,
      required this.color,
      required this.criteria});

  factory StockScan.fromJson(Map<String, dynamic> json) =>
      _$StockScanFromJson(json);

  Map<String, dynamic> toJson() => _$StockScanToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Criteria {
  @JsonKey(name: "type")
  late String type;

  @JsonKey(name: "text")
  late String text;

  @JsonKey(name: "variable")
  Map<String, Map<String, dynamic>>? variable;

  Criteria({required this.type, required this.text, this.variable});

  factory Criteria.fromJson(Map<String, dynamic> json) =>
      _$CriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$CriteriaToJson(this);
}
