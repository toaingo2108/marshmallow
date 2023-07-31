import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/data_fake.dart';

final optionDeliveryState =
    StateProvider.autoDispose<List<Map<String, dynamic>>>((ref) => data11);
final optionDeliveryTipState =
    StateProvider.autoDispose<List<Map<String, dynamic>>>((ref) => data12);
final customTipProvider = StateProvider((ref) => 0.0);

void handleChooseOptionTip(int i, WidgetRef ref) {
  var result = ref.read(optionDeliveryTipState.notifier).state;
  result = result.map((e) {
    e["isEnable"] = false;
    return e;
  }).toList();
  result[i]["isEnable"] = true;
  ref.read(optionDeliveryTipState.notifier).update((state) => result.toList());
}
