// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatCommand _$ChatCommandFromJson(Map<String, dynamic> json) {
  return _ChatCommand.fromJson(json);
}

/// @nodoc
mixin _$ChatCommand {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCommandCopyWith<ChatCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCommandCopyWith<$Res> {
  factory $ChatCommandCopyWith(
          ChatCommand value, $Res Function(ChatCommand) then) =
      _$ChatCommandCopyWithImpl<$Res, ChatCommand>;
  @useResult
  $Res call({String name, String description, bool active});
}

/// @nodoc
class _$ChatCommandCopyWithImpl<$Res, $Val extends ChatCommand>
    implements $ChatCommandCopyWith<$Res> {
  _$ChatCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatCommandCopyWith<$Res>
    implements $ChatCommandCopyWith<$Res> {
  factory _$$_ChatCommandCopyWith(
          _$_ChatCommand value, $Res Function(_$_ChatCommand) then) =
      __$$_ChatCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, bool active});
}

/// @nodoc
class __$$_ChatCommandCopyWithImpl<$Res>
    extends _$ChatCommandCopyWithImpl<$Res, _$_ChatCommand>
    implements _$$_ChatCommandCopyWith<$Res> {
  __$$_ChatCommandCopyWithImpl(
      _$_ChatCommand _value, $Res Function(_$_ChatCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? active = null,
  }) {
    return _then(_$_ChatCommand(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatCommand implements _ChatCommand {
  _$_ChatCommand(
      {required this.name, required this.description, required this.active});

  factory _$_ChatCommand.fromJson(Map<String, dynamic> json) =>
      _$$_ChatCommandFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final bool active;

  @override
  String toString() {
    return 'ChatCommand(name: $name, description: $description, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatCommand &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCommandCopyWith<_$_ChatCommand> get copyWith =>
      __$$_ChatCommandCopyWithImpl<_$_ChatCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatCommandToJson(
      this,
    );
  }
}

abstract class _ChatCommand implements ChatCommand {
  factory _ChatCommand(
      {required final String name,
      required final String description,
      required final bool active}) = _$_ChatCommand;

  factory _ChatCommand.fromJson(Map<String, dynamic> json) =
      _$_ChatCommand.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCommandCopyWith<_$_ChatCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
