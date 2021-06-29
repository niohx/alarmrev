// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return _Alarm.fromJson(json);
}

/// @nodoc
class _$AlarmTearOff {
  const _$AlarmTearOff();

  _Alarm call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'uid') required String uid,
      @JsonKey(name: 'createdAt') required DateTime createdAt,
      @JsonKey(name: 'time') required DateTime wakeUpTime,
      @JsonKey(name: 'isOn') required bool isOn}) {
    return _Alarm(
      id: id,
      uid: uid,
      createdAt: createdAt,
      wakeUpTime: wakeUpTime,
      isOn: isOn,
    );
  }

  Alarm fromJson(Map<String, Object> json) {
    return Alarm.fromJson(json);
  }
}

/// @nodoc
const $Alarm = _$AlarmTearOff();

/// @nodoc
mixin _$Alarm {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  DateTime get wakeUpTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOn')
  bool get isOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'time') DateTime wakeUpTime,
      @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res> implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  final Alarm _value;
  // ignore: unused_field
  final $Res Function(Alarm) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? wakeUpTime = freezed,
    Object? isOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wakeUpTime: wakeUpTime == freezed
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) then) =
      __$AlarmCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'time') DateTime wakeUpTime,
      @JsonKey(name: 'isOn') bool isOn});
}

/// @nodoc
class __$AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res>
    implements _$AlarmCopyWith<$Res> {
  __$AlarmCopyWithImpl(_Alarm _value, $Res Function(_Alarm) _then)
      : super(_value, (v) => _then(v as _Alarm));

  @override
  _Alarm get _value => super._value as _Alarm;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? createdAt = freezed,
    Object? wakeUpTime = freezed,
    Object? isOn = freezed,
  }) {
    return _then(_Alarm(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wakeUpTime: wakeUpTime == freezed
          ? _value.wakeUpTime
          : wakeUpTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOn: isOn == freezed
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Alarm implements _Alarm {
  _$_Alarm(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'time') required this.wakeUpTime,
      @JsonKey(name: 'isOn') required this.isOn});

  factory _$_Alarm.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'time')
  final DateTime wakeUpTime;
  @override
  @JsonKey(name: 'isOn')
  final bool isOn;

  @override
  String toString() {
    return 'Alarm(id: $id, uid: $uid, createdAt: $createdAt, wakeUpTime: $wakeUpTime, isOn: $isOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Alarm &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.wakeUpTime, wakeUpTime) ||
                const DeepCollectionEquality()
                    .equals(other.wakeUpTime, wakeUpTime)) &&
            (identical(other.isOn, isOn) ||
                const DeepCollectionEquality().equals(other.isOn, isOn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(wakeUpTime) ^
      const DeepCollectionEquality().hash(isOn);

  @JsonKey(ignore: true)
  @override
  _$AlarmCopyWith<_Alarm> get copyWith =>
      __$AlarmCopyWithImpl<_Alarm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlarmToJson(this);
  }
}

abstract class _Alarm implements Alarm {
  factory _Alarm(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'uid') required String uid,
      @JsonKey(name: 'createdAt') required DateTime createdAt,
      @JsonKey(name: 'time') required DateTime wakeUpTime,
      @JsonKey(name: 'isOn') required bool isOn}) = _$_Alarm;

  factory _Alarm.fromJson(Map<String, dynamic> json) = _$_Alarm.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'time')
  DateTime get wakeUpTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isOn')
  bool get isOn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmCopyWith<_Alarm> get copyWith => throw _privateConstructorUsedError;
}

AlarmSetting _$AlarmSettingFromJson(Map<String, dynamic> json) {
  return _AlarmSetting.fromJson(json);
}

/// @nodoc
class _$AlarmSettingTearOff {
  const _$AlarmSettingTearOff();

  _AlarmSetting call({@JsonKey(name: 'maxNum') required int maxNum}) {
    return _AlarmSetting(
      maxNum: maxNum,
    );
  }

  AlarmSetting fromJson(Map<String, Object> json) {
    return AlarmSetting.fromJson(json);
  }
}

/// @nodoc
const $AlarmSetting = _$AlarmSettingTearOff();

/// @nodoc
mixin _$AlarmSetting {
  @JsonKey(name: 'maxNum')
  int get maxNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmSettingCopyWith<AlarmSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmSettingCopyWith<$Res> {
  factory $AlarmSettingCopyWith(
          AlarmSetting value, $Res Function(AlarmSetting) then) =
      _$AlarmSettingCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'maxNum') int maxNum});
}

/// @nodoc
class _$AlarmSettingCopyWithImpl<$Res> implements $AlarmSettingCopyWith<$Res> {
  _$AlarmSettingCopyWithImpl(this._value, this._then);

  final AlarmSetting _value;
  // ignore: unused_field
  final $Res Function(AlarmSetting) _then;

  @override
  $Res call({
    Object? maxNum = freezed,
  }) {
    return _then(_value.copyWith(
      maxNum: maxNum == freezed
          ? _value.maxNum
          : maxNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AlarmSettingCopyWith<$Res>
    implements $AlarmSettingCopyWith<$Res> {
  factory _$AlarmSettingCopyWith(
          _AlarmSetting value, $Res Function(_AlarmSetting) then) =
      __$AlarmSettingCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'maxNum') int maxNum});
}

/// @nodoc
class __$AlarmSettingCopyWithImpl<$Res> extends _$AlarmSettingCopyWithImpl<$Res>
    implements _$AlarmSettingCopyWith<$Res> {
  __$AlarmSettingCopyWithImpl(
      _AlarmSetting _value, $Res Function(_AlarmSetting) _then)
      : super(_value, (v) => _then(v as _AlarmSetting));

  @override
  _AlarmSetting get _value => super._value as _AlarmSetting;

  @override
  $Res call({
    Object? maxNum = freezed,
  }) {
    return _then(_AlarmSetting(
      maxNum: maxNum == freezed
          ? _value.maxNum
          : maxNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlarmSetting implements _AlarmSetting {
  _$_AlarmSetting({@JsonKey(name: 'maxNum') required this.maxNum});

  factory _$_AlarmSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_AlarmSettingFromJson(json);

  @override
  @JsonKey(name: 'maxNum')
  final int maxNum;

  @override
  String toString() {
    return 'AlarmSetting(maxNum: $maxNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AlarmSetting &&
            (identical(other.maxNum, maxNum) ||
                const DeepCollectionEquality().equals(other.maxNum, maxNum)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(maxNum);

  @JsonKey(ignore: true)
  @override
  _$AlarmSettingCopyWith<_AlarmSetting> get copyWith =>
      __$AlarmSettingCopyWithImpl<_AlarmSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AlarmSettingToJson(this);
  }
}

abstract class _AlarmSetting implements AlarmSetting {
  factory _AlarmSetting({@JsonKey(name: 'maxNum') required int maxNum}) =
      _$_AlarmSetting;

  factory _AlarmSetting.fromJson(Map<String, dynamic> json) =
      _$_AlarmSetting.fromJson;

  @override
  @JsonKey(name: 'maxNum')
  int get maxNum => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AlarmSettingCopyWith<_AlarmSetting> get copyWith =>
      throw _privateConstructorUsedError;
}
