import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/chat_room_list_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/main_menu_top_bar.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/general_settings_page.dart';
import 'package:grapcoin/src/chat/widgets/main_menu_bottom_app_bar.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

final chatRoomListStreamProvider = StreamProvider.autoDispose((ref) {
  final user = UserService.instance.currentUser;

  return ref
      .watch(firebaseChatRoomServiceProvider)
      .getAllChatRoomStream(user?.uid ?? '');
});

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({super.key, this.initialPageNumber = 0});
  final int initialPageNumber;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatRoomListPageState();
}

class _ChatRoomListPageState extends ConsumerState<MainMenu> {
  late PageController _pageController;

  late int index;

  @override
  void initState() {
    super.initState();

    index = widget.initialPageNumber;
    _pageController = PageController(initialPage: widget.initialPageNumber);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //resets newUser to false
      UserService.instance.newUser = false;
    });
  }

  void setIndex(int newIndex) {
    setState(() {
      index = newIndex;
      _pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitish,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            if (index == 0)
              MainMenuTopBar(
                tabIndex: index,
              ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  ChatRoomList(),
                  GeneralSettingsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MainMenuBottonAppBar(
        index: index,
        setIndex: setIndex,
      ),
    );
  }
}
