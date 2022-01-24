// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GeneralManagerTearOff {
  const _$GeneralManagerTearOff();

  _GeneralManager call(
      {String status = 'まじもタイマーへようこそ！',
      bool topToast = false,
      int toastDuration = 3,
      double opacity = 1,
      bool showFAB = false}) {
    return _GeneralManager(
      status: status,
      topToast: topToast,
      toastDuration: toastDuration,
      opacity: opacity,
      showFAB: showFAB,
    );
  }
}

/// @nodoc
const $GeneralManager = _$GeneralManagerTearOff();

/// @nodoc
mixin _$GeneralManager {
  String get status => throw _privateConstructorUsedError;
  bool get topToast => throw _privateConstructorUsedError;
  int get toastDuration => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;
  bool get showFAB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralManagerCopyWith<GeneralManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralManagerCopyWith<$Res> {
  factory $GeneralManagerCopyWith(
          GeneralManager value, $Res Function(GeneralManager) then) =
      _$GeneralManagerCopyWithImpl<$Res>;
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB});
}

/// @nodoc
class _$GeneralManagerCopyWithImpl<$Res>
    implements $GeneralManagerCopyWith<$Res> {
  _$GeneralManagerCopyWithImpl(this._value, this._then);

  final GeneralManager _value;
  // ignore: unused_field
  final $Res Function(GeneralManager) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? topToast = freezed,
    Object? toastDuration = freezed,
    Object? opacity = freezed,
    Object? showFAB = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      topToast: topToast == freezed
          ? _value.topToast
          : topToast // ignore: cast_nullable_to_non_nullable
              as bool,
      toastDuration: toastDuration == freezed
          ? _value.toastDuration
          : toastDuration // ignore: cast_nullable_to_non_nullable
              as int,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      showFAB: showFAB == freezed
          ? _value.showFAB
          : showFAB // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GeneralManagerCopyWith<$Res>
    implements $GeneralManagerCopyWith<$Res> {
  factory _$GeneralManagerCopyWith(
          _GeneralManager value, $Res Function(_GeneralManager) then) =
      __$GeneralManagerCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB});
}

/// @nodoc
class __$GeneralManagerCopyWithImpl<$Res>
    extends _$GeneralManagerCopyWithImpl<$Res>
    implements _$GeneralManagerCopyWith<$Res> {
  __$GeneralManagerCopyWithImpl(
      _GeneralManager _value, $Res Function(_GeneralManager) _then)
      : super(_value, (v) => _then(v as _GeneralManager));

  @override
  _GeneralManager get _value => super._value as _GeneralManager;

  @override
  $Res call({
    Object? status = freezed,
    Object? topToast = freezed,
    Object? toastDuration = freezed,
    Object? opacity = freezed,
    Object? showFAB = freezed,
  }) {
    return _then(_GeneralManager(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      topToast: topToast == freezed
          ? _value.topToast
          : topToast // ignore: cast_nullable_to_non_nullable
              as bool,
      toastDuration: toastDuration == freezed
          ? _value.toastDuration
          : toastDuration // ignore: cast_nullable_to_non_nullable
              as int,
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
      showFAB: showFAB == freezed
          ? _value.showFAB
          : showFAB // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GeneralManager extends _GeneralManager with DiagnosticableTreeMixin {
  const _$_GeneralManager(
      {this.status = 'まじもタイマーへようこそ！',
      this.topToast = false,
      this.toastDuration = 3,
      this.opacity = 1,
      this.showFAB = false})
      : super._();

  @JsonKey()
  @override
  final String status;
  @JsonKey()
  @override
  final bool topToast;
  @JsonKey()
  @override
  final int toastDuration;
  @JsonKey()
  @override
  final double opacity;
  @JsonKey()
  @override
  final bool showFAB;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeneralManager(status: $status, topToast: $topToast, toastDuration: $toastDuration, opacity: $opacity, showFAB: $showFAB)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralManager'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('topToast', topToast))
      ..add(DiagnosticsProperty('toastDuration', toastDuration))
      ..add(DiagnosticsProperty('opacity', opacity))
      ..add(DiagnosticsProperty('showFAB', showFAB));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeneralManager &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.topToast, topToast) &&
            const DeepCollectionEquality()
                .equals(other.toastDuration, toastDuration) &&
            const DeepCollectionEquality().equals(other.opacity, opacity) &&
            const DeepCollectionEquality().equals(other.showFAB, showFAB));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(topToast),
      const DeepCollectionEquality().hash(toastDuration),
      const DeepCollectionEquality().hash(opacity),
      const DeepCollectionEquality().hash(showFAB));

  @JsonKey(ignore: true)
  @override
  _$GeneralManagerCopyWith<_GeneralManager> get copyWith =>
      __$GeneralManagerCopyWithImpl<_GeneralManager>(this, _$identity);
}

abstract class _GeneralManager extends GeneralManager {
  const factory _GeneralManager(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB}) = _$_GeneralManager;
  const _GeneralManager._() : super._();

  @override
  String get status;
  @override
  bool get topToast;
  @override
  int get toastDuration;
  @override
  double get opacity;
  @override
  bool get showFAB;
  @override
  @JsonKey(ignore: true)
  _$GeneralManagerCopyWith<_GeneralManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ThemeManagerTearOff {
  const _$ThemeManagerTearOff();

  _ThemeManager call({int theme = 0}) {
    return _ThemeManager(
      theme: theme,
    );
  }
}

/// @nodoc
const $ThemeManager = _$ThemeManagerTearOff();

/// @nodoc
mixin _$ThemeManager {
  int get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeManagerCopyWith<ThemeManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeManagerCopyWith<$Res> {
  factory $ThemeManagerCopyWith(
          ThemeManager value, $Res Function(ThemeManager) then) =
      _$ThemeManagerCopyWithImpl<$Res>;
  $Res call({int theme});
}

/// @nodoc
class _$ThemeManagerCopyWithImpl<$Res> implements $ThemeManagerCopyWith<$Res> {
  _$ThemeManagerCopyWithImpl(this._value, this._then);

  final ThemeManager _value;
  // ignore: unused_field
  final $Res Function(ThemeManager) _then;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ThemeManagerCopyWith<$Res>
    implements $ThemeManagerCopyWith<$Res> {
  factory _$ThemeManagerCopyWith(
          _ThemeManager value, $Res Function(_ThemeManager) then) =
      __$ThemeManagerCopyWithImpl<$Res>;
  @override
  $Res call({int theme});
}

/// @nodoc
class __$ThemeManagerCopyWithImpl<$Res> extends _$ThemeManagerCopyWithImpl<$Res>
    implements _$ThemeManagerCopyWith<$Res> {
  __$ThemeManagerCopyWithImpl(
      _ThemeManager _value, $Res Function(_ThemeManager) _then)
      : super(_value, (v) => _then(v as _ThemeManager));

  @override
  _ThemeManager get _value => super._value as _ThemeManager;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_ThemeManager(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ThemeManager extends _ThemeManager with DiagnosticableTreeMixin {
  const _$_ThemeManager({this.theme = 0}) : super._();

  @JsonKey()
  @override
  final int theme;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeManager(theme: $theme)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeManager'))
      ..add(DiagnosticsProperty('theme', theme));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeManager &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$ThemeManagerCopyWith<_ThemeManager> get copyWith =>
      __$ThemeManagerCopyWithImpl<_ThemeManager>(this, _$identity);
}

abstract class _ThemeManager extends ThemeManager {
  const factory _ThemeManager({int theme}) = _$_ThemeManager;
  const _ThemeManager._() : super._();

  @override
  int get theme;
  @override
  @JsonKey(ignore: true)
  _$ThemeManagerCopyWith<_ThemeManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LangManagerTearOff {
  const _$LangManagerTearOff();

  _LangManager call({int lang = 0}) {
    return _LangManager(
      lang: lang,
    );
  }
}

/// @nodoc
const $LangManager = _$LangManagerTearOff();

/// @nodoc
mixin _$LangManager {
  int get lang => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LangManagerCopyWith<LangManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangManagerCopyWith<$Res> {
  factory $LangManagerCopyWith(
          LangManager value, $Res Function(LangManager) then) =
      _$LangManagerCopyWithImpl<$Res>;
  $Res call({int lang});
}

/// @nodoc
class _$LangManagerCopyWithImpl<$Res> implements $LangManagerCopyWith<$Res> {
  _$LangManagerCopyWithImpl(this._value, this._then);

  final LangManager _value;
  // ignore: unused_field
  final $Res Function(LangManager) _then;

  @override
  $Res call({
    Object? lang = freezed,
  }) {
    return _then(_value.copyWith(
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LangManagerCopyWith<$Res>
    implements $LangManagerCopyWith<$Res> {
  factory _$LangManagerCopyWith(
          _LangManager value, $Res Function(_LangManager) then) =
      __$LangManagerCopyWithImpl<$Res>;
  @override
  $Res call({int lang});
}

/// @nodoc
class __$LangManagerCopyWithImpl<$Res> extends _$LangManagerCopyWithImpl<$Res>
    implements _$LangManagerCopyWith<$Res> {
  __$LangManagerCopyWithImpl(
      _LangManager _value, $Res Function(_LangManager) _then)
      : super(_value, (v) => _then(v as _LangManager));

  @override
  _LangManager get _value => super._value as _LangManager;

  @override
  $Res call({
    Object? lang = freezed,
  }) {
    return _then(_LangManager(
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LangManager extends _LangManager with DiagnosticableTreeMixin {
  const _$_LangManager({this.lang = 0}) : super._();

  @JsonKey()
  @override
  final int lang;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LangManager(lang: $lang)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LangManager'))
      ..add(DiagnosticsProperty('lang', lang));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LangManager &&
            const DeepCollectionEquality().equals(other.lang, lang));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lang));

  @JsonKey(ignore: true)
  @override
  _$LangManagerCopyWith<_LangManager> get copyWith =>
      __$LangManagerCopyWithImpl<_LangManager>(this, _$identity);
}

abstract class _LangManager extends LangManager {
  const factory _LangManager({int lang}) = _$_LangManager;
  const _LangManager._() : super._();

  @override
  int get lang;
  @override
  @JsonKey(ignore: true)
  _$LangManagerCopyWith<_LangManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ClockManagerTearOff {
  const _$ClockManagerTearOff();

  _ClockManager call(
      {bool is24 = true, bool showSec = true, int animation = 0}) {
    return _ClockManager(
      is24: is24,
      showSec: showSec,
      animation: animation,
    );
  }
}

/// @nodoc
const $ClockManager = _$ClockManagerTearOff();

/// @nodoc
mixin _$ClockManager {
  bool get is24 => throw _privateConstructorUsedError;
  bool get showSec => throw _privateConstructorUsedError;
  int get animation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClockManagerCopyWith<ClockManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockManagerCopyWith<$Res> {
  factory $ClockManagerCopyWith(
          ClockManager value, $Res Function(ClockManager) then) =
      _$ClockManagerCopyWithImpl<$Res>;
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class _$ClockManagerCopyWithImpl<$Res> implements $ClockManagerCopyWith<$Res> {
  _$ClockManagerCopyWithImpl(this._value, this._then);

  final ClockManager _value;
  // ignore: unused_field
  final $Res Function(ClockManager) _then;

  @override
  $Res call({
    Object? is24 = freezed,
    Object? showSec = freezed,
    Object? animation = freezed,
  }) {
    return _then(_value.copyWith(
      is24: is24 == freezed
          ? _value.is24
          : is24 // ignore: cast_nullable_to_non_nullable
              as bool,
      showSec: showSec == freezed
          ? _value.showSec
          : showSec // ignore: cast_nullable_to_non_nullable
              as bool,
      animation: animation == freezed
          ? _value.animation
          : animation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ClockManagerCopyWith<$Res>
    implements $ClockManagerCopyWith<$Res> {
  factory _$ClockManagerCopyWith(
          _ClockManager value, $Res Function(_ClockManager) then) =
      __$ClockManagerCopyWithImpl<$Res>;
  @override
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class __$ClockManagerCopyWithImpl<$Res> extends _$ClockManagerCopyWithImpl<$Res>
    implements _$ClockManagerCopyWith<$Res> {
  __$ClockManagerCopyWithImpl(
      _ClockManager _value, $Res Function(_ClockManager) _then)
      : super(_value, (v) => _then(v as _ClockManager));

  @override
  _ClockManager get _value => super._value as _ClockManager;

  @override
  $Res call({
    Object? is24 = freezed,
    Object? showSec = freezed,
    Object? animation = freezed,
  }) {
    return _then(_ClockManager(
      is24: is24 == freezed
          ? _value.is24
          : is24 // ignore: cast_nullable_to_non_nullable
              as bool,
      showSec: showSec == freezed
          ? _value.showSec
          : showSec // ignore: cast_nullable_to_non_nullable
              as bool,
      animation: animation == freezed
          ? _value.animation
          : animation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ClockManager extends _ClockManager with DiagnosticableTreeMixin {
  const _$_ClockManager(
      {this.is24 = true, this.showSec = true, this.animation = 0})
      : super._();

  @JsonKey()
  @override
  final bool is24;
  @JsonKey()
  @override
  final bool showSec;
  @JsonKey()
  @override
  final int animation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClockManager(is24: $is24, showSec: $showSec, animation: $animation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClockManager'))
      ..add(DiagnosticsProperty('is24', is24))
      ..add(DiagnosticsProperty('showSec', showSec))
      ..add(DiagnosticsProperty('animation', animation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClockManager &&
            const DeepCollectionEquality().equals(other.is24, is24) &&
            const DeepCollectionEquality().equals(other.showSec, showSec) &&
            const DeepCollectionEquality().equals(other.animation, animation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(is24),
      const DeepCollectionEquality().hash(showSec),
      const DeepCollectionEquality().hash(animation));

  @JsonKey(ignore: true)
  @override
  _$ClockManagerCopyWith<_ClockManager> get copyWith =>
      __$ClockManagerCopyWithImpl<_ClockManager>(this, _$identity);
}

abstract class _ClockManager extends ClockManager {
  const factory _ClockManager({bool is24, bool showSec, int animation}) =
      _$_ClockManager;
  const _ClockManager._() : super._();

  @override
  bool get is24;
  @override
  bool get showSec;
  @override
  int get animation;
  @override
  @JsonKey(ignore: true)
  _$ClockManagerCopyWith<_ClockManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ColorManagerTearOff {
  const _$ColorManagerTearOff();

  _ColorManager call({double opacity = 0}) {
    return _ColorManager(
      opacity: opacity,
    );
  }
}

/// @nodoc
const $ColorManager = _$ColorManagerTearOff();

/// @nodoc
mixin _$ColorManager {
  double get opacity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorManagerCopyWith<ColorManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorManagerCopyWith<$Res> {
  factory $ColorManagerCopyWith(
          ColorManager value, $Res Function(ColorManager) then) =
      _$ColorManagerCopyWithImpl<$Res>;
  $Res call({double opacity});
}

/// @nodoc
class _$ColorManagerCopyWithImpl<$Res> implements $ColorManagerCopyWith<$Res> {
  _$ColorManagerCopyWithImpl(this._value, this._then);

  final ColorManager _value;
  // ignore: unused_field
  final $Res Function(ColorManager) _then;

  @override
  $Res call({
    Object? opacity = freezed,
  }) {
    return _then(_value.copyWith(
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ColorManagerCopyWith<$Res>
    implements $ColorManagerCopyWith<$Res> {
  factory _$ColorManagerCopyWith(
          _ColorManager value, $Res Function(_ColorManager) then) =
      __$ColorManagerCopyWithImpl<$Res>;
  @override
  $Res call({double opacity});
}

/// @nodoc
class __$ColorManagerCopyWithImpl<$Res> extends _$ColorManagerCopyWithImpl<$Res>
    implements _$ColorManagerCopyWith<$Res> {
  __$ColorManagerCopyWithImpl(
      _ColorManager _value, $Res Function(_ColorManager) _then)
      : super(_value, (v) => _then(v as _ColorManager));

  @override
  _ColorManager get _value => super._value as _ColorManager;

  @override
  $Res call({
    Object? opacity = freezed,
  }) {
    return _then(_ColorManager(
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ColorManager extends _ColorManager with DiagnosticableTreeMixin {
  const _$_ColorManager({this.opacity = 0}) : super._();

  @JsonKey()
  @override
  final double opacity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorManager(opacity: $opacity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorManager'))
      ..add(DiagnosticsProperty('opacity', opacity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorManager &&
            const DeepCollectionEquality().equals(other.opacity, opacity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(opacity));

  @JsonKey(ignore: true)
  @override
  _$ColorManagerCopyWith<_ColorManager> get copyWith =>
      __$ColorManagerCopyWithImpl<_ColorManager>(this, _$identity);
}

abstract class _ColorManager extends ColorManager {
  const factory _ColorManager({double opacity}) = _$_ColorManager;
  const _ColorManager._() : super._();

  @override
  double get opacity;
  @override
  @JsonKey(ignore: true)
  _$ColorManagerCopyWith<_ColorManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmManagerTearOff {
  const _$AlarmManagerTearOff();

  _AlarmManager call({int alarmHour = 12, int alarmMinute = 00}) {
    return _AlarmManager(
      alarmHour: alarmHour,
      alarmMinute: alarmMinute,
    );
  }
}

/// @nodoc
const $AlarmManager = _$AlarmManagerTearOff();

/// @nodoc
mixin _$AlarmManager {
  int get alarmHour => throw _privateConstructorUsedError;
  int get alarmMinute => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmManagerCopyWith<AlarmManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmManagerCopyWith<$Res> {
  factory $AlarmManagerCopyWith(
          AlarmManager value, $Res Function(AlarmManager) then) =
      _$AlarmManagerCopyWithImpl<$Res>;
  $Res call({int alarmHour, int alarmMinute});
}

/// @nodoc
class _$AlarmManagerCopyWithImpl<$Res> implements $AlarmManagerCopyWith<$Res> {
  _$AlarmManagerCopyWithImpl(this._value, this._then);

  final AlarmManager _value;
  // ignore: unused_field
  final $Res Function(AlarmManager) _then;

  @override
  $Res call({
    Object? alarmHour = freezed,
    Object? alarmMinute = freezed,
  }) {
    return _then(_value.copyWith(
      alarmHour: alarmHour == freezed
          ? _value.alarmHour
          : alarmHour // ignore: cast_nullable_to_non_nullable
              as int,
      alarmMinute: alarmMinute == freezed
          ? _value.alarmMinute
          : alarmMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AlarmManagerCopyWith<$Res>
    implements $AlarmManagerCopyWith<$Res> {
  factory _$AlarmManagerCopyWith(
          _AlarmManager value, $Res Function(_AlarmManager) then) =
      __$AlarmManagerCopyWithImpl<$Res>;
  @override
  $Res call({int alarmHour, int alarmMinute});
}

/// @nodoc
class __$AlarmManagerCopyWithImpl<$Res> extends _$AlarmManagerCopyWithImpl<$Res>
    implements _$AlarmManagerCopyWith<$Res> {
  __$AlarmManagerCopyWithImpl(
      _AlarmManager _value, $Res Function(_AlarmManager) _then)
      : super(_value, (v) => _then(v as _AlarmManager));

  @override
  _AlarmManager get _value => super._value as _AlarmManager;

  @override
  $Res call({
    Object? alarmHour = freezed,
    Object? alarmMinute = freezed,
  }) {
    return _then(_AlarmManager(
      alarmHour: alarmHour == freezed
          ? _value.alarmHour
          : alarmHour // ignore: cast_nullable_to_non_nullable
              as int,
      alarmMinute: alarmMinute == freezed
          ? _value.alarmMinute
          : alarmMinute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AlarmManager extends _AlarmManager with DiagnosticableTreeMixin {
  const _$_AlarmManager({this.alarmHour = 12, this.alarmMinute = 00})
      : super._();

  @JsonKey()
  @override
  final int alarmHour;
  @JsonKey()
  @override
  final int alarmMinute;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmManager(alarmHour: $alarmHour, alarmMinute: $alarmMinute)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmManager'))
      ..add(DiagnosticsProperty('alarmHour', alarmHour))
      ..add(DiagnosticsProperty('alarmMinute', alarmMinute));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmManager &&
            const DeepCollectionEquality().equals(other.alarmHour, alarmHour) &&
            const DeepCollectionEquality()
                .equals(other.alarmMinute, alarmMinute));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(alarmHour),
      const DeepCollectionEquality().hash(alarmMinute));

  @JsonKey(ignore: true)
  @override
  _$AlarmManagerCopyWith<_AlarmManager> get copyWith =>
      __$AlarmManagerCopyWithImpl<_AlarmManager>(this, _$identity);
}

abstract class _AlarmManager extends AlarmManager {
  const factory _AlarmManager({int alarmHour, int alarmMinute}) =
      _$_AlarmManager;
  const _AlarmManager._() : super._();

  @override
  int get alarmHour;
  @override
  int get alarmMinute;
  @override
  @JsonKey(ignore: true)
  _$AlarmManagerCopyWith<_AlarmManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmTimeKeepingManagerTearOff {
  const _$AlarmTimeKeepingManagerTearOff();

  _AlarmTimeKeepingManager call(
      {double rate = 0,
      Duration duration = const Duration(seconds: 1),
      bool alarmTK = false,
      bool isAlarmFinish = false}) {
    return _AlarmTimeKeepingManager(
      rate: rate,
      duration: duration,
      alarmTK: alarmTK,
      isAlarmFinish: isAlarmFinish,
    );
  }
}

/// @nodoc
const $AlarmTimeKeepingManager = _$AlarmTimeKeepingManagerTearOff();

/// @nodoc
mixin _$AlarmTimeKeepingManager {
  double get rate => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  bool get alarmTK => throw _privateConstructorUsedError;
  bool get isAlarmFinish => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmTimeKeepingManagerCopyWith<AlarmTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmTimeKeepingManagerCopyWith<$Res> {
  factory $AlarmTimeKeepingManagerCopyWith(AlarmTimeKeepingManager value,
          $Res Function(AlarmTimeKeepingManager) then) =
      _$AlarmTimeKeepingManagerCopyWithImpl<$Res>;
  $Res call({double rate, Duration duration, bool alarmTK, bool isAlarmFinish});
}

/// @nodoc
class _$AlarmTimeKeepingManagerCopyWithImpl<$Res>
    implements $AlarmTimeKeepingManagerCopyWith<$Res> {
  _$AlarmTimeKeepingManagerCopyWithImpl(this._value, this._then);

  final AlarmTimeKeepingManager _value;
  // ignore: unused_field
  final $Res Function(AlarmTimeKeepingManager) _then;

  @override
  $Res call({
    Object? rate = freezed,
    Object? duration = freezed,
    Object? alarmTK = freezed,
    Object? isAlarmFinish = freezed,
  }) {
    return _then(_value.copyWith(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      alarmTK: alarmTK == freezed
          ? _value.alarmTK
          : alarmTK // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlarmFinish: isAlarmFinish == freezed
          ? _value.isAlarmFinish
          : isAlarmFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AlarmTimeKeepingManagerCopyWith<$Res>
    implements $AlarmTimeKeepingManagerCopyWith<$Res> {
  factory _$AlarmTimeKeepingManagerCopyWith(_AlarmTimeKeepingManager value,
          $Res Function(_AlarmTimeKeepingManager) then) =
      __$AlarmTimeKeepingManagerCopyWithImpl<$Res>;
  @override
  $Res call({double rate, Duration duration, bool alarmTK, bool isAlarmFinish});
}

/// @nodoc
class __$AlarmTimeKeepingManagerCopyWithImpl<$Res>
    extends _$AlarmTimeKeepingManagerCopyWithImpl<$Res>
    implements _$AlarmTimeKeepingManagerCopyWith<$Res> {
  __$AlarmTimeKeepingManagerCopyWithImpl(_AlarmTimeKeepingManager _value,
      $Res Function(_AlarmTimeKeepingManager) _then)
      : super(_value, (v) => _then(v as _AlarmTimeKeepingManager));

  @override
  _AlarmTimeKeepingManager get _value =>
      super._value as _AlarmTimeKeepingManager;

  @override
  $Res call({
    Object? rate = freezed,
    Object? duration = freezed,
    Object? alarmTK = freezed,
    Object? isAlarmFinish = freezed,
  }) {
    return _then(_AlarmTimeKeepingManager(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      alarmTK: alarmTK == freezed
          ? _value.alarmTK
          : alarmTK // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlarmFinish: isAlarmFinish == freezed
          ? _value.isAlarmFinish
          : isAlarmFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AlarmTimeKeepingManager extends _AlarmTimeKeepingManager
    with DiagnosticableTreeMixin {
  const _$_AlarmTimeKeepingManager(
      {this.rate = 0,
      this.duration = const Duration(seconds: 1),
      this.alarmTK = false,
      this.isAlarmFinish = false})
      : super._();

  @JsonKey()
  @override
  final double rate;
  @JsonKey()
  @override
  final Duration duration;
  @JsonKey()
  @override
  final bool alarmTK;
  @JsonKey()
  @override
  final bool isAlarmFinish;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmTimeKeepingManager(rate: $rate, duration: $duration, alarmTK: $alarmTK, isAlarmFinish: $isAlarmFinish)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmTimeKeepingManager'))
      ..add(DiagnosticsProperty('rate', rate))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('alarmTK', alarmTK))
      ..add(DiagnosticsProperty('isAlarmFinish', isAlarmFinish));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmTimeKeepingManager &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.alarmTK, alarmTK) &&
            const DeepCollectionEquality()
                .equals(other.isAlarmFinish, isAlarmFinish));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(alarmTK),
      const DeepCollectionEquality().hash(isAlarmFinish));

  @JsonKey(ignore: true)
  @override
  _$AlarmTimeKeepingManagerCopyWith<_AlarmTimeKeepingManager> get copyWith =>
      __$AlarmTimeKeepingManagerCopyWithImpl<_AlarmTimeKeepingManager>(
          this, _$identity);
}

abstract class _AlarmTimeKeepingManager extends AlarmTimeKeepingManager {
  const factory _AlarmTimeKeepingManager(
      {double rate,
      Duration duration,
      bool alarmTK,
      bool isAlarmFinish}) = _$_AlarmTimeKeepingManager;
  const _AlarmTimeKeepingManager._() : super._();

  @override
  double get rate;
  @override
  Duration get duration;
  @override
  bool get alarmTK;
  @override
  bool get isAlarmFinish;
  @override
  @JsonKey(ignore: true)
  _$AlarmTimeKeepingManagerCopyWith<_AlarmTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimerManagerTearOff {
  const _$TimerManagerTearOff();

  _TimerManager call(
      {Duration target = const Duration(minutes: 1),
      Duration interval = const Duration(minutes: 1),
      bool isInterval = false}) {
    return _TimerManager(
      target: target,
      interval: interval,
      isInterval: isInterval,
    );
  }
}

/// @nodoc
const $TimerManager = _$TimerManagerTearOff();

/// @nodoc
mixin _$TimerManager {
  Duration get target => throw _privateConstructorUsedError;
  Duration get interval => throw _privateConstructorUsedError;
  bool get isInterval => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerManagerCopyWith<TimerManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerManagerCopyWith<$Res> {
  factory $TimerManagerCopyWith(
          TimerManager value, $Res Function(TimerManager) then) =
      _$TimerManagerCopyWithImpl<$Res>;
  $Res call({Duration target, Duration interval, bool isInterval});
}

/// @nodoc
class _$TimerManagerCopyWithImpl<$Res> implements $TimerManagerCopyWith<$Res> {
  _$TimerManagerCopyWithImpl(this._value, this._then);

  final TimerManager _value;
  // ignore: unused_field
  final $Res Function(TimerManager) _then;

  @override
  $Res call({
    Object? target = freezed,
    Object? interval = freezed,
    Object? isInterval = freezed,
  }) {
    return _then(_value.copyWith(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Duration,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isInterval: isInterval == freezed
          ? _value.isInterval
          : isInterval // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TimerManagerCopyWith<$Res>
    implements $TimerManagerCopyWith<$Res> {
  factory _$TimerManagerCopyWith(
          _TimerManager value, $Res Function(_TimerManager) then) =
      __$TimerManagerCopyWithImpl<$Res>;
  @override
  $Res call({Duration target, Duration interval, bool isInterval});
}

/// @nodoc
class __$TimerManagerCopyWithImpl<$Res> extends _$TimerManagerCopyWithImpl<$Res>
    implements _$TimerManagerCopyWith<$Res> {
  __$TimerManagerCopyWithImpl(
      _TimerManager _value, $Res Function(_TimerManager) _then)
      : super(_value, (v) => _then(v as _TimerManager));

  @override
  _TimerManager get _value => super._value as _TimerManager;

  @override
  $Res call({
    Object? target = freezed,
    Object? interval = freezed,
    Object? isInterval = freezed,
  }) {
    return _then(_TimerManager(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as Duration,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as Duration,
      isInterval: isInterval == freezed
          ? _value.isInterval
          : isInterval // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TimerManager extends _TimerManager with DiagnosticableTreeMixin {
  const _$_TimerManager(
      {this.target = const Duration(minutes: 1),
      this.interval = const Duration(minutes: 1),
      this.isInterval = false})
      : super._();

  @JsonKey()
  @override
  final Duration target;
  @JsonKey()
  @override
  final Duration interval;
  @JsonKey()
  @override
  final bool isInterval;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerManager(target: $target, interval: $interval, isInterval: $isInterval)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerManager'))
      ..add(DiagnosticsProperty('target', target))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('isInterval', isInterval));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerManager &&
            const DeepCollectionEquality().equals(other.target, target) &&
            const DeepCollectionEquality().equals(other.interval, interval) &&
            const DeepCollectionEquality()
                .equals(other.isInterval, isInterval));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(target),
      const DeepCollectionEquality().hash(interval),
      const DeepCollectionEquality().hash(isInterval));

  @JsonKey(ignore: true)
  @override
  _$TimerManagerCopyWith<_TimerManager> get copyWith =>
      __$TimerManagerCopyWithImpl<_TimerManager>(this, _$identity);
}

abstract class _TimerManager extends TimerManager {
  const factory _TimerManager(
      {Duration target, Duration interval, bool isInterval}) = _$_TimerManager;
  const _TimerManager._() : super._();

  @override
  Duration get target;
  @override
  Duration get interval;
  @override
  bool get isInterval;
  @override
  @JsonKey(ignore: true)
  _$TimerManagerCopyWith<_TimerManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimerTimeKeepingManagerTearOff {
  const _$TimerTimeKeepingManagerTearOff();

  _TimerTimeKeepingManager call({double rate = 0}) {
    return _TimerTimeKeepingManager(
      rate: rate,
    );
  }
}

/// @nodoc
const $TimerTimeKeepingManager = _$TimerTimeKeepingManagerTearOff();

/// @nodoc
mixin _$TimerTimeKeepingManager {
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerTimeKeepingManagerCopyWith<TimerTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerTimeKeepingManagerCopyWith<$Res> {
  factory $TimerTimeKeepingManagerCopyWith(TimerTimeKeepingManager value,
          $Res Function(TimerTimeKeepingManager) then) =
      _$TimerTimeKeepingManagerCopyWithImpl<$Res>;
  $Res call({double rate});
}

/// @nodoc
class _$TimerTimeKeepingManagerCopyWithImpl<$Res>
    implements $TimerTimeKeepingManagerCopyWith<$Res> {
  _$TimerTimeKeepingManagerCopyWithImpl(this._value, this._then);

  final TimerTimeKeepingManager _value;
  // ignore: unused_field
  final $Res Function(TimerTimeKeepingManager) _then;

  @override
  $Res call({
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TimerTimeKeepingManagerCopyWith<$Res>
    implements $TimerTimeKeepingManagerCopyWith<$Res> {
  factory _$TimerTimeKeepingManagerCopyWith(_TimerTimeKeepingManager value,
          $Res Function(_TimerTimeKeepingManager) then) =
      __$TimerTimeKeepingManagerCopyWithImpl<$Res>;
  @override
  $Res call({double rate});
}

/// @nodoc
class __$TimerTimeKeepingManagerCopyWithImpl<$Res>
    extends _$TimerTimeKeepingManagerCopyWithImpl<$Res>
    implements _$TimerTimeKeepingManagerCopyWith<$Res> {
  __$TimerTimeKeepingManagerCopyWithImpl(_TimerTimeKeepingManager _value,
      $Res Function(_TimerTimeKeepingManager) _then)
      : super(_value, (v) => _then(v as _TimerTimeKeepingManager));

  @override
  _TimerTimeKeepingManager get _value =>
      super._value as _TimerTimeKeepingManager;

  @override
  $Res call({
    Object? rate = freezed,
  }) {
    return _then(_TimerTimeKeepingManager(
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TimerTimeKeepingManager extends _TimerTimeKeepingManager
    with DiagnosticableTreeMixin {
  const _$_TimerTimeKeepingManager({this.rate = 0}) : super._();

  @JsonKey()
  @override
  final double rate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerTimeKeepingManager(rate: $rate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerTimeKeepingManager'))
      ..add(DiagnosticsProperty('rate', rate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerTimeKeepingManager &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$TimerTimeKeepingManagerCopyWith<_TimerTimeKeepingManager> get copyWith =>
      __$TimerTimeKeepingManagerCopyWithImpl<_TimerTimeKeepingManager>(
          this, _$identity);
}

abstract class _TimerTimeKeepingManager extends TimerTimeKeepingManager {
  const factory _TimerTimeKeepingManager({double rate}) =
      _$_TimerTimeKeepingManager;
  const _TimerTimeKeepingManager._() : super._();

  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$TimerTimeKeepingManagerCopyWith<_TimerTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}
