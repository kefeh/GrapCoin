// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirebaseFailure {
  String get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirebaseFailureCopyWith<FirebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseFailureCopyWith<$Res> {
  factory $FirebaseFailureCopyWith(
          FirebaseFailure value, $Res Function(FirebaseFailure) then) =
      _$FirebaseFailureCopyWithImpl<$Res, FirebaseFailure>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FirebaseFailureCopyWithImpl<$Res, $Val extends FirebaseFailure>
    implements $FirebaseFailureCopyWith<$Res> {
  _$FirebaseFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCopyWith<$Res>
    implements $FirebaseFailureCopyWith<$Res> {
  factory _$$UpdateCopyWith(_$Update value, $Res Function(_$Update) then) =
      __$$UpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$UpdateCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$Update>
    implements _$$UpdateCopyWith<$Res> {
  __$$UpdateCopyWithImpl(_$Update _value, $Res Function(_$Update) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Update(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Update extends Update {
  const _$Update(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'FirebaseFailure.update(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Update &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCopyWith<_$Update> get copyWith =>
      __$$UpdateCopyWithImpl<_$Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) {
    return update(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) {
    return update?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update extends FirebaseFailure {
  const factory Update(final String error) = _$Update;
  const Update._() : super._();

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCopyWith<_$Update> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCopyWith<$Res> implements $FirebaseFailureCopyWith<$Res> {
  factory _$$AddCopyWith(_$Add value, $Res Function(_$Add) then) =
      __$$AddCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AddCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$Add>
    implements _$$AddCopyWith<$Res> {
  __$$AddCopyWithImpl(_$Add _value, $Res Function(_$Add) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Add(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Add extends Add {
  const _$Add(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'FirebaseFailure.add(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Add &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCopyWith<_$Add> get copyWith =>
      __$$AddCopyWithImpl<_$Add>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) {
    return add(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) {
    return add?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add extends FirebaseFailure {
  const factory Add(final String error) = _$Add;
  const Add._() : super._();

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$AddCopyWith<_$Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCopyWith<$Res>
    implements $FirebaseFailureCopyWith<$Res> {
  factory _$$DeleteCopyWith(_$Delete value, $Res Function(_$Delete) then) =
      __$$DeleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DeleteCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$Delete>
    implements _$$DeleteCopyWith<$Res> {
  __$$DeleteCopyWithImpl(_$Delete _value, $Res Function(_$Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Delete(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Delete extends Delete {
  const _$Delete(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'FirebaseFailure.delete(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Delete &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCopyWith<_$Delete> get copyWith =>
      __$$DeleteCopyWithImpl<_$Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) {
    return delete(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) {
    return delete?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete extends FirebaseFailure {
  const factory Delete(final String error) = _$Delete;
  const Delete._() : super._();

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$DeleteCopyWith<_$Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SnapshotCopyWith<$Res>
    implements $FirebaseFailureCopyWith<$Res> {
  factory _$$SnapshotCopyWith(
          _$Snapshot value, $Res Function(_$Snapshot) then) =
      __$$SnapshotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SnapshotCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$Snapshot>
    implements _$$SnapshotCopyWith<$Res> {
  __$$SnapshotCopyWithImpl(_$Snapshot _value, $Res Function(_$Snapshot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Snapshot(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Snapshot extends Snapshot {
  const _$Snapshot(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'FirebaseFailure.snapshot(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Snapshot &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapshotCopyWith<_$Snapshot> get copyWith =>
      __$$SnapshotCopyWithImpl<_$Snapshot>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) {
    return snapshot(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) {
    return snapshot?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) {
    if (snapshot != null) {
      return snapshot(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) {
    return snapshot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) {
    return snapshot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) {
    if (snapshot != null) {
      return snapshot(this);
    }
    return orElse();
  }
}

abstract class Snapshot extends FirebaseFailure {
  const factory Snapshot(final String error) = _$Snapshot;
  const Snapshot._() : super._();

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$SnapshotCopyWith<_$Snapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCopyWith<$Res> implements $FirebaseFailureCopyWith<$Res> {
  factory _$$GetCopyWith(_$Get value, $Res Function(_$Get) then) =
      __$$GetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetCopyWithImpl<$Res>
    extends _$FirebaseFailureCopyWithImpl<$Res, _$Get>
    implements _$$GetCopyWith<$Res> {
  __$$GetCopyWithImpl(_$Get _value, $Res Function(_$Get) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Get(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Get extends Get {
  const _$Get(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'FirebaseFailure.get(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Get &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCopyWith<_$Get> get copyWith =>
      __$$GetCopyWithImpl<_$Get>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) update,
    required TResult Function(String error) add,
    required TResult Function(String error) delete,
    required TResult Function(String error) snapshot,
    required TResult Function(String error) get,
  }) {
    return get(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? update,
    TResult? Function(String error)? add,
    TResult? Function(String error)? delete,
    TResult? Function(String error)? snapshot,
    TResult? Function(String error)? get,
  }) {
    return get?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? update,
    TResult Function(String error)? add,
    TResult Function(String error)? delete,
    TResult Function(String error)? snapshot,
    TResult Function(String error)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Update value) update,
    required TResult Function(Add value) add,
    required TResult Function(Delete value) delete,
    required TResult Function(Snapshot value) snapshot,
    required TResult Function(Get value) get,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Update value)? update,
    TResult? Function(Add value)? add,
    TResult? Function(Delete value)? delete,
    TResult? Function(Snapshot value)? snapshot,
    TResult? Function(Get value)? get,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Update value)? update,
    TResult Function(Add value)? add,
    TResult Function(Delete value)? delete,
    TResult Function(Snapshot value)? snapshot,
    TResult Function(Get value)? get,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class Get extends FirebaseFailure {
  const factory Get(final String error) = _$Get;
  const Get._() : super._();

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$GetCopyWith<_$Get> get copyWith => throw _privateConstructorUsedError;
}
