//? The Map Widget used to confirm the location of the user's address
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:marshmallow/address/domain/address.dart';
import 'package:marshmallow/address/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:material_symbols_icons/symbols.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({
    super.key,
    required this.address,
  });
  final Address? address;

  @override
  ConsumerState<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends ConsumerState<MapWidget> {
  double clamp(double x, double min, double max) {
    late double tempX;
    if (x < min) tempX = min;
    if (x > max) tempX = max;

    return tempX;
  }

  late MapController controller;
  @override
  void initState() {
    super.initState();

    controller = MapController(
      location: widget.address?.coordinates ?? const LatLng(1, 1),
      zoom: 18,
    );
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  late Offset? _dragStart;
  double _scaleStart = 1.0;
  bool _showAreYouHere = true;
  void _onScaleStart(ScaleStartDetails details) {
    _showAreYouHere = false;
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;

      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      if (controller.zoom < 1) {
        controller.zoom = 1;
      }
      setState(() {});
    } else {
      final now = details.focalPoint;
      var diff = now - _dragStart!;
      _dragStart = now;
      final h = transformer.constraints.maxHeight;

      final vp = transformer.getViewport();
      if (diff.dy < 0 && vp.bottom - diff.dy < h) {
        diff = Offset(diff.dx, 0);
      }

      if (diff.dy > 0 && vp.top - diff.dy > 0) {
        diff = Offset(diff.dx, 0);
      }

      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  String google(int z, int x, int y) {
    //! Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.
    final url =
        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: controller,
      builder: (context, transformer) {
        final centerLocation = Offset(
          transformer.constraints.biggest.width / 2,
          transformer.constraints.biggest.height / 2,
        );

        final centerMarkerWidget =
            _buildMarkerWidget(centerLocation, _showAreYouHere);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (details) => _onDoubleTap(
            transformer,
            details.localPosition,
          ),
          onScaleStart: _onScaleStart,
          onScaleEnd: (d) {
            setState(() {});
            ref.read(editedAddressProvider.notifier).update(
                  (state) => state?.copyWith(
                    coordinates: LatLng(
                      controller.center.latitude,
                      controller.center.longitude,
                    ),
                  ),
                );

            _showAreYouHere = true;
          },
          onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final delta = event.scrollDelta.dy / -1000.0;
                final zoom = clamp(controller.zoom + delta, 2, 18);

                transformer.setZoomInPlace(zoom, event.localPosition);
                setState(() {});
              }
            },
            child: Stack(
              children: [
                TileLayer(
                  builder: (context, x, y, z) {
                    final tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }

                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    return CachedNetworkImage(
                      imageUrl: google(z, x, y),
                      fit: BoxFit.cover,
                    );
                  },
                ),
                CustomPaint(
                  painter: _ViewportPainter(
                    transformer.getViewport(),
                  ),
                ),
                centerMarkerWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}

//? Function to generate the pin on the map on user dragging.
Widget _buildMarkerWidget(
  Offset pos,
  bool showAreYouHere,
) {
  return Positioned(
    left: pos.dx - 70,
    top: pos.dy - 70,
    height: 93,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: showAreYouHere ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.darkGray, width: 0.2),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                  color: AppColors.textColor.withOpacity(0.2),
                )
              ],
            ),
            width: 136,
            height: 54,
            child: const Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'Are you here?',
                  style: TextStyle(fontSize: 12, color: AppColors.textColor),
                ),
                Text(
                  'Adjust your location',
                  style: TextStyle(color: AppColors.gray, fontSize: 10),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        GestureDetector(
          child: const Icon(
            Symbols.person_pin_circle_rounded,
            color: AppColors.textColor,
            size: 36,
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

class _ViewportPainter extends CustomPainter {
  _ViewportPainter(this.viewport);
  final Rect viewport;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1;

    canvas.drawRect(viewport, paint);
  }

  @override
  bool shouldRepaint(covariant _ViewportPainter oldDelegate) =>
      oldDelegate.viewport != viewport;
}
