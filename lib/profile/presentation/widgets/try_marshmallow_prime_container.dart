import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marshmallow/core/presentation/app_router.dart';
import 'package:marshmallow/profile/presentation/widgets/widgets.dart';
import 'package:marshmallow/theme/app_colors.dart';

class TryMarshmallowClubContainer extends StatelessWidget {
  const TryMarshmallowClubContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const MWClubRoute());
      },
      child: Container(
        height: 94,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-2, 1.5),
              blurRadius: 4,
              color: AppColors.textColor.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 11),
                  Container(
                    width: 95,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.textColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'free try out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          height: 1.7,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Marshmallow Club',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'brings you exclusive benefits',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                const SlantedContainer(),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  // left: 10,
                  child: Image.asset('assets/images/waving_marshmallow.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
