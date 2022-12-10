import 'package:freezed_annotation/freezed_annotation.dart';

part 'prefecture.freezed.dart';
part 'prefecture.g.dart';

@freezed
class Prefecture with _$Prefecture {
  const factory Prefecture({
    @JsonKey(name: 'objectID') required String objectId,
    required String name,
    required String hiragana,
    required String roman,
  }) = _Prefecture;

  factory Prefecture.fromJson(Map<String, dynamic> json) =>
      _$PrefectureFromJson(json);
  const Prefecture._();
}
