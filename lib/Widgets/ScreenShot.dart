import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screenshot extends StatelessWidget {
  const Screenshot({super.key});

  @override
  Widget build(BuildContext context) {
    var images = [
      "assets/images/1.png",
      "assets/images/5.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
    ];
    final w = MediaQuery.of(context).size.width;
    final isNarrow = w < 800;
    final cardWidth = isNarrow ? 200.0 : 260.0;
    // Typical phone screenshot aspect ratio ≈ 9:19.5
    const aspectRatio = 9 / 19.5; // width / height

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Screenshots",
              style: TextStyle(
                fontSize: isNarrow ? 28 : 40,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        SizedBox(height: isNarrow ? 20 : 40),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: images
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 16,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: cardWidth,
                          child: AspectRatio(
                            aspectRatio: aspectRatio,
                            child: Image.asset(
                              e,
                              fit: BoxFit.cover,
                              gaplessPlayback: true,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
