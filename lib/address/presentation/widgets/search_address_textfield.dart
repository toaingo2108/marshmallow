//? Search bar text field for address
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/widgets/widgets.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/theme.dart';

class SearchAddressTextField extends ConsumerStatefulWidget {
  const SearchAddressTextField({
    super.key,
    this.hintText,
    required this.onAddressEntryTap,
  });

  final String? hintText;
  final void Function(String) onAddressEntryTap;
  @override
  ConsumerState<SearchAddressTextField> createState() => SearchTextFieldState();
}

class SearchTextFieldState extends ConsumerState<SearchAddressTextField> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final searchAddressState = ref.watch(searchAddressNotifierProvider);
    final searchAddressNotifier =
        ref.read(searchAddressNotifierProvider.notifier);

    return Column(
      children: [
        Container(
          padding: focused
              ? searchAddressState.maybeWhen(
                  orElse: () => EdgeInsets.zero,
                  success: (_) =>
                      const EdgeInsets.only(top: 1, left: 1, right: 1),
                )
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: searchAddressState.maybeWhen(
              orElse: () => BorderRadius.circular(12),
              success: (_) => const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 7),
            decoration: BoxDecoration(
              borderRadius: searchAddressState.maybeWhen(
                orElse: () => BorderRadius.circular(12),
                success: (_) => const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              border: focused
                  ? searchAddressState.maybeWhen(
                      orElse: () =>
                          Border.all(color: AppColors.darkPrimaryColor),
                      success: (_) => null,
                    )
                  : null,
              color: focused ? AppColors.white : AppColors.textFieldBackground,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 3,
                  color: AppColors.textColor.withOpacity(0.2),
                )
              ],
            ),
            height: 32,
            child: Focus(
              onFocusChange: (val) {
                focused = !focused;
                setState(() {});
              },
              child: TextField(
                textCapitalization: TextCapitalization.words,
                cursorColor: AppColors.textColor,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    searchAddressNotifier.getAutocompletePlaces(query);
                  } else {
                    searchAddressNotifier.resetState();
                  }
                },
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: focused
                        ? AppColors.darkPrimaryColor
                        : AppColors.darkGray,
                  ),
                  contentPadding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: AppColors.darkGray,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: widget.hintText,
                ),
              ),
            ),
          ),
        ),
        if (focused)
          searchAddressState.maybeMap(
            orElse: () => Container(),
            loading: (_) => const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: PageLoader(),
            ),
            success: (_) => SearchedAddressResults(
              addresses: _.addresses,
              onAddressEntryTap: widget.onAddressEntryTap,
            ),
          )
      ],
    );
  }
}
