import 'package:flutter/material.dart';
import 'package:linkyou/core/models/education.dart';
import 'package:linkyou/core/models/language.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linkyou/views/widgets/controlls/circular_progress_blue.dart';
import 'package:linkyou/views/widgets/windows/ublog_gallery_window.dart';

class BuildHelper {
  static Widget buildLanguage(Language language, bool isShowTitle) {
    String title = '${language.language.name} (${language.level.name})';
    return buildRow(isShowTitle ? 'Знание языков' : '', title);
  }

  static Widget buildEducation(Education education) {
    return Column(
      children: [
        buildRow('Образования', education.educationType.name),
        buildRow('Название учебного заведения', education.institution.name),
        buildRow('Специальность', education.speciality.name),
      ],
    );
  }

  static Widget buildRow(String key, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              key,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildIconInfo(IconData icon, String info) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  static Widget buildInfo(String info) {
    return Chip(
      label: Text(info),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  // Виджет для обычного изображения
  static Widget buildImage(String url, double width) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: width,
      height: 100,
      child: CachedNetworkImage(
        placeholder: (context, url) =>
            const Center(child: CircularProgressBlue()),
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 100,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  // Виджет для последнего изображения с наложением текста
  static Widget buildLastImageWithOverlay(String url, double width,
      {int remaining = 0}) {
    return Stack(
      children: [
        buildImage(url, width),
        Positioned.fill(
          left: 5,
          right: 5,
          child: Container(
            width: width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),

        // Текст с количеством оставшихся фотографий
        remaining > 0
            ? Positioned.fill(
                child: Center(
                  child: Text(
                    '+$remaining',
                    style: const TextStyle(
                      color: Colors.white, // Белый текст
                      fontSize: 24, // Размер шрифта
                      fontWeight: FontWeight.bold, // Жирный шрифт
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  static Widget buildPhotoGallery(
      List<String> photoUrls, BuildContext context) {
    return Column(
      children: [
        if (photoUrls.isNotEmpty)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UblogGalleryWindow(
                              photoUrls: photoUrls, initialIndex: 0)),
                    ),
                    child: Image.network(
                      photoUrls[0],
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
        const SizedBox(height: 8),
        for (int i = 1; i < photoUrls.length; i += 2) ...[
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UblogGalleryWindow(
                              photoUrls: photoUrls, initialIndex: i)),
                    ),
                    child: Image.network(
                      photoUrls[i],
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (i + 1 < photoUrls.length)
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UblogGalleryWindow(
                                photoUrls: photoUrls, initialIndex: i + 1)),
                      ),
                      child: Image.network(
                        photoUrls[i + 1],
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
        ]
      ],
    );
  }
}
