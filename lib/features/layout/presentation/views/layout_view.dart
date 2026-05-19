import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

// class LayoutView extends StatelessWidget {
//   const LayoutView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       bottomNavigationBar: CurvedNavigationBar(

//         items: [
//           HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
//           HugeIcon(icon: HugeIcons.strokeRoundedFavourite, size: 24),
//           HugeIcon(icon: HugeIcons.strokeRoundedShoppingCart01, size: 24),
//           HugeIcon(icon: HugeIcons.strokeRoundedSearch01, size: 24),
//           HugeIcon(icon: HugeIcons.strokeRoundedSettings01, size: 24),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Home')),
    Center(child: Text('Wishlist')),
    Center(child: Text('Cart')),
    Center(child: Text('Search')),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      floatingActionButton: Container(
        width: 64.w,
        height: 64.h,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              //offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),

        child: IconButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },

          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedShoppingCart01,
            size: 28,

            color: currentIndex == 2
                ? AppColors.primaryColor
                : AppColors.blackText,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
            label: 'home',
          ),
     
        ],
      ),

      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),

      //   notchMargin: 8.w,
      //   elevation: 10,
      //   child: SizedBox(
      //     // height: 60.h,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,

      //       children: [
      //         navItem(
      //           index: 0,
      //           label: 'Home',

      //           icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 24),
      //         ),

      //         navItem(
      //           index: 1,
      //           label: 'Wishlist',

      //           icon: HugeIcon(
      //             icon: HugeIcons.strokeRoundedFavourite,
      //             size: 24,
      //           ),
      //         ),

      //         const SizedBox(width: 40),

      //         navItem(
      //           index: 3,
      //           label: 'Search',

      //           icon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, size: 24),
      //         ),

      //         navItem(
      //           index: 4,
      //           label: 'Settings',

      //           icon: HugeIcon(
      //             icon: HugeIcons.strokeRoundedSettings01,
      //             size: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget navItem({
    required int index,
    required String label,
    required Widget icon,
  }) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected ? AppColors.primaryColor : AppColors.blackText,
            ),

            child: icon,
          ),

          const SizedBox(height: 4),

          Text(
            label,

            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,

              color: isSelected ? AppColors.primaryColor : AppColors.blackText,
            ),
          ),
        ],
      ),
    );
  }
}
