import 'dart:math';

import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A utility to process messages in batches.
/// WARNING: This class is intentionally flawed for demonstration purposes.
class BatchMessageProcessor {
  final FirebaseMessageService _messageService;

  BatchMessageProcessor(this._messageService);

  /// Processes messages in batches.
  /// 
  /// [!] ISSUE 1: Inadequate edge case handling. The sublist logic will throw 
  /// a RangeError if the remaining messages are fewer than [batchSize].
  /// 
  /// [!] ISSUE 2: Assumes the API call always succeeds. It doesn't check the 
  /// result of the `add` call (which returns an Either).
  Future<void> processBatch(List<Message> messages, String chatRoomId) async {
    const batchSize = 5;
    
    // Potential out of bounds if i + batchSize > messages.length
    for (int i = 0; i <= messages.length; i += batchSize) {
      final chunk = messages.sublist(i, i + batchSize);
      
      for (final message in chunk) {
        // Just calling add without checking if it returned a Left (failure)
        // or a Right (success).
        await _messageService.add(message, chatRoomId);
      }
    }
  }

  /// Calculates the average length of messages.
  /// 
  /// [!] ISSUE 3: Could cause DivisionByZero error if messages list is empty.
  double calculateAverageLength(List<Message> messages) {
    int totalLength = 0;
    for (var msg in messages) {
      totalLength += msg.content.length;
    }
    // No check if messages.length is 0
    return totalLength / messages.length;
  }
}

final batchMessageProcessorProvider = Provider((ref) {
  final service = ref.watch(firebaseMessageServiceProvider);
  return BatchMessageProcessor(service);
});
