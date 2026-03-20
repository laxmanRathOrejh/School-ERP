import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void showImageDialog({
  required BuildContext context,
  required String imagePath,

  bool isAssetskImage = true,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SizedBox(
          height: 500,
          width: 30,
          child: Center(
            child: PhotoView(
              imageProvider: isAssetskImage
                  ? AssetImage(imagePath)
                  : CachedNetworkImageProvider(imagePath),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained * 2,
              initialScale: PhotoViewComputedScale.contained,
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),

        //Image.asset(imagePath, fit: BoxFit.contain)),
      );
    },
  );
}



  ////////
 
