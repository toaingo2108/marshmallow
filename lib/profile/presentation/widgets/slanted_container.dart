import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class SlantedContainer extends StatelessWidget {
  const SlantedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(123, 94),
      painter: SlantedContainerPainter(),
    );
  }
}

class SlantedContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.4227276, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.4227276, 0);
    path.close();

    final Paint pathFill = Paint()..style = PaintingStyle.fill;
    pathFill.color = AppColors.primaryColor;
    canvas.drawPath(path, pathFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
