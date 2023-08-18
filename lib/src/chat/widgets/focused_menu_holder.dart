import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/models/focused_menu_item.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/utils/helpers.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/helpers/helpers.dart';

class FocusedMenuHolder extends StatefulWidget {
  const FocusedMenuHolder({
    super.key,
    required this.child,
    required this.onPressed,
    required this.menuItems,
    required this.mine,
    this.showOverlay = true,
    this.duration,
    this.menuBoxDecoration,
    this.menuItemExtent,
    this.animateMenuItems,
    this.blurSize,
    this.blurBackgroundColor,
    this.menuWidth,
    this.bottomOffsetHeight,
    this.menuOffset,
    this.openWithTap = false,
  });
  final Widget child;
  final double? menuItemExtent;
  final double? menuWidth;
  final List<FocusedMenuItem> menuItems;
  final bool? animateMenuItems;
  final bool mine;
  final BoxDecoration? menuBoxDecoration;
  final Function onPressed;
  final Duration? duration;
  final double? blurSize;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  final bool showOverlay;

  /// Open with tap insted of long press.
  final bool openWithTap;

  @override
  FocusedMenuHolderState createState() => FocusedMenuHolderState();
}

class FocusedMenuHolderState extends State<FocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = const Offset(0, 0);

  late Size parentSize;
  Size? childSize;

  getOffset() {
    // final parentSize = MediaQuery.of(context).size;
    // print('parentSize: ${parentSize.height}');
    final renderBox =
        containerKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);
    parentSize = chatRoomListKey.currentContext!.size!;
    setState(() {
      // childOffset = Offset(offset.dx, offset.dy - 70);
      childOffset = getPositionTop(chatRoomListKey, containerKey);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.showOverlay
        ? GestureDetector(
            key: containerKey,
            onTap: () async {
              widget.onPressed();
              if (widget.openWithTap) {
                await openMenu(context);
              }
            },
            onLongPress: () async {
              if (!widget.openWithTap) {
                await openMenu(context);
              }
            },
            child: widget.child,
          )
        : widget.child;
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration:
            widget.duration ?? const Duration(milliseconds: 100),
        pageBuilder: (context, animation, secondaryAnimation) {
          animation = Tween<double>(begin: 0, end: 1).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: FocusedMenuDetails(
              itemExtent: widget.menuItemExtent,
              mine: widget.mine,
              menuBoxDecoration: widget.menuBoxDecoration,
              childOffset: childOffset,
              childSize: childSize,
              menuItems: widget.menuItems,
              blurSize: widget.blurSize,
              menuWidth: widget.menuWidth,
              blurBackgroundColor: widget.blurBackgroundColor,
              animateMenu: widget.animateMenuItems ?? true,
              bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
              menuOffset: widget.menuOffset ?? 0,
              parentSize: parentSize,
              child: widget.child,
            ),
          );
        },
        fullscreenDialog: true,
        opaque: false,
      ),
    );
  }
}

class FocusedMenuDetails extends StatelessWidget {
  const FocusedMenuDetails({
    super.key,
    required this.mine,
    required this.menuItems,
    required this.child,
    required this.childOffset,
    required this.childSize,
    required this.menuBoxDecoration,
    required this.itemExtent,
    required this.animateMenu,
    required this.blurSize,
    required this.blurBackgroundColor,
    required this.menuWidth,
    required this.parentSize,
    this.bottomOffsetHeight,
    this.menuOffset,
  });
  final List<FocusedMenuItem> menuItems;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final bool animateMenu;
  final bool mine;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  final Size parentSize;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final size = parentSize;

    final maxMenuHeight = size.height;
    final listHeight = menuItems.length * (itemExtent ?? 50.0);

    final maxMenuWidth = menuWidth ?? (size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) <
            size.height - bottomOffsetHeight!
        ? childOffset.dy + childSize!.height + menuOffset!
        : childOffset.dy - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurSize ?? 4,
                sigmaY: blurSize ?? 4,
              ),
              child: Container(
                color: (blurBackgroundColor ?? Colors.black).withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            top: topOffset,
            right: mine ? childOffset.dx : null,
            left: mine ? null : childOffset.dx + 50,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 200),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              tween: Tween<double>(begin: 0, end: 1),
              child: Container(
                width: maxMenuWidth,
                height: menuHeight,
                decoration: menuBoxDecoration ??
                    const BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(96, 48, 48, 48),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      final Widget listItem = GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          item.onPressed();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: item.backgroundColor ?? black,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                item.title,
                                if (item.trailingIcon != null) ...[
                                  item.trailingIcon!
                                ]
                              ],
                            ),
                          ),
                        ),
                      );
                      if (animateMenu) {
                        return TweenAnimationBuilder(
                          builder: (context, dynamic value, child) {
                            return Transform(
                              transform: Matrix4.rotationX(1.5708 * value),
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          tween: Tween<double>(begin: 1, end: 0),
                          duration: Duration(milliseconds: index * 200),
                          child: listItem,
                        );
                      } else {
                        return listItem;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: childOffset.dy,
            left: childOffset.dx,
            child: AbsorbPointer(
              child: SizedBox(
                width: childSize!.width,
                height: childSize!.height,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
