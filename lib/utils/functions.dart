import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/address/presentation/presentation.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/core/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/theme/theme.dart';

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

/// Opens the users addresses overlay.
void openUsersAddresses(BuildContext context, WidgetRef ref) {
  ref.read(editingAddressNotifierProvider).maybeMap(
        orElse: () {
          ref.read(editingAddressNotifierProvider.notifier).fetchAddresses(ref);
        },
        success: (_) {},
      );
  ref.read(searchAddressNotifierProvider.notifier).resetState();
  ref.read(editedAddressProvider.notifier).update((state) => null);
  showRoundedBottomModal(
    context,
    const AddressOverlay(),
    isScrollable: false,
  );
}

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white,
          timePickerTheme: TimePickerTheme.of(context).copyWith(
            //background color of time picker
            backgroundColor: Colors.white,
          ),
          datePickerTheme: DatePickerTheme.of(context).copyWith(),
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
          ),
        ),
        child: child!,
      );
    },
  );

  if (selectedDate == null) return null;

  // ignore: use_build_context_synchronously
  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerTheme.of(context).copyWith(
            //background color of time picker
            backgroundColor: Colors.white,
          ),
          colorScheme: const ColorScheme.light(
            tertiary: AppColors.primaryColor,
            primary: AppColors.primaryColor,
          ),
        ),
        child: child!,
      );
    },
    initialTime: TimeOfDay.fromDateTime(selectedDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
}
