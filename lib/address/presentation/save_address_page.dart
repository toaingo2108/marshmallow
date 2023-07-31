import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

//? Page to confirm the user's address
class SaveAddressPage extends ConsumerWidget {
  const SaveAddressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressNotifier = ref.read(editedAddressProvider.notifier);
    final address = ref.watch(editedAddressProvider);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 85,
                child: MiniMapPreview(
                  lat: address?.coordinates.latitude ?? 1,
                  long: address?.coordinates.longitude ?? 1,
                  zoom: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address?.addressLine1 ?? '',
                      style: const TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      address?.addressLine2 ?? '',
                      style: const TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Address Line 1',
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      initialText: address?.addressLine1 ?? '',
                      onChanged: (val) {
                        addressNotifier.update(
                          (state) => state?.copyWith(addressLine1: val),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Address Line 2',
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            initialText: address?.addressLine2 ?? '',
                            onChanged: (val) {
                              addressNotifier.update(
                                (state) => state?.copyWith(addressLine2: val),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: CustomTextField(
                            initialText: 'United States',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Complement',
                      style: TextStyle(
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.done,
                      initialText: address?.complement ?? '',
                      onChanged: (val) {
                        addressNotifier.update(
                          (state) => state?.copyWith(complement: val),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Save as',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: PillButton(
                            height: 28,
                            title: 'Home',
                            icon: Symbols.home,
                            onTap: () {
                              if (address?.isHome == null ||
                                  !address!.isHome!) {
                                addressNotifier.update(
                                  (state) => state?.copyWith(isHome: true),
                                );
                              } else {
                                addressNotifier.update(
                                  (state) => state?.copyWith(isHome: null),
                                );
                              }
                            },
                            fontSize: 14,
                            fontColor:
                                (address?.isHome != null && address!.isHome!)
                                    ? AppColors.textColor
                                    : AppColors.gray,
                            borderColor:
                                (address?.isHome != null && address!.isHome!)
                                    ? AppColors.textColor
                                    : AppColors.gray,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: PillButton(
                            height: 28,
                            title: 'Work',
                            icon: Icons.work_outline,
                            onTap: () {
                              if (address?.isHome == null || address!.isHome!) {
                                addressNotifier.update(
                                  (state) => state?.copyWith(isHome: false),
                                );
                              } else {
                                addressNotifier.update(
                                  (state) => state?.copyWith(isHome: null),
                                );
                              }
                            },
                            fontSize: 14,
                            fontColor:
                                (address?.isHome != null && !address!.isHome!)
                                    ? AppColors.textColor
                                    : AppColors.gray,
                            borderColor:
                                (address?.isHome != null && !address!.isHome!)
                                    ? AppColors.textColor
                                    : AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: PillButton(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 36,
              title: 'Save address',
              onTap: () async {
                ref
                    .read(editingAddressNotifierProvider.notifier)
                    .saveAddress(address!, ref);
                Navigator.pop(context);
              },
              backgroundColor: AppColors.textColor,
            ),
          ),
        )
      ],
    );
  }
}
