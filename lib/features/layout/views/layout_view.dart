import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              color: Colors.red,
              size: 24,
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
