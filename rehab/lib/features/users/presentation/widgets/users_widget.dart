import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart' show AppColors;

class UsersWidget extends StatelessWidget {
  final String name;
  final DateTime cratedAt;
  const UsersWidget({super.key, required this.name, required this.cratedAt});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),

        width: 320,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(77),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ProfileHeader(),

            const SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),

              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cratedAt.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const StatsRow(),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/400/200'),
                fit: BoxFit.cover,
              ),
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
              child: const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a'),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: Container(
          //     padding: const EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //       color: Colors.black.withAlpha(102),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: const Row(
          //       children: [
          //         Icon(Icons.check_box, color: Colors.blue, size: 16),
          //         SizedBox(width: 5),
          //         Text(
          //           'Things',
          //           style: TextStyle(color: Colors.white, fontSize: 12),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(
            icon: Icons.star,
            color: Colors.amber,
            value: '5.0',
            label: 'Rating',
          ),
          StatItem(
            icon: Icons.flag,
            color: Colors.blue,
            value: '\$99',
            label: 'Hours',
          ),
          StatItem(
            icon: Icons.access_time_filled,
            color: Colors.purple,
            value: '12',
            label: 'Month',
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
