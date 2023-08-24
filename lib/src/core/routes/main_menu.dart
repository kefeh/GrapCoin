import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/chat_room_list_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/chats_modal_content.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/main_menu_top_bar.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/general_settings_page.dart';
import 'package:grapcoin/src/chat/widgets/main_menu_bottom_app_bar.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/app_lifecycle.dart';
import 'package:grapcoin/src/core/widgets/bottom_sheet.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

final chatRoomListStreamProvider = StreamProvider.autoDispose((ref) {
  final user = UserService.instance.currentUser;

  return ref
      .watch(firebaseChatRoomServiceProvider)
      .getAllChatRoomStream(user?.uid ?? '');
});

final allChatRoomListStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(firebaseChatRoomServiceProvider).getAllChatRoomStream('');
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
    return AppLifecyclePage(
      child: Scaffold(
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
                    SizedBox(),
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
          onTapFAB: () {
            showModalBottomSheet(
              context: context,
              barrierColor: const Color.fromARGB(80, 0, 0, 0),
              backgroundColor: const Color.fromARGB(0, 250, 250, 250),
              builder: (context) {
                return BottomSheetModal(
                  height: MediaQuery.maybeSizeOf(context)!.height / 2,
                  child: const ChatsModalContent(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
