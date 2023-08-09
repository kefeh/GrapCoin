import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/chat/services/firebase_chat_room_service.dart';
import 'package:grapcoin/src/chat/utils/firebase_failure.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
part 'add_chat_room_notifier.freezed.dart';

@freezed
class AddChatRoomState with _$AddChatRoomState {
  const factory AddChatRoomState({
    required PlatformFile? profileImage,
    required String name,
    required bool isLoading,
    Either<FirebaseFailure, Unit>? failureOrSuccess,
  }) = _AddChatRoomState;
  const AddChatRoomState._();

  factory AddChatRoomState.init() => const AddChatRoomState(
        profileImage: null,
        name: '',
        isLoading: false,
      );
}

class AddChatRoomNotifier extends StateNotifier<AddChatRoomState> {
  AddChatRoomNotifier(this._service) : super(AddChatRoomState.init());
  final FirebaseChatRoomService _service;

  Future<void> getProfileImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      state = state.copyWith(profileImage: result.files.first);
    }
  }

  void getName(String name) {
    state = state.copyWith(name: name);
  }

  Future<void> addChatRoom() async {
    if (state.name.isEmpty) return;

    state = state.copyWith(isLoading: true, failureOrSuccess: null);
    final failureOrSuccess = await _service.add(state.name, state.profileImage);

    state =
        state.copyWith(isLoading: false, failureOrSuccess: failureOrSuccess);
  }
}

final addChatRoomProvider =
    StateNotifierProvider<AddChatRoomNotifier, AddChatRoomState>(
  (ref) {
    final chatRoomService = ref.read(firebaseChatRoomServiceProvider);
    return AddChatRoomNotifier(chatRoomService);
  },
);
