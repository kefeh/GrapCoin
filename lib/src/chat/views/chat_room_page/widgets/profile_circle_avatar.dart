import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ProfileCircleAvatar extends ConsumerWidget {
  const ProfileCircleAvatar({
    super.key,
    this.profileImage = '',
    required this.userID,
  });

  final String userID;
  final String profileImage;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(userID));
    return CircleAvatar(
      radius: 20,
      backgroundColor: purple,
      child: Text(
        user.map(
          data: (data) => getInitials(data.value.name),
          error: (_) => getInitials(''),
          loading: (_) => '',
        ),
        style: const TextStyle(
          color: white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
