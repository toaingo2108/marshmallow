import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/core/presentation/widgets/opacity_button.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

Future<void> showBtmSheetTrackingMap(
    {required BuildContext context, required WidgetRef ref,}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (BuildContext context) {
      return const FractionallySizedBox(
        heightFactor: 0.85,
        child: TrackingMapPage(),
      );
    },
  );
}

class TrackingMapPage extends ConsumerWidget {
  const TrackingMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: Utils.sizeOf(5000),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Utils.sizeOf(30)),
          topRight: Radius.circular(Utils.sizeOf(30)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Utils.sizeOf(40),
              bottom: Utils.sizeOf(15),
              left: Utils.sizeOf(40),
              right: Utils.sizeOf(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tracking #0000000000',
                  style: TextStyle(
                    fontSize: Utils.sizeOf(30),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TouchableOpacity(
                  onTap: () {
                    context.router.pop();
                  },
                  activeOpacity: 0.4,
                  child: SizedBox(
                    height: Utils.sizeOf(64),
                    width: Utils.sizeOf(64),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBackground,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray.withOpacity(0.6),
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 5.0,
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.darkGray,
                        size: Utils.sizeOf(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Utils.sizeOf(30),
          ),
          Expanded(
            child: Container(
              color: AppColors.darkPrimaryColor.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}
