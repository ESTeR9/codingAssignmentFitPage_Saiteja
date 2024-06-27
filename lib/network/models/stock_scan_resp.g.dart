// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_scan_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockScan _$StockScanFromJson(Map<String, dynamic> json) => StockScan(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      tag: json['tag'] as String,
      color: json['color'] as String,
      criteria: (json['criteria'] as List<dynamic>)
          .map((e) => Criteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockScanToJson(StockScan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'color': instance.color,
      'criteria': instance.criteria,
    };

Criteria _$CriteriaFromJson(Map<String, dynamic> json) => Criteria(
      type: json['type'] as String,
      text: json['text'] as String,
      variable: (json['variable'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$CriteriaToJson(Criteria instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('variable', instance.variable);
  return val;
}
