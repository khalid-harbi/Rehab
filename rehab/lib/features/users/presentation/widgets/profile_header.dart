import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final int matchPercentage;
  final String imageUrl;

  const ProfileHeader({
    super.key,
    required this.matchPercentage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 24,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(102),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$matchPercentage%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 5),
                  Transform.translate(
                    offset: const Offset(
                      0,
                      -3,
                    ), // Adjust the negative number to move the heart UP
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
