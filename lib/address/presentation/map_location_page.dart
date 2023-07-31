import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

//? Page for the user to confirm his geographical location.
class MapLocationPage extends ConsumerWidget {
  const MapLocationPage({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(editedAddressProvider);

    return Stack(
      children: [
        MapWidget(
          address: address,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: PillButton(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 36,
              title: 'Confirm location',
              onTap: () async {
                await ref
                    .read(editingAddressNotifierProvider.notifier)
                    .getAddressFromCoordinates(
                      ref,
                      address!,
                    );
                pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInCubic,
                );
              },
              backgroundColor: AppColors.textColor,
            ),
          ),
        )
      ],
    );
  }
}
