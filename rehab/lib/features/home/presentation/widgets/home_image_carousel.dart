import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeImageCarousel extends HookWidget {
  final List<String> images;
  final double height;
  final BorderRadius borderRadius;

  /// إخفاء نقاط المؤشر عند استخدام الكاروسيل داخل Stack بارتفاع ثابت.
  final bool showIndicator;

  const HomeImageCarousel({
    super.key,
    required this.images,
    required this.height,
    required this.borderRadius,
    this.showIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1,
            autoPlay: images.length > 1,
            enlargeCenterPage: false,
            enableInfiniteScroll: images.length > 1,
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
          ),
          items: images.map((image) {
            return ClipRRect(
              borderRadius: borderRadius,
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.image_not_supported)),
                  );
                },
              ),
            );
          }).toList(),
        ),

        if (showIndicator && images.length > 1) ...[
          const SizedBox(height: 10),

          DotsIndicator(
            dotsCount: images.length,
            position: currentIndex.value.toDouble(),
            decorator: DotsDecorator(
              activeColor: Theme.of(context).colorScheme.primary,
              size: const Size.square(7),
              activeSize: const Size(18, 7),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
