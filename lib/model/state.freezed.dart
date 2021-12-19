// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
class _$GeneralManagersTearOff {
  const _$GeneralManagersTearOff();

  _GeneralManagers call(
      {String status = 'まじもタイマーへようこそ！',
      bool topToast = false,
      int toastDuration = 3,
      double opacity = 1,
      bool timekeeping = false}) {
    return _GeneralManagers(
      status: status,
      topToast: topToast,
      toastDuration: toastDuration,
      opacity: opacity,
      timekeeping: timekeeping,
    );
  }
}

/// @nodoc
const $GeneralManagers = _$GeneralManagersTearOff();

/// @nodoc
mixin _$GeneralManagers {
  String get status => throw _privateConstructorUsedError;
  bool get topToast => throw _privateConstructorUsedError;
  int get toastDuration => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;
  bool get timekeeping => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralManagersCopyWith<GeneralManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralManagersCopyWith<$Res> {
  factory $GeneralManagersCopyWith(
          GeneralManagers value, $Res Function(GeneralManagers) then) =
      _$GeneralManagersCopyWithImpl<$Res>;
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool timekeeping});
}

/// @nodoc
class _$GeneralManagersCopyWithImpl<$Res>
    implements $GeneralManagersCopyWith<$Res> {
  _$GeneralManagersCopyWithImpl(this._value, this._then);

  final GeneralManagers _value;
  // ignore: unused_field
  final $Res Function(GeneralManagers) _then;

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
abstract class _$GeneralManagersCopyWith<$Res>
    implements $GeneralManagersCopyWith<$Res> {
  factory _$GeneralManagersCopyWith(
          _GeneralManagers value, $Res Function(_GeneralManagers) then) =
      __$GeneralManagersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool timekeeping});
}

/// @nodoc
class __$GeneralManagersCopyWithImpl<$Res>
    extends _$GeneralManagersCopyWithImpl<$Res>
    implements _$GeneralManagersCopyWith<$Res> {
  __$GeneralManagersCopyWithImpl(
      _GeneralManagers _value, $Res Function(_GeneralManagers) _then)
      : super(_value, (v) => _then(v as _GeneralManagers));

  @override
  _GeneralManagers get _value => super._value as _GeneralManagers;

  @override
  $Res call({
    Object? status = freezed,
    Object? topToast = freezed,
    Object? toastDuration = freezed,
    Object? opacity = freezed,
    Object? timekeeping = freezed,
  }) {
    return _then(_GeneralManagers(
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

class _$_GeneralManagers
    with DiagnosticableTreeMixin
    implements _GeneralManagers {
  const _$_GeneralManagers(
      {this.status = 'まじもタイマーへようこそ！',
      this.topToast = false,
      this.toastDuration = 3,
      this.opacity = 1,
      this.timekeeping = false});

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
    return 'GeneralManagers(status: $status, topToast: $topToast, toastDuration: $toastDuration, opacity: $opacity, timekeeping: $timekeeping)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralManagers'))
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
            other is _GeneralManagers &&
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
  _$GeneralManagersCopyWith<_GeneralManagers> get copyWith =>
      __$GeneralManagersCopyWithImpl<_GeneralManagers>(this, _$identity);
}

abstract class _GeneralManagers implements GeneralManagers {
  const factory _GeneralManagers(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool timekeeping}) = _$_GeneralManagers;

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
  _$GeneralManagersCopyWith<_GeneralManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ThemeMangersTearOff {
  const _$ThemeMangersTearOff();

  _ThemeMangers call({int theme = 0}) {
    return _ThemeMangers(
      theme: theme,
    );
  }
}

/// @nodoc
const $ThemeMangers = _$ThemeMangersTearOff();

/// @nodoc
mixin _$ThemeMangers {
  int get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeMangersCopyWith<ThemeMangers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeMangersCopyWith<$Res> {
  factory $ThemeMangersCopyWith(
          ThemeMangers value, $Res Function(ThemeMangers) then) =
      _$ThemeMangersCopyWithImpl<$Res>;
  $Res call({int theme});
}

/// @nodoc
class _$ThemeMangersCopyWithImpl<$Res> implements $ThemeMangersCopyWith<$Res> {
  _$ThemeMangersCopyWithImpl(this._value, this._then);

  final ThemeMangers _value;
  // ignore: unused_field
  final $Res Function(ThemeMangers) _then;

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
abstract class _$ThemeMangersCopyWith<$Res>
    implements $ThemeMangersCopyWith<$Res> {
  factory _$ThemeMangersCopyWith(
          _ThemeMangers value, $Res Function(_ThemeMangers) then) =
      __$ThemeMangersCopyWithImpl<$Res>;
  @override
  $Res call({int theme});
}

/// @nodoc
class __$ThemeMangersCopyWithImpl<$Res> extends _$ThemeMangersCopyWithImpl<$Res>
    implements _$ThemeMangersCopyWith<$Res> {
  __$ThemeMangersCopyWithImpl(
      _ThemeMangers _value, $Res Function(_ThemeMangers) _then)
      : super(_value, (v) => _then(v as _ThemeMangers));

  @override
  _ThemeMangers get _value => super._value as _ThemeMangers;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_ThemeMangers(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ThemeMangers with DiagnosticableTreeMixin implements _ThemeMangers {
  const _$_ThemeMangers({this.theme = 0});

  @JsonKey()
  @override
  final int theme;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeMangers(theme: $theme)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeMangers'))
      ..add(DiagnosticsProperty('theme', theme));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeMangers &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$ThemeMangersCopyWith<_ThemeMangers> get copyWith =>
      __$ThemeMangersCopyWithImpl<_ThemeMangers>(this, _$identity);
}

abstract class _ThemeMangers implements ThemeMangers {
  const factory _ThemeMangers({int theme}) = _$_ThemeMangers;

  @override
  int get theme;
  @override
  @JsonKey(ignore: true)
  _$ThemeMangersCopyWith<_ThemeMangers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LangManagersTearOff {
  const _$LangManagersTearOff();

  _LangManagers call({int value = 0}) {
    return _LangManagers(
      value: value,
    );
  }
}

/// @nodoc
const $LangManagers = _$LangManagersTearOff();

/// @nodoc
mixin _$LangManagers {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LangManagersCopyWith<LangManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangManagersCopyWith<$Res> {
  factory $LangManagersCopyWith(
          LangManagers value, $Res Function(LangManagers) then) =
      _$LangManagersCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$LangManagersCopyWithImpl<$Res> implements $LangManagersCopyWith<$Res> {
  _$LangManagersCopyWithImpl(this._value, this._then);

  final LangManagers _value;
  // ignore: unused_field
  final $Res Function(LangManagers) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LangManagersCopyWith<$Res>
    implements $LangManagersCopyWith<$Res> {
  factory _$LangManagersCopyWith(
          _LangManagers value, $Res Function(_LangManagers) then) =
      __$LangManagersCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$LangManagersCopyWithImpl<$Res> extends _$LangManagersCopyWithImpl<$Res>
    implements _$LangManagersCopyWith<$Res> {
  __$LangManagersCopyWithImpl(
      _LangManagers _value, $Res Function(_LangManagers) _then)
      : super(_value, (v) => _then(v as _LangManagers));

  @override
  _LangManagers get _value => super._value as _LangManagers;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_LangManagers(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LangManagers with DiagnosticableTreeMixin implements _LangManagers {
  const _$_LangManagers({this.value = 0});

  @JsonKey()
  @override
  final int value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LangManagers(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LangManagers'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LangManagers &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$LangManagersCopyWith<_LangManagers> get copyWith =>
      __$LangManagersCopyWithImpl<_LangManagers>(this, _$identity);
}

abstract class _LangManagers implements LangManagers {
  const factory _LangManagers({int value}) = _$_LangManagers;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$LangManagersCopyWith<_LangManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ClockManagersTearOff {
  const _$ClockManagersTearOff();

  _ClockManagers call(
      {bool is24 = true, bool showSec = true, int animation = 0}) {
    return _ClockManagers(
      is24: is24,
      showSec: showSec,
      animation: animation,
    );
  }
}

/// @nodoc
const $ClockManagers = _$ClockManagersTearOff();

/// @nodoc
mixin _$ClockManagers {
  bool get is24 => throw _privateConstructorUsedError;
  bool get showSec => throw _privateConstructorUsedError;
  int get animation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClockManagersCopyWith<ClockManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockManagersCopyWith<$Res> {
  factory $ClockManagersCopyWith(
          ClockManagers value, $Res Function(ClockManagers) then) =
      _$ClockManagersCopyWithImpl<$Res>;
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class _$ClockManagersCopyWithImpl<$Res>
    implements $ClockManagersCopyWith<$Res> {
  _$ClockManagersCopyWithImpl(this._value, this._then);

  final ClockManagers _value;
  // ignore: unused_field
  final $Res Function(ClockManagers) _then;

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
abstract class _$ClockManagersCopyWith<$Res>
    implements $ClockManagersCopyWith<$Res> {
  factory _$ClockManagersCopyWith(
          _ClockManagers value, $Res Function(_ClockManagers) then) =
      __$ClockManagersCopyWithImpl<$Res>;
  @override
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class __$ClockManagersCopyWithImpl<$Res>
    extends _$ClockManagersCopyWithImpl<$Res>
    implements _$ClockManagersCopyWith<$Res> {
  __$ClockManagersCopyWithImpl(
      _ClockManagers _value, $Res Function(_ClockManagers) _then)
      : super(_value, (v) => _then(v as _ClockManagers));

  @override
  _ClockManagers get _value => super._value as _ClockManagers;

  @override
  $Res call({
    Object? is24 = freezed,
    Object? showSec = freezed,
    Object? animation = freezed,
  }) {
    return _then(_ClockManagers(
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

class _$_ClockManagers with DiagnosticableTreeMixin implements _ClockManagers {
  const _$_ClockManagers(
      {this.is24 = true, this.showSec = true, this.animation = 0});

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
    return 'ClockManagers(is24: $is24, showSec: $showSec, animation: $animation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClockManagers'))
      ..add(DiagnosticsProperty('is24', is24))
      ..add(DiagnosticsProperty('showSec', showSec))
      ..add(DiagnosticsProperty('animation', animation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClockManagers &&
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
  _$ClockManagersCopyWith<_ClockManagers> get copyWith =>
      __$ClockManagersCopyWithImpl<_ClockManagers>(this, _$identity);
}

abstract class _ClockManagers implements ClockManagers {
  const factory _ClockManagers({bool is24, bool showSec, int animation}) =
      _$_ClockManagers;

  @override
  bool get is24;
  @override
  bool get showSec;
  @override
  int get animation;
  @override
  @JsonKey(ignore: true)
  _$ClockManagersCopyWith<_ClockManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ColorManagersTearOff {
  const _$ColorManagersTearOff();

  _ColorManagers call({double opacity = 0}) {
    return _ColorManagers(
      opacity: opacity,
    );
  }
}

/// @nodoc
const $ColorManagers = _$ColorManagersTearOff();

/// @nodoc
mixin _$ColorManagers {
  double get opacity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorManagersCopyWith<ColorManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorManagersCopyWith<$Res> {
  factory $ColorManagersCopyWith(
          ColorManagers value, $Res Function(ColorManagers) then) =
      _$ColorManagersCopyWithImpl<$Res>;
  $Res call({double opacity});
}

/// @nodoc
class _$ColorManagersCopyWithImpl<$Res>
    implements $ColorManagersCopyWith<$Res> {
  _$ColorManagersCopyWithImpl(this._value, this._then);

  final ColorManagers _value;
  // ignore: unused_field
  final $Res Function(ColorManagers) _then;

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
abstract class _$ColorManagersCopyWith<$Res>
    implements $ColorManagersCopyWith<$Res> {
  factory _$ColorManagersCopyWith(
          _ColorManagers value, $Res Function(_ColorManagers) then) =
      __$ColorManagersCopyWithImpl<$Res>;
  @override
  $Res call({double opacity});
}

/// @nodoc
class __$ColorManagersCopyWithImpl<$Res>
    extends _$ColorManagersCopyWithImpl<$Res>
    implements _$ColorManagersCopyWith<$Res> {
  __$ColorManagersCopyWithImpl(
      _ColorManagers _value, $Res Function(_ColorManagers) _then)
      : super(_value, (v) => _then(v as _ColorManagers));

  @override
  _ColorManagers get _value => super._value as _ColorManagers;

  @override
  $Res call({
    Object? opacity = freezed,
  }) {
    return _then(_ColorManagers(
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ColorManagers with DiagnosticableTreeMixin implements _ColorManagers {
  const _$_ColorManagers({this.opacity = 0});

  @JsonKey()
  @override
  final double opacity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorManagers(opacity: $opacity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorManagers'))
      ..add(DiagnosticsProperty('opacity', opacity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorManagers &&
            const DeepCollectionEquality().equals(other.opacity, opacity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(opacity));

  @JsonKey(ignore: true)
  @override
  _$ColorManagersCopyWith<_ColorManagers> get copyWith =>
      __$ColorManagersCopyWithImpl<_ColorManagers>(this, _$identity);
}

abstract class _ColorManagers implements ColorManagers {
  const factory _ColorManagers({double opacity}) = _$_ColorManagers;

  @override
  double get opacity;
  @override
  @JsonKey(ignore: true)
  _$ColorManagersCopyWith<_ColorManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmManagersTearOff {
  const _$AlarmManagersTearOff();

  _AlarmManagers call(
      {int alarmHour = 12, int alarmMinute = 00, bool showFAB = false}) {
    return _AlarmManagers(
      alarmHour: alarmHour,
      alarmMinute: alarmMinute,
      showFAB: showFAB,
    );
  }
}

/// @nodoc
const $AlarmManagers = _$AlarmManagersTearOff();

/// @nodoc
mixin _$AlarmManagers {
  int get alarmHour => throw _privateConstructorUsedError;
  int get alarmMinute => throw _privateConstructorUsedError;
  bool get showFAB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmManagersCopyWith<AlarmManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmManagersCopyWith<$Res> {
  factory $AlarmManagersCopyWith(
          AlarmManagers value, $Res Function(AlarmManagers) then) =
      _$AlarmManagersCopyWithImpl<$Res>;
  $Res call({int alarmHour, int alarmMinute, bool showFAB});
}

/// @nodoc
class _$AlarmManagersCopyWithImpl<$Res>
    implements $AlarmManagersCopyWith<$Res> {
  _$AlarmManagersCopyWithImpl(this._value, this._then);

  final AlarmManagers _value;
  // ignore: unused_field
  final $Res Function(AlarmManagers) _then;

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
abstract class _$AlarmManagersCopyWith<$Res>
    implements $AlarmManagersCopyWith<$Res> {
  factory _$AlarmManagersCopyWith(
          _AlarmManagers value, $Res Function(_AlarmManagers) then) =
      __$AlarmManagersCopyWithImpl<$Res>;
  @override
  $Res call({int alarmHour, int alarmMinute, bool showFAB});
}

/// @nodoc
class __$AlarmManagersCopyWithImpl<$Res>
    extends _$AlarmManagersCopyWithImpl<$Res>
    implements _$AlarmManagersCopyWith<$Res> {
  __$AlarmManagersCopyWithImpl(
      _AlarmManagers _value, $Res Function(_AlarmManagers) _then)
      : super(_value, (v) => _then(v as _AlarmManagers));

  @override
  _AlarmManagers get _value => super._value as _AlarmManagers;

  @override
  $Res call({
    Object? alarmHour = freezed,
    Object? alarmMinute = freezed,
    Object? showFAB = freezed,
  }) {
    return _then(_AlarmManagers(
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

class _$_AlarmManagers with DiagnosticableTreeMixin implements _AlarmManagers {
  const _$_AlarmManagers(
      {this.alarmHour = 12, this.alarmMinute = 00, this.showFAB = false});

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
    return 'AlarmManagers(alarmHour: $alarmHour, alarmMinute: $alarmMinute, showFAB: $showFAB)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmManagers'))
      ..add(DiagnosticsProperty('alarmHour', alarmHour))
      ..add(DiagnosticsProperty('alarmMinute', alarmMinute))
      ..add(DiagnosticsProperty('showFAB', showFAB));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmManagers &&
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
  _$AlarmManagersCopyWith<_AlarmManagers> get copyWith =>
      __$AlarmManagersCopyWithImpl<_AlarmManagers>(this, _$identity);
}

abstract class _AlarmManagers implements AlarmManagers {
  const factory _AlarmManagers({int alarmHour, int alarmMinute, bool showFAB}) =
      _$_AlarmManagers;

  @override
  int get alarmHour;
  @override
  int get alarmMinute;
  @override
  bool get showFAB;
  @override
  @JsonKey(ignore: true)
  _$AlarmManagersCopyWith<_AlarmManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmTimeKeepingManagersTearOff {
  const _$AlarmTimeKeepingManagersTearOff();

  _AlarmTimeKeepingManagers call(
      {Duration duration = const Duration(seconds: 1)}) {
    return _AlarmTimeKeepingManagers(
      duration: duration,
    );
  }
}

/// @nodoc
const $AlarmTimeKeepingManagers = _$AlarmTimeKeepingManagersTearOff();

/// @nodoc
mixin _$AlarmTimeKeepingManagers {
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmTimeKeepingManagersCopyWith<AlarmTimeKeepingManagers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmTimeKeepingManagersCopyWith<$Res> {
  factory $AlarmTimeKeepingManagersCopyWith(AlarmTimeKeepingManagers value,
          $Res Function(AlarmTimeKeepingManagers) then) =
      _$AlarmTimeKeepingManagersCopyWithImpl<$Res>;
  $Res call({Duration duration});
}

/// @nodoc
class _$AlarmTimeKeepingManagersCopyWithImpl<$Res>
    implements $AlarmTimeKeepingManagersCopyWith<$Res> {
  _$AlarmTimeKeepingManagersCopyWithImpl(this._value, this._then);

  final AlarmTimeKeepingManagers _value;
  // ignore: unused_field
  final $Res Function(AlarmTimeKeepingManagers) _then;

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
abstract class _$AlarmTimeKeepingManagersCopyWith<$Res>
    implements $AlarmTimeKeepingManagersCopyWith<$Res> {
  factory _$AlarmTimeKeepingManagersCopyWith(_AlarmTimeKeepingManagers value,
          $Res Function(_AlarmTimeKeepingManagers) then) =
      __$AlarmTimeKeepingManagersCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration});
}

/// @nodoc
class __$AlarmTimeKeepingManagersCopyWithImpl<$Res>
    extends _$AlarmTimeKeepingManagersCopyWithImpl<$Res>
    implements _$AlarmTimeKeepingManagersCopyWith<$Res> {
  __$AlarmTimeKeepingManagersCopyWithImpl(_AlarmTimeKeepingManagers _value,
      $Res Function(_AlarmTimeKeepingManagers) _then)
      : super(_value, (v) => _then(v as _AlarmTimeKeepingManagers));

  @override
  _AlarmTimeKeepingManagers get _value =>
      super._value as _AlarmTimeKeepingManagers;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_AlarmTimeKeepingManagers(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_AlarmTimeKeepingManagers
    with DiagnosticableTreeMixin
    implements _AlarmTimeKeepingManagers {
  const _$_AlarmTimeKeepingManagers(
      {this.duration = const Duration(seconds: 1)});

  @JsonKey()
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmTimeKeepingManagers(duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmTimeKeepingManagers'))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmTimeKeepingManagers &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$AlarmTimeKeepingManagersCopyWith<_AlarmTimeKeepingManagers> get copyWith =>
      __$AlarmTimeKeepingManagersCopyWithImpl<_AlarmTimeKeepingManagers>(
          this, _$identity);
}

abstract class _AlarmTimeKeepingManagers implements AlarmTimeKeepingManagers {
  const factory _AlarmTimeKeepingManagers({Duration duration}) =
      _$_AlarmTimeKeepingManagers;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$AlarmTimeKeepingManagersCopyWith<_AlarmTimeKeepingManagers> get copyWith =>
      throw _privateConstructorUsedError;
}
