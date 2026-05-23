import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../common/extensions/context_extension.dart';
import 'base_life_circle_mixin.dart';
import 'base_state.dart';

abstract class BasePage<C extends Cubit<S>, S extends BaseState>
    extends StatefulWidget
    with BaseLifecycleMixin<C> {
  const BasePage({super.key});

  void onCubitCreated(C cubit) {}

  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  Color? get backgroundColor => null;

  EdgeInsetsGeometry get contentPadding => EdgeInsets.zero;

  bool listenWhen(S previous, S current) => true;

  void listener(BuildContext context, S state) {}

  Widget buildSuccess(BuildContext context, S state);

  Widget buildInitial(BuildContext context, S state) {
    return buildLoading(context, state);
  }

  Widget buildLoading(BuildContext context, S state) {
    return const BaseLoadingView();
  }

  Widget buildFailure(BuildContext context, S state) {
    final cubit = context.read<C>();

    return BaseErrorView(
      message: state.errorMessage,
      onRetry: retryAction(context, cubit),
    );
  }

  VoidCallback? retryAction(BuildContext context, C cubit) => null;

  @override
  BasePageState<BasePage<C, S>, C, S> createState() =>
      BasePageState<BasePage<C, S>, C, S>();
}

class BasePageState<
  Page extends BasePage<C, S>,
  C extends Cubit<S>,
  S extends BaseState
>
    extends State<Page>
    with WidgetsBindingObserver, AppLifecycleObserverMixin<Page, C> {
  late final C cubit;
  late final bool _ownsCubit;

  @override
  BaseLifecycleMixin<C> get lifecycle => widget;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final existingCubit = _readCubitFromContext();
    if (existingCubit != null) {
      cubit = existingCubit;
      _ownsCubit = false;
    } else {
      cubit = _createCubit();
      _ownsCubit = true;
      widget.onCubitCreated(cubit);
    }

    lifecycle.onInit(context, cubit);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        lifecycle.onReady(context, cubit);
      }
    });
  }

  C _createCubit() => GetIt.I<C>();

  C? _readCubitFromContext() {
    try {
      return context.read<C>();
    } on ProviderNotFoundException {
      return null;
    }
  }

  @override
  void dispose() {
    lifecycle.onDispose(cubit);
    WidgetsBinding.instance.removeObserver(this);
    if (_ownsCubit) {
      cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>.value(
      value: cubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: widget.backgroundColor,
            appBar: widget.buildAppBar(context),
            body: BlocConsumer<C, S>(
              listenWhen: widget.listenWhen,
              listener: widget.listener,
              buildWhen: (p, c) => p.status != c.status,
              builder: (context, state) {
                final content = switch (state.status) {
                  BaseStatus.initial => widget.buildInitial(context, state),
                  BaseStatus.loading => widget.buildLoading(context, state),
                  BaseStatus.failure => widget.buildFailure(context, state),
                  BaseStatus.success => widget.buildSuccess(context, state),
                };

                if (widget.contentPadding == EdgeInsets.zero) {
                  return content;
                }

                return Padding(padding: widget.contentPadding, child: content);
              },
            ),
          );
        },
      ),
    );
  }
}

class BaseLoadingView extends StatelessWidget {
  const BaseLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

class BaseErrorView extends StatelessWidget {
  const BaseErrorView({super.key, this.message, this.onRetry});

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 56, color: colors.error),
            const SizedBox(height: 16),
            Text(
              message ?? 'Đã có lỗi xảy ra',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
