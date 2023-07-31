import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:material_symbols_icons/symbols.dart';

//? The search results of an address query.
class SearchedAddressResults extends StatelessWidget {
  const SearchedAddressResults({
    super.key,
    required this.addresses,
    required this.onAddressEntryTap,
  });

  final List<AutocompletePrediction> addresses;
  final void Function(String) onAddressEntryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
      decoration: const BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1.5, 1.5),
              blurRadius: 3,
              color: AppColors.textColor.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          children: addresses
              .map(
                (e) => _SearchedAddressEntry(
                  place: e,
                  onAddressEntryTap: onAddressEntryTap,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _SearchedAddressEntry extends StatelessWidget {
  const _SearchedAddressEntry({
    required this.place,
    required this.onAddressEntryTap,
  });

  final AutocompletePrediction place;
  final void Function(String) onAddressEntryTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      onTap: () {
        onAddressEntryTap(place.placeId);
      },
      title: Text(
        place.fullText,
        style: const TextStyle(fontSize: 12, color: AppColors.textColor),
      ),
      leading: const Icon(
        Symbols.pin_drop,
        color: AppColors.textColor,
        size: 16,
      ),
    );
  }
}
