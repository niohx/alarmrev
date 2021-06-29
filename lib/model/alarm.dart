import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';
part 'alarm.g.dart';

//うまく
@freezed
class Alarm with _$Alarm {
  factory Alarm({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'time') required DateTime wakeUpTime,
    @JsonKey(name: 'isOn') required bool isOn,
  }) = _Alarm;
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}

@freezed
class AlarmSetting with _$AlarmSetting {
  factory AlarmSetting({
    @JsonKey(name: 'maxNum') required int maxNum,
  }) = _AlarmSetting;
  factory AlarmSetting.fromJson(Map<String, dynamic> json) =>
      _$AlarmSettingFromJson(json);
}
