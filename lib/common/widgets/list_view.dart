import 'package:flutter/material.dart';

enum LoadMoreState { idle, loading, completed, error }

class BaseListView<T> extends StatefulWidget {
  const BaseListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,

    /// pagination
    this.hasMore = true,
    this.loadMoreState = LoadMoreState.idle,

    /// trigger loadMore khi còn cách đáy X pixel
    this.loadMoreThreshold = 300,

    /// states
    this.emptyWidget,

    /// listView configs
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.prototypeItem,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,

    /// separator
    this.separatorBuilder,

    /// footer
    this.footerBuilder,
  });

  final List<T> items;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final Future<void> Function() onLoadMore;

  /// còn dữ liệu để load tiếp không
  final bool hasMore;

  final LoadMoreState loadMoreState;

  /// khoảng cách tới cuối list để trigger loadMore
  ///
  /// ví dụ:
  /// - 0 => chạm đáy mới load
  /// - 300 => còn 300px sẽ load
  final double loadMoreThreshold;

  final Widget? emptyWidget;

  /// ===== ListView properties =====

  final ScrollController? controller;

  final Axis scrollDirection;

  final bool reverse;

  final bool? primary;

  final ScrollPhysics? physics;

  final bool shrinkWrap;

  final EdgeInsetsGeometry? padding;

  final double? itemExtent;

  final Widget? prototypeItem;

  final double? cacheExtent;

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  final String? restorationId;

  final Clip clipBehavior;

  /// ===== extra =====

  final IndexedWidgetBuilder? separatorBuilder;

  final Widget Function(
    BuildContext context,
    LoadMoreState state,
    bool hasMore,
  )?
  footerBuilder;

  @override
  State<BaseListView<T>> createState() => _BaseListViewState<T>();
}

class _BaseListViewState<T> extends State<BaseListView<T>> {
  late final ScrollController _controller;

  bool _isCallingLoadMore = false;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? ScrollController();

    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);

    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  Future<void> _onScroll() async {
    if (!_controller.hasClients) return;

    final position = _controller.position;

    /// còn cách đáy bao nhiêu pixel
    final remaining = position.maxScrollExtent - position.pixels;

    final shouldLoadMore = remaining <= widget.loadMoreThreshold;

    if (!shouldLoadMore) return;

    if (_isCallingLoadMore) return;

    if (!widget.hasMore) return;

    if (widget.loadMoreState == LoadMoreState.loading) {
      return;
    }

    _isCallingLoadMore = true;

    try {
      await widget.onLoadMore();
    } finally {
      _isCallingLoadMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return widget.emptyWidget ?? const Center(child: Text('No data'));
    }

    final itemCount = widget.items.length + 1;

    final listView = ListView.builder(
      controller: _controller,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      prototypeItem: widget.prototypeItem,
      cacheExtent: widget.cacheExtent,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final isFooter = index == widget.items.length;

        if (isFooter) {
          return _buildFooter(context);
        }

        final item = widget.items[index];

        final child = widget.itemBuilder(context, item, index);

        if (widget.separatorBuilder == null) {
          return child;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [child, widget.separatorBuilder!(context, index)],
        );
      },
    );

    return listView;
  }

  Widget _buildFooter(BuildContext context) {
    if (widget.footerBuilder != null) {
      return widget.footerBuilder!(
        context,
        widget.loadMoreState,
        widget.hasMore,
      );
    }

    if (widget.loadMoreState == LoadMoreState.loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (!widget.hasMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('Đã hiển thị tất cả')),
      );
    }

    if (widget.loadMoreState == LoadMoreState.error) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('Load thêm thất bại')),
      );
    }

    return const SizedBox.shrink();
  }
}
