import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/page_loader.dart';
import 'package:marshmallow/core/presentation/widgets/pop_app_bar.dart';
import 'package:marshmallow/orders/presentation/widgets/widgets.dart';
import 'package:marshmallow/orders/shared/providers.dart';

@RoutePage()
class OrdersPage extends ConsumerWidget {
  const OrdersPage({this.comesFromProfile = false});
  final bool comesFromProfile;
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: comesFromProfile
          ? const PreferredSize(
              preferredSize: Size(double.infinity, 54),
              child: PopAppBar(
                title: 'My Orders',
              ),
            )
          : null,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Orders',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ordersState.maybeMap(
                orElse: () {
                  return const SizedBox();
                },
                loading: (_) => const PageLoader(),
                firebaseFailure: (_) => Text(_.failure.error.toString()),
                success: (_) {
                  return StreamBuilder(
                    stream: _.orders,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox();
                      if (snapshot.data!.isNotEmpty) {
                        return Expanded(
                          //   child: ListView.builder(
                          //     physics: const BouncingScrollPhysics(),
                          //     clipBehavior: Clip.none,
                          //     itemCount: snapshot.data?.length,
                          //     itemBuilder: (context, index) => OrderEntry(
                          //       order: snapshot.data!.values.toList()[index],
                          //     ),
                          //   ),
                          // );
                          child: ListView(
                            clipBehavior: Clip.none,
                            children: snapshot.data!.values
                                .map((e) => OrderEntry(order: e))
                                .toList(),
                          ),
                        );
                      }
                      return const NoOrders();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
