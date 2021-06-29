// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarm _$_$_AlarmFromJson(Map<String, dynamic> json) {
  return _$_Alarm(
    id: json['id'] as int,
    uid: json['uid'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    wakeUpTime: DateTime.parse(json['time'] as String),
    isOn: json['isOn'] as bool,
  );
}

Map<String, dynamic> _$_$_AlarmToJson(_$_Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
      'time': instance.wakeUpTime.toIso8601String(),
      'isOn': instance.isOn,
    };

_$_AlarmSetting _$_$_AlarmSettingFromJson(Map<String, dynamic> json) {
  return _$_AlarmSetting(
    maxNum: json['maxNum'] as int,
  );
}

Map<String, dynamic> _$_$_AlarmSettingToJson(_$_AlarmSetting instance) =>
    <String, dynamic>{
      'maxNum': instance.maxNum,
    };
