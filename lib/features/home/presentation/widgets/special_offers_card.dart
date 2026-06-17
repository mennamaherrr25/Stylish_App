import 'package:flutter/material.dart';

class SpecialOffersCard extends StatelessWidget {
  const SpecialOffersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // أيقونة أو صورة العرض
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFF0F1),
            ),
            child: const Center(
              child: Text('🎉', style: TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(width: 16),
          // النصوص الخاصة بالعرض
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Special Offers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: const Icon(
                        Icons.card_giftcard,
                        size: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'We make sure you get the\noffer you need at best prices',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






// Widget _buildSpecialOffersCard() {
//   return Container(
//     padding: const EdgeInsets.all(12),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Row(
//       children: [
//         // أيقونة أو صورة العرض
//         Container(
//           width: 50,
//           height: 50,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xFFFFF0F1),
//           ),
//           child: const Center(
//             child: Text('🎉', style: TextStyle(fontSize: 24)),
//           ),
//         ),
//         const SizedBox(width: 16),
//         // النصوص الخاصة بالعرض
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     'Special Offers',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.grey, width: 1),
//                     ),
//                     child: const Icon(
//                       Icons.card_giftcard,
//                       size: 10,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               const Text(
//                 'We make sure you get the\noffer you need at best prices',
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }