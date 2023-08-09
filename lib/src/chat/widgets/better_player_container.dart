import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BetterPlayerContainer extends StatefulWidget {
  const BetterPlayerContainer({
    super.key,
    required this.contentUrl,
    required this.type,
  });

  final String contentUrl;
  final BetterPlayerDataSourceType type;

  @override
  State<BetterPlayerContainer> createState() => _BetterPlayerContainerState();
}

class _BetterPlayerContainerState extends State<BetterPlayerContainer> {
  late BetterPlayerController betterPlayerController;
  @override
  void initState() {
    super.initState();
    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(),
      betterPlayerDataSource: BetterPlayerDataSource(
        widget.type,
        widget.contentUrl,
      ),
    );
    betterPlayerController.addEventsListener((BetterPlayerEvent event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        betterPlayerController.setOverriddenAspectRatio(
          betterPlayerController.videoPlayerController!.value.aspectRatio,
        );
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(
      controller: betterPlayerController,
    );
  }
}
