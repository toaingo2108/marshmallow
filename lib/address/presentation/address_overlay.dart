import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/presentation.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

class AddressOverlay extends ConsumerStatefulWidget {
  const AddressOverlay({
    super.key,
  });

  @override
  ConsumerState<AddressOverlay> createState() => _AddressOverlayState();
}

class _AddressOverlayState extends ConsumerState<AddressOverlay> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double topBarHeight = 166;

  @override
  Widget build(BuildContext context) {
    final editAddressState = ref.watch(editingAddressNotifierProvider);
    ref.listen(editingAddressNotifierProvider, (_, state) {
      state.maybeMap(
        orElse: () {},
        permissionFailure: (_) => showCupertinoDialog(
          context: context,
          builder: (context) => NeedPermissionAlertDialog(
            description:
                "Marshmallow needs your permission to access your location. To enable, open your phone's settings.",
            onLeftPressed: () {
              ref
                  .read(editingAddressNotifierProvider.notifier)
                  .fetchAddresses(ref);
            },
            onRightPressed: () {
              ref
                  .read(editingAddressNotifierProvider.notifier)
                  .fetchAddresses(ref);
            },
          ),
        ),
      );
    });

    return DismissibleKeyboard(
      child: Container(
        height: MediaQuery.of(context).size.height - 60,
        color: AppColors.textFieldBackground,
        child: Stack(
          children: [
            Column(
              children: [
                EditAddressTopBar(
                  topBarHeight: topBarHeight,
                  onArrowTap: () async {
                    if (topBarHeight >= 166) {
                      Navigator.pop(context);
                    } else if ((_pageController.page ?? 0) == 1) {
                      topBarHeight = 166;
                      await Future.delayed(const Duration(milliseconds: 100));
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInCubic,
                      );
                    } else {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInCubic,
                      );
                    }
                    setState(() {});
                  },
                  onMyLocationTap: () async {
                    final noError = await ref
                        .read(editingAddressNotifierProvider.notifier)
                        .getUserCoordinates(ref);
                    if (noError) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInCubic,
                      );
                      await Future.delayed(const Duration(milliseconds: 100));
                      topBarHeight = 65;
                      setState(() {});
                    }
                  },
                ),
                Expanded(
                  child: editAddressState.maybeMap(
                    orElse: () {
                      return Container();
                    },
                    loading: (_) => const PageLoader(),
                    firebaseFailure: (_) => Text(_.failure.error.toString()),
                    success: (_) {
                      return PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          UserAddressesPage(
                            addresses: _.addresses,
                            onEditTap: () async {
                              Navigator.pop(context);

                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInCubic,
                              );
                              await Future.delayed(
                                const Duration(milliseconds: 100),
                              );

                              topBarHeight = 65;
                              setState(() {});
                            },
                          ),
                          MapLocationPage(
                            pageController: _pageController,
                          ),
                          const SaveAddressPage()
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
            if (topBarHeight >= 166)
              Padding(
                padding: const EdgeInsets.only(top: 65.0, left: 20, right: 20),
                child: SearchAddressTextField(
                  hintText: 'Search for address',
                  onAddressEntryTap: (placeID) async {
                    await ref
                        .read(searchAddressNotifierProvider.notifier)
                        .getPlaceLocation(placeID, ref);
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInCubic,
                    );
                    await Future.delayed(const Duration(milliseconds: 100));
                    topBarHeight = 65;
                    setState(() {});
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
