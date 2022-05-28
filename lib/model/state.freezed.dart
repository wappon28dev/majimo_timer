// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GlobalStateTearOff {
  const _$GlobalStateTearOff();

  _GlobalState call({bool isFirst = true, bool isTimeKeeping = false}) {
    return _GlobalState(
      isFirst: isFirst,
      isTimeKeeping: isTimeKeeping,
    );
  }
}

/// @nodoc
const $GlobalState = _$GlobalStateTearOff();

/// @nodoc
mixin _$GlobalState {
  bool get isFirst => throw _privateConstructorUsedError;
  bool get isTimeKeeping => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalStateCopyWith<GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<$Res> {
  factory $GlobalStateCopyWith(
          GlobalState value, $Res Function(GlobalState) then) =
      _$GlobalStateCopyWithImpl<$Res>;
  $Res call({bool isFirst, bool isTimeKeeping});
}

/// @nodoc
class _$GlobalStateCopyWithImpl<$Res> implements $GlobalStateCopyWith<$Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

  final GlobalState _value;
  // ignore: unused_field
  final $Res Function(GlobalState) _then;

  @override
  $Res call({
    Object? isFirst = freezed,
    Object? isTimeKeeping = freezed,
  }) {
    return _then(_value.copyWith(
      isFirst: isFirst == freezed
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeKeeping: isTimeKeeping == freezed
          ? _value.isTimeKeeping
          : isTimeKeeping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GlobalStateCopyWith<$Res>
    implements $GlobalStateCopyWith<$Res> {
  factory _$GlobalStateCopyWith(
          _GlobalState value, $Res Function(_GlobalState) then) =
      __$GlobalStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isFirst, bool isTimeKeeping});
}

/// @nodoc
class __$GlobalStateCopyWithImpl<$Res> extends _$GlobalStateCopyWithImpl<$Res>
    implements _$GlobalStateCopyWith<$Res> {
  __$GlobalStateCopyWithImpl(
      _GlobalState _value, $Res Function(_GlobalState) _then)
      : super(_value, (v) => _then(v as _GlobalState));

  @override
  _GlobalState get _value => super._value as _GlobalState;

  @override
  $Res call({
    Object? isFirst = freezed,
    Object? isTimeKeeping = freezed,
  }) {
    return _then(_GlobalState(
      isFirst: isFirst == freezed
          ? _value.isFirst
          : isFirst // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeKeeping: isTimeKeeping == freezed
          ? _value.isTimeKeeping
          : isTimeKeeping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GlobalState with DiagnosticableTreeMixin implements _GlobalState {
  const _$_GlobalState({this.isFirst = true, this.isTimeKeeping = false});

  @JsonKey()
  @override
  final bool isFirst;
  @JsonKey()
  @override
  final bool isTimeKeeping;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalState(isFirst: $isFirst, isTimeKeeping: $isTimeKeeping)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GlobalState'))
      ..add(DiagnosticsProperty('isFirst', isFirst))
      ..add(DiagnosticsProperty('isTimeKeeping', isTimeKeeping));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalState &&
            const DeepCollectionEquality().equals(other.isFirst, isFirst) &&
            const DeepCollectionEquality()
                .equals(other.isTimeKeeping, isTimeKeeping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFirst),
      const DeepCollectionEquality().hash(isTimeKeeping));

  @JsonKey(ignore: true)
  @override
  _$GlobalStateCopyWith<_GlobalState> get copyWith =>
      __$GlobalStateCopyWithImpl<_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  const factory _GlobalState({bool isFirst, bool isTimeKeeping}) =
      _$_GlobalState;

  @override
  bool get isFirst;
  @override
  bool get isTimeKeeping;
  @override
  @JsonKey(ignore: true)
  _$GlobalStateCopyWith<_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GeneralStateTearOff {
  const _$GeneralStateTearOff();

  _GeneralState call(
      {String status = 'まじもタイマーへようこそ！',
      bool topToast = false,
      int toastDuration = 3,
      double opacity = 1,
      bool showFAB = false}) {
    return _GeneralState(
      status: status,
      topToast: topToast,
      toastDuration: toastDuration,
      opacity: opacity,
      showFAB: showFAB,
    );
  }
}

/// @nodoc
const $GeneralState = _$GeneralStateTearOff();

/// @nodoc
mixin _$GeneralState {
  String get status => throw _privateConstructorUsedError;
  bool get topToast => throw _privateConstructorUsedError;
  int get toastDuration => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;
  bool get showFAB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralStateCopyWith<GeneralState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralStateCopyWith<$Res> {
  factory $GeneralStateCopyWith(
          GeneralState value, $Res Function(GeneralState) then) =
      _$GeneralStateCopyWithImpl<$Res>;
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB});
}

/// @nodoc
class _$GeneralStateCopyWithImpl<$Res> implements $GeneralStateCopyWith<$Res> {
  _$GeneralStateCopyWithImpl(this._value, this._then);

  final GeneralState _value;
  // ignore: unused_field
  final $Res Function(GeneralState) _then;

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
abstract class _$GeneralStateCopyWith<$Res>
    implements $GeneralStateCopyWith<$Res> {
  factory _$GeneralStateCopyWith(
          _GeneralState value, $Res Function(_GeneralState) then) =
      __$GeneralStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB});
}

/// @nodoc
class __$GeneralStateCopyWithImpl<$Res> extends _$GeneralStateCopyWithImpl<$Res>
    implements _$GeneralStateCopyWith<$Res> {
  __$GeneralStateCopyWithImpl(
      _GeneralState _value, $Res Function(_GeneralState) _then)
      : super(_value, (v) => _then(v as _GeneralState));

  @override
  _GeneralState get _value => super._value as _GeneralState;

  @override
  $Res call({
    Object? status = freezed,
    Object? topToast = freezed,
    Object? toastDuration = freezed,
    Object? opacity = freezed,
    Object? showFAB = freezed,
  }) {
    return _then(_GeneralState(
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

class _$_GeneralState extends _GeneralState with DiagnosticableTreeMixin {
  const _$_GeneralState(
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
    return 'GeneralState(status: $status, topToast: $topToast, toastDuration: $toastDuration, opacity: $opacity, showFAB: $showFAB)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralState'))
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
            other is _GeneralState &&
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
  _$GeneralStateCopyWith<_GeneralState> get copyWith =>
      __$GeneralStateCopyWithImpl<_GeneralState>(this, _$identity);
}

abstract class _GeneralState extends GeneralState {
  const factory _GeneralState(
      {String status,
      bool topToast,
      int toastDuration,
      double opacity,
      bool showFAB}) = _$_GeneralState;
  const _GeneralState._() : super._();

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
  _$GeneralStateCopyWith<_GeneralState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _ThemeState call(
      {int theme = 0,
      bool isUsingMaterialYou = false,
      Color seedColor = Colors.white}) {
    return _ThemeState(
      theme: theme,
      isUsingMaterialYou: isUsingMaterialYou,
      seedColor: seedColor,
    );
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  int get theme => throw _privateConstructorUsedError;
  bool get isUsingMaterialYou => throw _privateConstructorUsedError;
  Color get seedColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({int theme, bool isUsingMaterialYou, Color seedColor});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object? theme = freezed,
    Object? isUsingMaterialYou = freezed,
    Object? seedColor = freezed,
  }) {
    return _then(_value.copyWith(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int,
      isUsingMaterialYou: isUsingMaterialYou == freezed
          ? _value.isUsingMaterialYou
          : isUsingMaterialYou // ignore: cast_nullable_to_non_nullable
              as bool,
      seedColor: seedColor == freezed
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
abstract class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) then) =
      __$ThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({int theme, bool isUsingMaterialYou, Color seedColor});
}

/// @nodoc
class __$ThemeStateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(
      _ThemeState _value, $Res Function(_ThemeState) _then)
      : super(_value, (v) => _then(v as _ThemeState));

  @override
  _ThemeState get _value => super._value as _ThemeState;

  @override
  $Res call({
    Object? theme = freezed,
    Object? isUsingMaterialYou = freezed,
    Object? seedColor = freezed,
  }) {
    return _then(_ThemeState(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as int,
      isUsingMaterialYou: isUsingMaterialYou == freezed
          ? _value.isUsingMaterialYou
          : isUsingMaterialYou // ignore: cast_nullable_to_non_nullable
              as bool,
      seedColor: seedColor == freezed
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ThemeState extends _ThemeState with DiagnosticableTreeMixin {
  const _$_ThemeState(
      {this.theme = 0,
      this.isUsingMaterialYou = false,
      this.seedColor = Colors.white})
      : super._();

  @JsonKey()
  @override
  final int theme;
  @JsonKey()
  @override
  final bool isUsingMaterialYou;
  @JsonKey()
  @override
  final Color seedColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState(theme: $theme, isUsingMaterialYou: $isUsingMaterialYou, seedColor: $seedColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState'))
      ..add(DiagnosticsProperty('theme', theme))
      ..add(DiagnosticsProperty('isUsingMaterialYou', isUsingMaterialYou))
      ..add(DiagnosticsProperty('seedColor', seedColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeState &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality()
                .equals(other.isUsingMaterialYou, isUsingMaterialYou) &&
            const DeepCollectionEquality().equals(other.seedColor, seedColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(theme),
      const DeepCollectionEquality().hash(isUsingMaterialYou),
      const DeepCollectionEquality().hash(seedColor));

  @JsonKey(ignore: true)
  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);
}

abstract class _ThemeState extends ThemeState {
  const factory _ThemeState(
      {int theme, bool isUsingMaterialYou, Color seedColor}) = _$_ThemeState;
  const _ThemeState._() : super._();

  @override
  int get theme;
  @override
  bool get isUsingMaterialYou;
  @override
  Color get seedColor;
  @override
  @JsonKey(ignore: true)
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LangStateTearOff {
  const _$LangStateTearOff();

  _LangState call({int lang = 0}) {
    return _LangState(
      lang: lang,
    );
  }
}

/// @nodoc
const $LangState = _$LangStateTearOff();

/// @nodoc
mixin _$LangState {
  int get lang => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LangStateCopyWith<LangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangStateCopyWith<$Res> {
  factory $LangStateCopyWith(LangState value, $Res Function(LangState) then) =
      _$LangStateCopyWithImpl<$Res>;
  $Res call({int lang});
}

/// @nodoc
class _$LangStateCopyWithImpl<$Res> implements $LangStateCopyWith<$Res> {
  _$LangStateCopyWithImpl(this._value, this._then);

  final LangState _value;
  // ignore: unused_field
  final $Res Function(LangState) _then;

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
abstract class _$LangStateCopyWith<$Res> implements $LangStateCopyWith<$Res> {
  factory _$LangStateCopyWith(
          _LangState value, $Res Function(_LangState) then) =
      __$LangStateCopyWithImpl<$Res>;
  @override
  $Res call({int lang});
}

/// @nodoc
class __$LangStateCopyWithImpl<$Res> extends _$LangStateCopyWithImpl<$Res>
    implements _$LangStateCopyWith<$Res> {
  __$LangStateCopyWithImpl(_LangState _value, $Res Function(_LangState) _then)
      : super(_value, (v) => _then(v as _LangState));

  @override
  _LangState get _value => super._value as _LangState;

  @override
  $Res call({
    Object? lang = freezed,
  }) {
    return _then(_LangState(
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LangState extends _LangState with DiagnosticableTreeMixin {
  const _$_LangState({this.lang = 0}) : super._();

  @JsonKey()
  @override
  final int lang;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LangState(lang: $lang)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LangState'))
      ..add(DiagnosticsProperty('lang', lang));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LangState &&
            const DeepCollectionEquality().equals(other.lang, lang));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lang));

  @JsonKey(ignore: true)
  @override
  _$LangStateCopyWith<_LangState> get copyWith =>
      __$LangStateCopyWithImpl<_LangState>(this, _$identity);
}

abstract class _LangState extends LangState {
  const factory _LangState({int lang}) = _$_LangState;
  const _LangState._() : super._();

  @override
  int get lang;
  @override
  @JsonKey(ignore: true)
  _$LangStateCopyWith<_LangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ClockStateTearOff {
  const _$ClockStateTearOff();

  _ClockState call({bool is24 = true, bool showSec = true, int animation = 0}) {
    return _ClockState(
      is24: is24,
      showSec: showSec,
      animation: animation,
    );
  }
}

/// @nodoc
const $ClockState = _$ClockStateTearOff();

/// @nodoc
mixin _$ClockState {
  bool get is24 => throw _privateConstructorUsedError;
  bool get showSec => throw _privateConstructorUsedError;
  int get animation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClockStateCopyWith<ClockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockStateCopyWith<$Res> {
  factory $ClockStateCopyWith(
          ClockState value, $Res Function(ClockState) then) =
      _$ClockStateCopyWithImpl<$Res>;
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class _$ClockStateCopyWithImpl<$Res> implements $ClockStateCopyWith<$Res> {
  _$ClockStateCopyWithImpl(this._value, this._then);

  final ClockState _value;
  // ignore: unused_field
  final $Res Function(ClockState) _then;

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
abstract class _$ClockStateCopyWith<$Res> implements $ClockStateCopyWith<$Res> {
  factory _$ClockStateCopyWith(
          _ClockState value, $Res Function(_ClockState) then) =
      __$ClockStateCopyWithImpl<$Res>;
  @override
  $Res call({bool is24, bool showSec, int animation});
}

/// @nodoc
class __$ClockStateCopyWithImpl<$Res> extends _$ClockStateCopyWithImpl<$Res>
    implements _$ClockStateCopyWith<$Res> {
  __$ClockStateCopyWithImpl(
      _ClockState _value, $Res Function(_ClockState) _then)
      : super(_value, (v) => _then(v as _ClockState));

  @override
  _ClockState get _value => super._value as _ClockState;

  @override
  $Res call({
    Object? is24 = freezed,
    Object? showSec = freezed,
    Object? animation = freezed,
  }) {
    return _then(_ClockState(
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

class _$_ClockState extends _ClockState with DiagnosticableTreeMixin {
  const _$_ClockState(
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
    return 'ClockState(is24: $is24, showSec: $showSec, animation: $animation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClockState'))
      ..add(DiagnosticsProperty('is24', is24))
      ..add(DiagnosticsProperty('showSec', showSec))
      ..add(DiagnosticsProperty('animation', animation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClockState &&
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
  _$ClockStateCopyWith<_ClockState> get copyWith =>
      __$ClockStateCopyWithImpl<_ClockState>(this, _$identity);
}

abstract class _ClockState extends ClockState {
  const factory _ClockState({bool is24, bool showSec, int animation}) =
      _$_ClockState;
  const _ClockState._() : super._();

  @override
  bool get is24;
  @override
  bool get showSec;
  @override
  int get animation;
  @override
  @JsonKey(ignore: true)
  _$ClockStateCopyWith<_ClockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ColorStateTearOff {
  const _$ColorStateTearOff();

  _ColorState call({double opacity = 0}) {
    return _ColorState(
      opacity: opacity,
    );
  }
}

/// @nodoc
const $ColorState = _$ColorStateTearOff();

/// @nodoc
mixin _$ColorState {
  double get opacity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorStateCopyWith<ColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res>;
  $Res call({double opacity});
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res> implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  final ColorState _value;
  // ignore: unused_field
  final $Res Function(ColorState) _then;

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
abstract class _$ColorStateCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory _$ColorStateCopyWith(
          _ColorState value, $Res Function(_ColorState) then) =
      __$ColorStateCopyWithImpl<$Res>;
  @override
  $Res call({double opacity});
}

/// @nodoc
class __$ColorStateCopyWithImpl<$Res> extends _$ColorStateCopyWithImpl<$Res>
    implements _$ColorStateCopyWith<$Res> {
  __$ColorStateCopyWithImpl(
      _ColorState _value, $Res Function(_ColorState) _then)
      : super(_value, (v) => _then(v as _ColorState));

  @override
  _ColorState get _value => super._value as _ColorState;

  @override
  $Res call({
    Object? opacity = freezed,
  }) {
    return _then(_ColorState(
      opacity: opacity == freezed
          ? _value.opacity
          : opacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ColorState extends _ColorState with DiagnosticableTreeMixin {
  const _$_ColorState({this.opacity = 0}) : super._();

  @JsonKey()
  @override
  final double opacity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorState(opacity: $opacity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorState'))
      ..add(DiagnosticsProperty('opacity', opacity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColorState &&
            const DeepCollectionEquality().equals(other.opacity, opacity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(opacity));

  @JsonKey(ignore: true)
  @override
  _$ColorStateCopyWith<_ColorState> get copyWith =>
      __$ColorStateCopyWithImpl<_ColorState>(this, _$identity);
}

abstract class _ColorState extends ColorState {
  const factory _ColorState({double opacity}) = _$_ColorState;
  const _ColorState._() : super._();

  @override
  double get opacity;
  @override
  @JsonKey(ignore: true)
  _$ColorStateCopyWith<_ColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmStateTearOff {
  const _$AlarmStateTearOff();

  _AlarmState call(
      {TimeOfDay targetTime = const TimeOfDay(hour: 12, minute: 00)}) {
    return _AlarmState(
      targetTime: targetTime,
    );
  }
}

/// @nodoc
const $AlarmState = _$AlarmStateTearOff();

/// @nodoc
mixin _$AlarmState {
  TimeOfDay get targetTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmStateCopyWith<AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
          AlarmState value, $Res Function(AlarmState) then) =
      _$AlarmStateCopyWithImpl<$Res>;
  $Res call({TimeOfDay targetTime});
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res> implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  final AlarmState _value;
  // ignore: unused_field
  final $Res Function(AlarmState) _then;

  @override
  $Res call({
    Object? targetTime = freezed,
  }) {
    return _then(_value.copyWith(
      targetTime: targetTime == freezed
          ? _value.targetTime
          : targetTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
abstract class _$AlarmStateCopyWith<$Res> implements $AlarmStateCopyWith<$Res> {
  factory _$AlarmStateCopyWith(
          _AlarmState value, $Res Function(_AlarmState) then) =
      __$AlarmStateCopyWithImpl<$Res>;
  @override
  $Res call({TimeOfDay targetTime});
}

/// @nodoc
class __$AlarmStateCopyWithImpl<$Res> extends _$AlarmStateCopyWithImpl<$Res>
    implements _$AlarmStateCopyWith<$Res> {
  __$AlarmStateCopyWithImpl(
      _AlarmState _value, $Res Function(_AlarmState) _then)
      : super(_value, (v) => _then(v as _AlarmState));

  @override
  _AlarmState get _value => super._value as _AlarmState;

  @override
  $Res call({
    Object? targetTime = freezed,
  }) {
    return _then(_AlarmState(
      targetTime: targetTime == freezed
          ? _value.targetTime
          : targetTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$_AlarmState extends _AlarmState with DiagnosticableTreeMixin {
  const _$_AlarmState({this.targetTime = const TimeOfDay(hour: 12, minute: 00)})
      : super._();

  @JsonKey()
  @override
  final TimeOfDay targetTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmState(targetTime: $targetTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmState'))
      ..add(DiagnosticsProperty('targetTime', targetTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmState &&
            const DeepCollectionEquality()
                .equals(other.targetTime, targetTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(targetTime));

  @JsonKey(ignore: true)
  @override
  _$AlarmStateCopyWith<_AlarmState> get copyWith =>
      __$AlarmStateCopyWithImpl<_AlarmState>(this, _$identity);
}

abstract class _AlarmState extends AlarmState {
  const factory _AlarmState({TimeOfDay targetTime}) = _$_AlarmState;
  const _AlarmState._() : super._();

  @override
  TimeOfDay get targetTime;
  @override
  @JsonKey(ignore: true)
  _$AlarmStateCopyWith<_AlarmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AlarmTimeKeepingStateTearOff {
  const _$AlarmTimeKeepingStateTearOff();

  _AlarmTimeKeepingState call(
      {Duration targetDuration = const Duration(seconds: 1),
      TimeOfDay startedTime = const TimeOfDay(hour: 12, minute: 00),
      String headerText = ''}) {
    return _AlarmTimeKeepingState(
      targetDuration: targetDuration,
      startedTime: startedTime,
      headerText: headerText,
    );
  }
}

/// @nodoc
const $AlarmTimeKeepingState = _$AlarmTimeKeepingStateTearOff();

/// @nodoc
mixin _$AlarmTimeKeepingState {
  Duration get targetDuration => throw _privateConstructorUsedError;
  TimeOfDay get startedTime => throw _privateConstructorUsedError;
  String get headerText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmTimeKeepingStateCopyWith<AlarmTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmTimeKeepingStateCopyWith<$Res> {
  factory $AlarmTimeKeepingStateCopyWith(AlarmTimeKeepingState value,
          $Res Function(AlarmTimeKeepingState) then) =
      _$AlarmTimeKeepingStateCopyWithImpl<$Res>;
  $Res call(
      {Duration targetDuration, TimeOfDay startedTime, String headerText});
}

/// @nodoc
class _$AlarmTimeKeepingStateCopyWithImpl<$Res>
    implements $AlarmTimeKeepingStateCopyWith<$Res> {
  _$AlarmTimeKeepingStateCopyWithImpl(this._value, this._then);

  final AlarmTimeKeepingState _value;
  // ignore: unused_field
  final $Res Function(AlarmTimeKeepingState) _then;

  @override
  $Res call({
    Object? targetDuration = freezed,
    Object? startedTime = freezed,
    Object? headerText = freezed,
  }) {
    return _then(_value.copyWith(
      targetDuration: targetDuration == freezed
          ? _value.targetDuration
          : targetDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      headerText: headerText == freezed
          ? _value.headerText
          : headerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AlarmTimeKeepingStateCopyWith<$Res>
    implements $AlarmTimeKeepingStateCopyWith<$Res> {
  factory _$AlarmTimeKeepingStateCopyWith(_AlarmTimeKeepingState value,
          $Res Function(_AlarmTimeKeepingState) then) =
      __$AlarmTimeKeepingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Duration targetDuration, TimeOfDay startedTime, String headerText});
}

/// @nodoc
class __$AlarmTimeKeepingStateCopyWithImpl<$Res>
    extends _$AlarmTimeKeepingStateCopyWithImpl<$Res>
    implements _$AlarmTimeKeepingStateCopyWith<$Res> {
  __$AlarmTimeKeepingStateCopyWithImpl(_AlarmTimeKeepingState _value,
      $Res Function(_AlarmTimeKeepingState) _then)
      : super(_value, (v) => _then(v as _AlarmTimeKeepingState));

  @override
  _AlarmTimeKeepingState get _value => super._value as _AlarmTimeKeepingState;

  @override
  $Res call({
    Object? targetDuration = freezed,
    Object? startedTime = freezed,
    Object? headerText = freezed,
  }) {
    return _then(_AlarmTimeKeepingState(
      targetDuration: targetDuration == freezed
          ? _value.targetDuration
          : targetDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      headerText: headerText == freezed
          ? _value.headerText
          : headerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AlarmTimeKeepingState extends _AlarmTimeKeepingState
    with DiagnosticableTreeMixin {
  const _$_AlarmTimeKeepingState(
      {this.targetDuration = const Duration(seconds: 1),
      this.startedTime = const TimeOfDay(hour: 12, minute: 00),
      this.headerText = ''})
      : super._();

  @JsonKey()
  @override
  final Duration targetDuration;
  @JsonKey()
  @override
  final TimeOfDay startedTime;
  @JsonKey()
  @override
  final String headerText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlarmTimeKeepingState(targetDuration: $targetDuration, startedTime: $startedTime, headerText: $headerText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlarmTimeKeepingState'))
      ..add(DiagnosticsProperty('targetDuration', targetDuration))
      ..add(DiagnosticsProperty('startedTime', startedTime))
      ..add(DiagnosticsProperty('headerText', headerText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlarmTimeKeepingState &&
            const DeepCollectionEquality()
                .equals(other.targetDuration, targetDuration) &&
            const DeepCollectionEquality()
                .equals(other.startedTime, startedTime) &&
            const DeepCollectionEquality()
                .equals(other.headerText, headerText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(targetDuration),
      const DeepCollectionEquality().hash(startedTime),
      const DeepCollectionEquality().hash(headerText));

  @JsonKey(ignore: true)
  @override
  _$AlarmTimeKeepingStateCopyWith<_AlarmTimeKeepingState> get copyWith =>
      __$AlarmTimeKeepingStateCopyWithImpl<_AlarmTimeKeepingState>(
          this, _$identity);
}

abstract class _AlarmTimeKeepingState extends AlarmTimeKeepingState {
  const factory _AlarmTimeKeepingState(
      {Duration targetDuration,
      TimeOfDay startedTime,
      String headerText}) = _$_AlarmTimeKeepingState;
  const _AlarmTimeKeepingState._() : super._();

  @override
  Duration get targetDuration;
  @override
  TimeOfDay get startedTime;
  @override
  String get headerText;
  @override
  @JsonKey(ignore: true)
  _$AlarmTimeKeepingStateCopyWith<_AlarmTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  _TimerState call(
      {Duration targetDuration = const Duration(minutes: 1),
      Duration targetIntervalDuration = const Duration(minutes: 1),
      int targetIntervalLoopingNum = 0}) {
    return _TimerState(
      targetDuration: targetDuration,
      targetIntervalDuration: targetIntervalDuration,
      targetIntervalLoopingNum: targetIntervalLoopingNum,
    );
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  Duration get targetDuration => throw _privateConstructorUsedError;
  Duration get targetIntervalDuration => throw _privateConstructorUsedError;
  int get targetIntervalLoopingNum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
  $Res call(
      {Duration targetDuration,
      Duration targetIntervalDuration,
      int targetIntervalLoopingNum});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;

  @override
  $Res call({
    Object? targetDuration = freezed,
    Object? targetIntervalDuration = freezed,
    Object? targetIntervalLoopingNum = freezed,
  }) {
    return _then(_value.copyWith(
      targetDuration: targetDuration == freezed
          ? _value.targetDuration
          : targetDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      targetIntervalDuration: targetIntervalDuration == freezed
          ? _value.targetIntervalDuration
          : targetIntervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      targetIntervalLoopingNum: targetIntervalLoopingNum == freezed
          ? _value.targetIntervalLoopingNum
          : targetIntervalLoopingNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) then) =
      __$TimerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Duration targetDuration,
      Duration targetIntervalDuration,
      int targetIntervalLoopingNum});
}

/// @nodoc
class __$TimerStateCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(
      _TimerState _value, $Res Function(_TimerState) _then)
      : super(_value, (v) => _then(v as _TimerState));

  @override
  _TimerState get _value => super._value as _TimerState;

  @override
  $Res call({
    Object? targetDuration = freezed,
    Object? targetIntervalDuration = freezed,
    Object? targetIntervalLoopingNum = freezed,
  }) {
    return _then(_TimerState(
      targetDuration: targetDuration == freezed
          ? _value.targetDuration
          : targetDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      targetIntervalDuration: targetIntervalDuration == freezed
          ? _value.targetIntervalDuration
          : targetIntervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      targetIntervalLoopingNum: targetIntervalLoopingNum == freezed
          ? _value.targetIntervalLoopingNum
          : targetIntervalLoopingNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TimerState extends _TimerState with DiagnosticableTreeMixin {
  const _$_TimerState(
      {this.targetDuration = const Duration(minutes: 1),
      this.targetIntervalDuration = const Duration(minutes: 1),
      this.targetIntervalLoopingNum = 0})
      : super._();

  @JsonKey()
  @override
  final Duration targetDuration;
  @JsonKey()
  @override
  final Duration targetIntervalDuration;
  @JsonKey()
  @override
  final int targetIntervalLoopingNum;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState(targetDuration: $targetDuration, targetIntervalDuration: $targetIntervalDuration, targetIntervalLoopingNum: $targetIntervalLoopingNum)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerState'))
      ..add(DiagnosticsProperty('targetDuration', targetDuration))
      ..add(
          DiagnosticsProperty('targetIntervalDuration', targetIntervalDuration))
      ..add(DiagnosticsProperty(
          'targetIntervalLoopingNum', targetIntervalLoopingNum));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerState &&
            const DeepCollectionEquality()
                .equals(other.targetDuration, targetDuration) &&
            const DeepCollectionEquality()
                .equals(other.targetIntervalDuration, targetIntervalDuration) &&
            const DeepCollectionEquality().equals(
                other.targetIntervalLoopingNum, targetIntervalLoopingNum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(targetDuration),
      const DeepCollectionEquality().hash(targetIntervalDuration),
      const DeepCollectionEquality().hash(targetIntervalLoopingNum));

  @JsonKey(ignore: true)
  @override
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {Duration targetDuration,
      Duration targetIntervalDuration,
      int targetIntervalLoopingNum}) = _$_TimerState;
  const _TimerState._() : super._();

  @override
  Duration get targetDuration;
  @override
  Duration get targetIntervalDuration;
  @override
  int get targetIntervalLoopingNum;
  @override
  @JsonKey(ignore: true)
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimerTimeKeepingStateTearOff {
  const _$TimerTimeKeepingStateTearOff();

  _TimerTimeKeepingState call(
      {DateTime? startedTime,
      DateTime? startedIntervalTime,
      bool isPaused = false,
      DateTime? pausedTime,
      DateTime? pausedIntervalTime,
      Duration pausedDuration = Duration.zero,
      Duration pausedIntervalDuration = Duration.zero,
      bool isCountingInterval = false,
      int currentIntervalLoopingNum = 0}) {
    return _TimerTimeKeepingState(
      startedTime: startedTime,
      startedIntervalTime: startedIntervalTime,
      isPaused: isPaused,
      pausedTime: pausedTime,
      pausedIntervalTime: pausedIntervalTime,
      pausedDuration: pausedDuration,
      pausedIntervalDuration: pausedIntervalDuration,
      isCountingInterval: isCountingInterval,
      currentIntervalLoopingNum: currentIntervalLoopingNum,
    );
  }
}

/// @nodoc
const $TimerTimeKeepingState = _$TimerTimeKeepingStateTearOff();

/// @nodoc
mixin _$TimerTimeKeepingState {
// started
  DateTime? get startedTime => throw _privateConstructorUsedError;
  DateTime? get startedIntervalTime =>
      throw _privateConstructorUsedError; // paused
  bool get isPaused => throw _privateConstructorUsedError;
  DateTime? get pausedTime => throw _privateConstructorUsedError;
  DateTime? get pausedIntervalTime => throw _privateConstructorUsedError;
  Duration get pausedDuration => throw _privateConstructorUsedError;
  Duration get pausedIntervalDuration =>
      throw _privateConstructorUsedError; // interval
  bool get isCountingInterval => throw _privateConstructorUsedError;
  int get currentIntervalLoopingNum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerTimeKeepingStateCopyWith<TimerTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerTimeKeepingStateCopyWith<$Res> {
  factory $TimerTimeKeepingStateCopyWith(TimerTimeKeepingState value,
          $Res Function(TimerTimeKeepingState) then) =
      _$TimerTimeKeepingStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime? startedTime,
      DateTime? startedIntervalTime,
      bool isPaused,
      DateTime? pausedTime,
      DateTime? pausedIntervalTime,
      Duration pausedDuration,
      Duration pausedIntervalDuration,
      bool isCountingInterval,
      int currentIntervalLoopingNum});
}

/// @nodoc
class _$TimerTimeKeepingStateCopyWithImpl<$Res>
    implements $TimerTimeKeepingStateCopyWith<$Res> {
  _$TimerTimeKeepingStateCopyWithImpl(this._value, this._then);

  final TimerTimeKeepingState _value;
  // ignore: unused_field
  final $Res Function(TimerTimeKeepingState) _then;

  @override
  $Res call({
    Object? startedTime = freezed,
    Object? startedIntervalTime = freezed,
    Object? isPaused = freezed,
    Object? pausedTime = freezed,
    Object? pausedIntervalTime = freezed,
    Object? pausedDuration = freezed,
    Object? pausedIntervalDuration = freezed,
    Object? isCountingInterval = freezed,
    Object? currentIntervalLoopingNum = freezed,
  }) {
    return _then(_value.copyWith(
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedIntervalTime: startedIntervalTime == freezed
          ? _value.startedIntervalTime
          : startedIntervalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaused: isPaused == freezed
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      pausedTime: pausedTime == freezed
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedIntervalTime: pausedIntervalTime == freezed
          ? _value.pausedIntervalTime
          : pausedIntervalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedDuration: pausedDuration == freezed
          ? _value.pausedDuration
          : pausedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      pausedIntervalDuration: pausedIntervalDuration == freezed
          ? _value.pausedIntervalDuration
          : pausedIntervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isCountingInterval: isCountingInterval == freezed
          ? _value.isCountingInterval
          : isCountingInterval // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIntervalLoopingNum: currentIntervalLoopingNum == freezed
          ? _value.currentIntervalLoopingNum
          : currentIntervalLoopingNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimerTimeKeepingStateCopyWith<$Res>
    implements $TimerTimeKeepingStateCopyWith<$Res> {
  factory _$TimerTimeKeepingStateCopyWith(_TimerTimeKeepingState value,
          $Res Function(_TimerTimeKeepingState) then) =
      __$TimerTimeKeepingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? startedTime,
      DateTime? startedIntervalTime,
      bool isPaused,
      DateTime? pausedTime,
      DateTime? pausedIntervalTime,
      Duration pausedDuration,
      Duration pausedIntervalDuration,
      bool isCountingInterval,
      int currentIntervalLoopingNum});
}

/// @nodoc
class __$TimerTimeKeepingStateCopyWithImpl<$Res>
    extends _$TimerTimeKeepingStateCopyWithImpl<$Res>
    implements _$TimerTimeKeepingStateCopyWith<$Res> {
  __$TimerTimeKeepingStateCopyWithImpl(_TimerTimeKeepingState _value,
      $Res Function(_TimerTimeKeepingState) _then)
      : super(_value, (v) => _then(v as _TimerTimeKeepingState));

  @override
  _TimerTimeKeepingState get _value => super._value as _TimerTimeKeepingState;

  @override
  $Res call({
    Object? startedTime = freezed,
    Object? startedIntervalTime = freezed,
    Object? isPaused = freezed,
    Object? pausedTime = freezed,
    Object? pausedIntervalTime = freezed,
    Object? pausedDuration = freezed,
    Object? pausedIntervalDuration = freezed,
    Object? isCountingInterval = freezed,
    Object? currentIntervalLoopingNum = freezed,
  }) {
    return _then(_TimerTimeKeepingState(
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedIntervalTime: startedIntervalTime == freezed
          ? _value.startedIntervalTime
          : startedIntervalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaused: isPaused == freezed
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      pausedTime: pausedTime == freezed
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedIntervalTime: pausedIntervalTime == freezed
          ? _value.pausedIntervalTime
          : pausedIntervalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedDuration: pausedDuration == freezed
          ? _value.pausedDuration
          : pausedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      pausedIntervalDuration: pausedIntervalDuration == freezed
          ? _value.pausedIntervalDuration
          : pausedIntervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isCountingInterval: isCountingInterval == freezed
          ? _value.isCountingInterval
          : isCountingInterval // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIntervalLoopingNum: currentIntervalLoopingNum == freezed
          ? _value.currentIntervalLoopingNum
          : currentIntervalLoopingNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TimerTimeKeepingState extends _TimerTimeKeepingState
    with DiagnosticableTreeMixin {
  const _$_TimerTimeKeepingState(
      {this.startedTime,
      this.startedIntervalTime,
      this.isPaused = false,
      this.pausedTime,
      this.pausedIntervalTime,
      this.pausedDuration = Duration.zero,
      this.pausedIntervalDuration = Duration.zero,
      this.isCountingInterval = false,
      this.currentIntervalLoopingNum = 0})
      : super._();

  @override // started
  final DateTime? startedTime;
  @override
  final DateTime? startedIntervalTime;
  @JsonKey()
  @override // paused
  final bool isPaused;
  @override
  final DateTime? pausedTime;
  @override
  final DateTime? pausedIntervalTime;
  @JsonKey()
  @override
  final Duration pausedDuration;
  @JsonKey()
  @override
  final Duration pausedIntervalDuration;
  @JsonKey()
  @override // interval
  final bool isCountingInterval;
  @JsonKey()
  @override
  final int currentIntervalLoopingNum;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerTimeKeepingState(startedTime: $startedTime, startedIntervalTime: $startedIntervalTime, isPaused: $isPaused, pausedTime: $pausedTime, pausedIntervalTime: $pausedIntervalTime, pausedDuration: $pausedDuration, pausedIntervalDuration: $pausedIntervalDuration, isCountingInterval: $isCountingInterval, currentIntervalLoopingNum: $currentIntervalLoopingNum)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerTimeKeepingState'))
      ..add(DiagnosticsProperty('startedTime', startedTime))
      ..add(DiagnosticsProperty('startedIntervalTime', startedIntervalTime))
      ..add(DiagnosticsProperty('isPaused', isPaused))
      ..add(DiagnosticsProperty('pausedTime', pausedTime))
      ..add(DiagnosticsProperty('pausedIntervalTime', pausedIntervalTime))
      ..add(DiagnosticsProperty('pausedDuration', pausedDuration))
      ..add(
          DiagnosticsProperty('pausedIntervalDuration', pausedIntervalDuration))
      ..add(DiagnosticsProperty('isCountingInterval', isCountingInterval))
      ..add(DiagnosticsProperty(
          'currentIntervalLoopingNum', currentIntervalLoopingNum));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerTimeKeepingState &&
            const DeepCollectionEquality()
                .equals(other.startedTime, startedTime) &&
            const DeepCollectionEquality()
                .equals(other.startedIntervalTime, startedIntervalTime) &&
            const DeepCollectionEquality().equals(other.isPaused, isPaused) &&
            const DeepCollectionEquality()
                .equals(other.pausedTime, pausedTime) &&
            const DeepCollectionEquality()
                .equals(other.pausedIntervalTime, pausedIntervalTime) &&
            const DeepCollectionEquality()
                .equals(other.pausedDuration, pausedDuration) &&
            const DeepCollectionEquality()
                .equals(other.pausedIntervalDuration, pausedIntervalDuration) &&
            const DeepCollectionEquality()
                .equals(other.isCountingInterval, isCountingInterval) &&
            const DeepCollectionEquality().equals(
                other.currentIntervalLoopingNum, currentIntervalLoopingNum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startedTime),
      const DeepCollectionEquality().hash(startedIntervalTime),
      const DeepCollectionEquality().hash(isPaused),
      const DeepCollectionEquality().hash(pausedTime),
      const DeepCollectionEquality().hash(pausedIntervalTime),
      const DeepCollectionEquality().hash(pausedDuration),
      const DeepCollectionEquality().hash(pausedIntervalDuration),
      const DeepCollectionEquality().hash(isCountingInterval),
      const DeepCollectionEquality().hash(currentIntervalLoopingNum));

  @JsonKey(ignore: true)
  @override
  _$TimerTimeKeepingStateCopyWith<_TimerTimeKeepingState> get copyWith =>
      __$TimerTimeKeepingStateCopyWithImpl<_TimerTimeKeepingState>(
          this, _$identity);
}

abstract class _TimerTimeKeepingState extends TimerTimeKeepingState {
  const factory _TimerTimeKeepingState(
      {DateTime? startedTime,
      DateTime? startedIntervalTime,
      bool isPaused,
      DateTime? pausedTime,
      DateTime? pausedIntervalTime,
      Duration pausedDuration,
      Duration pausedIntervalDuration,
      bool isCountingInterval,
      int currentIntervalLoopingNum}) = _$_TimerTimeKeepingState;
  const _TimerTimeKeepingState._() : super._();

  @override // started
  DateTime? get startedTime;
  @override
  DateTime? get startedIntervalTime;
  @override // paused
  bool get isPaused;
  @override
  DateTime? get pausedTime;
  @override
  DateTime? get pausedIntervalTime;
  @override
  Duration get pausedDuration;
  @override
  Duration get pausedIntervalDuration;
  @override // interval
  bool get isCountingInterval;
  @override
  int get currentIntervalLoopingNum;
  @override
  @JsonKey(ignore: true)
  _$TimerTimeKeepingStateCopyWith<_TimerTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GoalStateTearOff {
  const _$GoalStateTearOff();

  _GoalState call({String goal = ''}) {
    return _GoalState(
      goal: goal,
    );
  }
}

/// @nodoc
const $GoalState = _$GoalStateTearOff();

/// @nodoc
mixin _$GoalState {
  String get goal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalStateCopyWith<GoalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalStateCopyWith<$Res> {
  factory $GoalStateCopyWith(GoalState value, $Res Function(GoalState) then) =
      _$GoalStateCopyWithImpl<$Res>;
  $Res call({String goal});
}

/// @nodoc
class _$GoalStateCopyWithImpl<$Res> implements $GoalStateCopyWith<$Res> {
  _$GoalStateCopyWithImpl(this._value, this._then);

  final GoalState _value;
  // ignore: unused_field
  final $Res Function(GoalState) _then;

  @override
  $Res call({
    Object? goal = freezed,
  }) {
    return _then(_value.copyWith(
      goal: goal == freezed
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GoalStateCopyWith<$Res> implements $GoalStateCopyWith<$Res> {
  factory _$GoalStateCopyWith(
          _GoalState value, $Res Function(_GoalState) then) =
      __$GoalStateCopyWithImpl<$Res>;
  @override
  $Res call({String goal});
}

/// @nodoc
class __$GoalStateCopyWithImpl<$Res> extends _$GoalStateCopyWithImpl<$Res>
    implements _$GoalStateCopyWith<$Res> {
  __$GoalStateCopyWithImpl(_GoalState _value, $Res Function(_GoalState) _then)
      : super(_value, (v) => _then(v as _GoalState));

  @override
  _GoalState get _value => super._value as _GoalState;

  @override
  $Res call({
    Object? goal = freezed,
  }) {
    return _then(_GoalState(
      goal: goal == freezed
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoalState extends _GoalState with DiagnosticableTreeMixin {
  const _$_GoalState({this.goal = ''}) : super._();

  @JsonKey()
  @override
  final String goal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoalState(goal: $goal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoalState'))
      ..add(DiagnosticsProperty('goal', goal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoalState &&
            const DeepCollectionEquality().equals(other.goal, goal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(goal));

  @JsonKey(ignore: true)
  @override
  _$GoalStateCopyWith<_GoalState> get copyWith =>
      __$GoalStateCopyWithImpl<_GoalState>(this, _$identity);
}

abstract class _GoalState extends GoalState {
  const factory _GoalState({String goal}) = _$_GoalState;
  const _GoalState._() : super._();

  @override
  String get goal;
  @override
  @JsonKey(ignore: true)
  _$GoalStateCopyWith<_GoalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GoalTimeKeepingStateTearOff {
  const _$GoalTimeKeepingStateTearOff();

  _GoalTimeKeepingState call(
      {int fabMode = 0,
      DateTime? startedTime,
      bool isPaused = false,
      DateTime? pausedTime,
      Duration pausedDuration = Duration.zero}) {
    return _GoalTimeKeepingState(
      fabMode: fabMode,
      startedTime: startedTime,
      isPaused: isPaused,
      pausedTime: pausedTime,
      pausedDuration: pausedDuration,
    );
  }
}

/// @nodoc
const $GoalTimeKeepingState = _$GoalTimeKeepingStateTearOff();

/// @nodoc
mixin _$GoalTimeKeepingState {
// fab
  int get fabMode => throw _privateConstructorUsedError; // started
  DateTime? get startedTime => throw _privateConstructorUsedError; // paused
  bool get isPaused => throw _privateConstructorUsedError;
  DateTime? get pausedTime => throw _privateConstructorUsedError;
  Duration get pausedDuration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalTimeKeepingStateCopyWith<GoalTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalTimeKeepingStateCopyWith<$Res> {
  factory $GoalTimeKeepingStateCopyWith(GoalTimeKeepingState value,
          $Res Function(GoalTimeKeepingState) then) =
      _$GoalTimeKeepingStateCopyWithImpl<$Res>;
  $Res call(
      {int fabMode,
      DateTime? startedTime,
      bool isPaused,
      DateTime? pausedTime,
      Duration pausedDuration});
}

/// @nodoc
class _$GoalTimeKeepingStateCopyWithImpl<$Res>
    implements $GoalTimeKeepingStateCopyWith<$Res> {
  _$GoalTimeKeepingStateCopyWithImpl(this._value, this._then);

  final GoalTimeKeepingState _value;
  // ignore: unused_field
  final $Res Function(GoalTimeKeepingState) _then;

  @override
  $Res call({
    Object? fabMode = freezed,
    Object? startedTime = freezed,
    Object? isPaused = freezed,
    Object? pausedTime = freezed,
    Object? pausedDuration = freezed,
  }) {
    return _then(_value.copyWith(
      fabMode: fabMode == freezed
          ? _value.fabMode
          : fabMode // ignore: cast_nullable_to_non_nullable
              as int,
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaused: isPaused == freezed
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      pausedTime: pausedTime == freezed
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedDuration: pausedDuration == freezed
          ? _value.pausedDuration
          : pausedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$GoalTimeKeepingStateCopyWith<$Res>
    implements $GoalTimeKeepingStateCopyWith<$Res> {
  factory _$GoalTimeKeepingStateCopyWith(_GoalTimeKeepingState value,
          $Res Function(_GoalTimeKeepingState) then) =
      __$GoalTimeKeepingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int fabMode,
      DateTime? startedTime,
      bool isPaused,
      DateTime? pausedTime,
      Duration pausedDuration});
}

/// @nodoc
class __$GoalTimeKeepingStateCopyWithImpl<$Res>
    extends _$GoalTimeKeepingStateCopyWithImpl<$Res>
    implements _$GoalTimeKeepingStateCopyWith<$Res> {
  __$GoalTimeKeepingStateCopyWithImpl(
      _GoalTimeKeepingState _value, $Res Function(_GoalTimeKeepingState) _then)
      : super(_value, (v) => _then(v as _GoalTimeKeepingState));

  @override
  _GoalTimeKeepingState get _value => super._value as _GoalTimeKeepingState;

  @override
  $Res call({
    Object? fabMode = freezed,
    Object? startedTime = freezed,
    Object? isPaused = freezed,
    Object? pausedTime = freezed,
    Object? pausedDuration = freezed,
  }) {
    return _then(_GoalTimeKeepingState(
      fabMode: fabMode == freezed
          ? _value.fabMode
          : fabMode // ignore: cast_nullable_to_non_nullable
              as int,
      startedTime: startedTime == freezed
          ? _value.startedTime
          : startedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaused: isPaused == freezed
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      pausedTime: pausedTime == freezed
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedDuration: pausedDuration == freezed
          ? _value.pausedDuration
          : pausedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_GoalTimeKeepingState extends _GoalTimeKeepingState
    with DiagnosticableTreeMixin {
  const _$_GoalTimeKeepingState(
      {this.fabMode = 0,
      this.startedTime,
      this.isPaused = false,
      this.pausedTime,
      this.pausedDuration = Duration.zero})
      : super._();

  @JsonKey()
  @override // fab
  final int fabMode;
  @override // started
  final DateTime? startedTime;
  @JsonKey()
  @override // paused
  final bool isPaused;
  @override
  final DateTime? pausedTime;
  @JsonKey()
  @override
  final Duration pausedDuration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoalTimeKeepingState(fabMode: $fabMode, startedTime: $startedTime, isPaused: $isPaused, pausedTime: $pausedTime, pausedDuration: $pausedDuration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoalTimeKeepingState'))
      ..add(DiagnosticsProperty('fabMode', fabMode))
      ..add(DiagnosticsProperty('startedTime', startedTime))
      ..add(DiagnosticsProperty('isPaused', isPaused))
      ..add(DiagnosticsProperty('pausedTime', pausedTime))
      ..add(DiagnosticsProperty('pausedDuration', pausedDuration));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoalTimeKeepingState &&
            const DeepCollectionEquality().equals(other.fabMode, fabMode) &&
            const DeepCollectionEquality()
                .equals(other.startedTime, startedTime) &&
            const DeepCollectionEquality().equals(other.isPaused, isPaused) &&
            const DeepCollectionEquality()
                .equals(other.pausedTime, pausedTime) &&
            const DeepCollectionEquality()
                .equals(other.pausedDuration, pausedDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fabMode),
      const DeepCollectionEquality().hash(startedTime),
      const DeepCollectionEquality().hash(isPaused),
      const DeepCollectionEquality().hash(pausedTime),
      const DeepCollectionEquality().hash(pausedDuration));

  @JsonKey(ignore: true)
  @override
  _$GoalTimeKeepingStateCopyWith<_GoalTimeKeepingState> get copyWith =>
      __$GoalTimeKeepingStateCopyWithImpl<_GoalTimeKeepingState>(
          this, _$identity);
}

abstract class _GoalTimeKeepingState extends GoalTimeKeepingState {
  const factory _GoalTimeKeepingState(
      {int fabMode,
      DateTime? startedTime,
      bool isPaused,
      DateTime? pausedTime,
      Duration pausedDuration}) = _$_GoalTimeKeepingState;
  const _GoalTimeKeepingState._() : super._();

  @override // fab
  int get fabMode;
  @override // started
  DateTime? get startedTime;
  @override // paused
  bool get isPaused;
  @override
  DateTime? get pausedTime;
  @override
  Duration get pausedDuration;
  @override
  @JsonKey(ignore: true)
  _$GoalTimeKeepingStateCopyWith<_GoalTimeKeepingState> get copyWith =>
      throw _privateConstructorUsedError;
}
