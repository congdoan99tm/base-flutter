import 'package:base_flutter_2/bootstrap.dart';
import 'package:base_flutter_2/app/application.dart';

void main() {
  bootstrap(() => const Application());
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Lazy Load Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       home: const NotificationScreen(),
//     );
//   }
// }

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   // 1. Giả lập dữ liệu lớn để test lazy load
//   final List<String> todayItems = List.generate(20, (index) => "Today Item #$index");
//   final List<String> olderItems = List.generate(50, (index) => "Older Item #$index");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Notifications"),
//         backgroundColor: Colors.blue[100],
//       ),
//       // 2. Sử dụng CustomScrollView để ghép nhiều danh sách
//       body: CustomScrollView(
//         slivers: [
//           // --- PHẦN 1: TODAY ---

//           // Tiêu đề phần Today
//           const SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
//               child: Text(
//                 "Today",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),

//           // Danh sách Today (vẫn giữ Lazy Load)
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             sliver: SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   // Sử dụng Widget đặc biệt để log việc render
//                   return TrackedNotificationItem(
//                     title: todayItems[index],
//                     color: Colors.blue[50]!,
//                   );
//                 },
//                 childCount: todayItems.length,
//               ),
//             ),
//           ),

//           // --- PHẦN 2: OLDER ---

//           // Tiêu đề phần Older
//           const SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(16, 30, 16, 10),
//               child: Text(
//                 "Older Notifications",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),

//           // Danh sách Older (vẫn giữ Lazy Load)
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             sliver: SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return TrackedNotificationItem(
//                     title: olderItems[index],
//                     color: Colors.grey[100]!,
//                   );
//                 },
//                 childCount: olderItems.length,
//               ),
//             ),
//           ),
          
//           // Thêm một chút padding dưới cùng để không bị sát mép
//           const SliverToBoxAdapter(child: SizedBox(height: 30)),
//         ],
//       ),
//     );
//   }
// }

// // 3. Widget đặc biệt dùng để kiểm tra item nào được render
// class TrackedNotificationItem extends StatefulWidget {
//   final String title;
//   final Color color;

//   const TrackedNotificationItem({
//     super.key,
//     required this.title,
//     required this.color,
//   });

//   @override
//   State<TrackedNotificationItem> createState() => _TrackedNotificationItemState();
// }

// class _TrackedNotificationItemState extends State<TrackedNotificationItem> {
//   @override
//   void initState() {
//     super.initState();
//     // KHI ITEM NÀY ĐƯỢC KHỞI TẠO (RENDER LẦN ĐẦU), LOG SẼ HIỆN RA
//     // Bạn hãy theo dõi Debug Console để thấy lazy load hoạt động.
// //     print("[Rendered] ${widget.title}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: widget.color,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.notifications_active, color: Colors.blue),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               widget.title,
//               style: const TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ),
//           const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }