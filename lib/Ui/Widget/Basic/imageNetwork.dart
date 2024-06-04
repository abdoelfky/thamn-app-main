part of widget;

class ImageNetworkX extends StatelessWidget {
  const ImageNetworkX({
    super.key,
    required this.imageUrl,
    this.color,
    this.height,
    this.width,
    this.isFile = false,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final bool isFile;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: Padding(
            padding: const EdgeInsets.all(22),
            child: Image(
              image: AssetImage(
                  context.isDarkMode ? ImageX.logoWhite : ImageX.logoColor),
              opacity: const AlwaysStoppedAnimation(.8),
            )),
      );
    } else if (isFile) {
      return Image.file(
        File(imageUrl),
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => SizedBox(
          width: width,
          height: height,
          child: Padding(
              padding: const EdgeInsets.all(22),
              child: Image(
                image: AssetImage(
                    context.isDarkMode ? ImageX.logoWhite : ImageX.logoColor),
                opacity: const AlwaysStoppedAnimation(.8),
              )),
        ),
      );
    } else {
      return FastCachedImage(
        // cacheManager: CustomCacheManager.instance,
        // maxHeightDiskCache: 1000, // تقليل الارتفاع المخزن على القرص
        // maxWidthDiskCache: 500, // تقليل العرض المخزن على القرص
        // memCacheHeight: 1000, // تقليل الارتفاع المخزن في الذاكرة
        // memCacheWidth: 500, // تقليل العرض المخزن في الذاكرة
        url: imageUrl,
        height: height,
        width: width,
        fit: fit,
        color: color,
        fadeInDuration: const Duration(milliseconds: 250),
        loadingBuilder: (context, progress) {
          return Stack(
            alignment: Alignment.center,
            children: [
              if (progress.isDownloading && progress.totalBytes != null)
                Text(
                    '${progress.downloadedBytes ~/ 1024} / ${progress.totalBytes! ~/ 1024} kb',
                    style: TextStyle(color: ColorX.primary)),
              SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                      color: ColorX.primary,
                      value: progress.progressPercentage.value)),
            ],
          );
        },
        errorBuilder: (context, url, error) => SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Image(
              image: AssetImage(
                  context.isDarkMode ? ImageX.logoWhite : ImageX.logoColor),
              opacity: const AlwaysStoppedAnimation(.8),
            ),
          ),
        ),
      );
    }
  }
}
