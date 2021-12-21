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
class _$CounterStateTearOff {
  const _$CounterStateTearOff();

  _CounterState call({int count = 0, int count10 = 0}) {
    return _CounterState(
      count: count,
      count10: count10,
    );
  }
}

/// @nodoc
const $CounterState = _$CounterStateTearOff();

/// @nodoc
mixin _$CounterState {
  int get count => throw _privateConstructorUsedError;
  int get count10 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterStateCopyWith<CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStateCopyWith<$Res> {
  factory $CounterStateCopyWith(
          CounterState value, $Res Function(CounterState) then) =
      _$CounterStateCopyWithImpl<$Res>;
  $Res call({int count, int count10});
}

/// @nodoc
class _$CounterStateCopyWithImpl<$Res> implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._value, this._then);

  final CounterState _value;
  // ignore: unused_field
  final $Res Function(CounterState) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? count10 = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      count10: count10 == freezed
          ? _value.count10
          : count10 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CounterStateCopyWith<$Res>
    implements $CounterStateCopyWith<$Res> {
  factory _$CounterStateCopyWith(
          _CounterState value, $Res Function(_CounterState) then) =
      __$CounterStateCopyWithImpl<$Res>;
  @override
  $Res call({int count, int count10});
}

/// @nodoc
class __$CounterStateCopyWithImpl<$Res> extends _$CounterStateCopyWithImpl<$Res>
    implements _$CounterStateCopyWith<$Res> {
  __$CounterStateCopyWithImpl(
      _CounterState _value, $Res Function(_CounterState) _then)
      : super(_value, (v) => _then(v as _CounterState));

  @override
  _CounterState get _value => super._value as _CounterState;

  @override
  $Res call({
    Object? count = freezed,
    Object? count10 = freezed,
  }) {
    return _then(_CounterState(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      count10: count10 == freezed
          ? _value.count10
          : count10 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CounterState with DiagnosticableTreeMixin implements _CounterState {
  const _$_CounterState({this.count = 0, this.count10 = 0});

  @JsonKey()
  @override
  final int count;
  @JsonKey()
  @override
  final int count10;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CounterState(count: $count, count10: $count10)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CounterState'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('count10', count10));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CounterState &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.count10, count10));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(count10));

  @JsonKey(ignore: true)
  @override
  _$CounterStateCopyWith<_CounterState> get copyWith =>
      __$CounterStateCopyWithImpl<_CounterState>(this, _$identity);
}

abstract class _CounterState implements CounterState {
  const factory _CounterState({int count, int count10}) = _$_CounterState;

  @override
  int get count;
  @override
  int get count10;
  @override
  @JsonKey(ignore: true)
  _$CounterStateCopyWith<_CounterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GeneralManagerTearOff {
  const _$GeneralManagerTearOff();

  _GeneralManager call(
      {String status = 'まじもタイマーへようこそ！',
      bool topToast = false,
      int toastDuration = 3,
      double opacity = 1,
      bool timekeeping = false}) {
    return _GeneralManager(
      status: status,
      topToast: topToast,
      toastDuration: toastDuration,
      opacity: opacity,
      timekeeping: timekeeping,
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
  bool get timekeeping => throw _privateConstructorUsedError;

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
      bool timekeeping});
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
    Object? timekeeping = freezed,
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
      timekeeping: timekeeping == freezed
          ? _value.timekeeping
          : timekeeping // ignore: cast_nullable_to_non_nullable
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
      bool timekeeping});
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
    Object? timekeeping = freezed,
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
      timekeeping: timekeeping == freezed
          ? _value.timekeeping
          : timekeeping // ignore: cast_nullable_to_non_nullable
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
      this.timekeeping = false})
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
  final bool timekeeping;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeneralManager(status: $status, topToast: $topToast, toastDuration: $toastDuration, opacity: $opacity, timekeeping: $timekeeping)';
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
      ..add(DiagnosticsProperty('timekeeping', timekeeping));
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
            const DeepCollectionEquality()
                .equals(other.timekeeping, timekeeping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(topToast),
      const DeepCollectionEquality().hash(toastDuration),
      const DeepCollectionEquality().hash(opacity),
      const DeepCollectionEquality().hash(timekeeping));

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
      bool timekeeping}) = _$_GeneralManager;
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
  bool get timekeeping;
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

  _AlarmManager call(
      {int alarmHour = 12, int alarmMinute = 00, bool showFAB = false}) {
    return _AlarmManager(
      alarmHour: alarmHour,
      alarmMinute: alarmMinute,
      showFAB: showFAB,
    );
  }
}

/// @nodoc
const $AlarmManager = _$AlarmManagerTearOff();

/// @nodoc
mixin _$AlarmManager {
  int get alarmHour => throw _privateConstructorUsedError;
  int get alarmMinute => throw _privateConstructorUsedError;
  bool get showFAB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmManagerCopyWith<AlarmManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmManagerCopyWith<$Res> {
  factory $AlarmManagerCopyWith(
          AlarmManager value, $Res Function(AlarmManager) then) =
      _$AlarmManagerCopyWithImpl<$Res>;
  $Res call({int alarmHour, int alarmMinute, bool showFAB});
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
    Object? showFAB = freezed,
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
      showFAB: showFAB == freezed
          ? _value.showFAB
          : showFAB // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({int alarmHour, int alarmMinute, bool showFAB});
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
    Object? showFAB = freezed,
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
      showFAB: showFAB == freezed
          ? _value.showFAB
          : showFAB // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AlarmManager extends _AlarmManager with DiagnosticableTreeMixin {
  const _$_AlarmManager(
      {this.alarmHour = 12, this.alarmMinute = 00, this.showFAB = false})
      : super._();

  @JsonKey()
  @override
  final int alarmHour;
  @JsonKey()
  @override
  final int alarmMinute;
  @JsonKey()
  @override
  final bool showFAB;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmManager(alarmHour: $alarmHour, alarmMinute: $alarmMinute, showFAB: $showFAB)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmManager'))
      ..add(DiagnosticsProperty('alarmHour', alarmHour))
      ..add(DiagnosticsProperty('alarmMinute', alarmMinute))
      ..add(DiagnosticsProperty('showFAB', showFAB));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmManager &&
            const DeepCollectionEquality().equals(other.alarmHour, alarmHour) &&
            const DeepCollectionEquality()
                .equals(other.alarmMinute, alarmMinute) &&
            const DeepCollectionEquality().equals(other.showFAB, showFAB));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(alarmHour),
      const DeepCollectionEquality().hash(alarmMinute),
      const DeepCollectionEquality().hash(showFAB));

  @JsonKey(ignore: true)
  @override
  _$AlarmManagerCopyWith<_AlarmManager> get copyWith =>
      __$AlarmManagerCopyWithImpl<_AlarmManager>(this, _$identity);
}

abstract class _AlarmManager extends AlarmManager {
  const factory _AlarmManager({int alarmHour, int alarmMinute, bool showFAB}) =
      _$_AlarmManager;
  const _AlarmManager._() : super._();

  @override
  int get alarmHour;
  @override
  int get alarmMinute;
  @override
  bool get showFAB;
  @override
  @JsonKey(ignore: true)
  _$AlarmManagerCopyWith<_AlarmManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmTimeKeepingManagerTearOff {
  const _$AlarmTimeKeepingManagerTearOff();

  _AlarmTimeKeepingManager call(
      {Duration duration = const Duration(seconds: 1)}) {
    return _AlarmTimeKeepingManager(
      duration: duration,
    );
  }
}

/// @nodoc
const $AlarmTimeKeepingManager = _$AlarmTimeKeepingManagerTearOff();

/// @nodoc
mixin _$AlarmTimeKeepingManager {
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmTimeKeepingManagerCopyWith<AlarmTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmTimeKeepingManagerCopyWith<$Res> {
  factory $AlarmTimeKeepingManagerCopyWith(AlarmTimeKeepingManager value,
          $Res Function(AlarmTimeKeepingManager) then) =
      _$AlarmTimeKeepingManagerCopyWithImpl<$Res>;
  $Res call({Duration duration});
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
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
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
  $Res call({Duration duration});
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
    Object? duration = freezed,
  }) {
    return _then(_AlarmTimeKeepingManager(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_AlarmTimeKeepingManager
    with DiagnosticableTreeMixin
    implements _AlarmTimeKeepingManager {
  const _$_AlarmTimeKeepingManager(
      {this.duration = const Duration(seconds: 1)});

  @JsonKey()
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmTimeKeepingManager(duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmTimeKeepingManager'))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmTimeKeepingManager &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$AlarmTimeKeepingManagerCopyWith<_AlarmTimeKeepingManager> get copyWith =>
      __$AlarmTimeKeepingManagerCopyWithImpl<_AlarmTimeKeepingManager>(
          this, _$identity);
}

abstract class _AlarmTimeKeepingManager implements AlarmTimeKeepingManager {
  const factory _AlarmTimeKeepingManager({Duration duration}) =
      _$_AlarmTimeKeepingManager;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$AlarmTimeKeepingManagerCopyWith<_AlarmTimeKeepingManager> get copyWith =>
      throw _privateConstructorUsedError;
}
