import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/profile_circle_avatar.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/login/models/user.dart';

class ParticipantsListTile extends StatelessWidget {
  const ParticipantsListTile({
    super.key,
    required this.user,
    required this.isCreator,
  });

  final User user;
  final bool isCreator;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: ProfileCircleAvatar(userID: user.uid),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          getName(user),
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isCreator)
              const Row(
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(
                      color: black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.lock_shield,
                    color: black,
                    size: 14,
                  )
                ],
              ),
            if (!isCreator) const Spacer(),
            if (!isCreator)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: black,
                size: 12,
              )
          ],
        ),
      ),
    );
  }
}
