// import 'package:base_flutter_2/bootstrap.dart';
// import 'package:base_flutter_2/app/application.dart';

// void main() {
//   bootstrap(() => const Application());
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScrollScreen(),
    );
  }
}

class MainScrollScreen extends StatelessWidget {
  const MainScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          // Phần 1: Header cố định và TabBar (Cùng nằm trong Sliver)
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // Thành phần cố định phía trên (ví dụ: Banner, Profile info...)
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "THÀNH PHẦN CỐ ĐỊNH\n(Cuộn để ẩn)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // Thành phần TabBar: Sẽ được "ghim" (pin) khi cuộn tới đỉnh
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  Container(
                    color: Colors.white,
                    child: const TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue,
                      tabs: [
                        Tab(icon: Icon(Icons.list), text: "Danh sách"),
                        Tab(icon: Icon(Icons.grid_view), text: "Lưới"),
                        Tab(icon: Icon(Icons.settings), text: "Cài đặt"),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },

          // Phần 2: Nội dung Tab có thể vuốt ngang (TabBarView)
          body: TabBarView(
            children: [
              // Tab 1: Danh sách dài để kiểm tra scroll
              ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 50,
                itemBuilder: (context, index) =>
                    Card(child: ListTile(title: Text("Vật phẩm thứ $index"))),
              ),

              // Tab 2: Grid view
              GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  20,
                  (index) => Container(
                    margin: const EdgeInsets.all(8),
                    color: Colors.orangeAccent,
                    child: Center(child: Text("Ô $index")),
                  ),
                ),
              ),

              // Tab 3: Nội dung đơn giản
              const Center(child: Text("Nội dung tab Cài đặt")),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper class để tạo SliverPersistentHeader cho TabBar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 70.0; // Chiều cao tối thiểu của TabBar
  @override
  double get maxExtent => 70.0; // Chiều cao tối đa của TabBar

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
