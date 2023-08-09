import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:readmore/readmore.dart';

class ContentPostViewPage extends StatelessWidget {
  const ContentPostViewPage({
    super.key,
    required this.type,
    required this.fileUrl,
    required this.caption,
  });
  final String fileUrl;
  final String caption;
  final MessageEnum type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: whiteBlueLight,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              child: Hero(
                tag: fileUrl,
                child: CachedNetworkImage(
                  imageUrl: fileUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 80,
                  minWidth: double.infinity,
                ),
                child: Container(
                  color: const Color.fromARGB(146, 0, 0, 0),
                  margin: const EdgeInsets.only(bottom: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: ReadMoreText(
                    caption,
                    colorClickableText: blue,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
