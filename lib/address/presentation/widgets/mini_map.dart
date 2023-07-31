//? A non interactive mini map that displays a location given its lat, long and zoom level. Does NOT update with WidgetRef.
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MiniMapPreview extends StatefulWidget {
  const MiniMapPreview({
    super.key,
    required this.lat,
    required this.long,
    required this.zoom,
  });

  final double lat;
  final double long;
  final double zoom;

  @override
  State<MiniMapPreview> createState() => _MiniMapPreviewState();
}

class _MiniMapPreviewState extends State<MiniMapPreview> {
  late MapController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MapController(
      location: LatLng(widget.lat, widget.long),
      zoom: widget.zoom,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: MapController(
        location: LatLng(widget.lat, widget.long),
        zoom: widget.zoom,
      ),
      builder: (context, transformer) {
        return TileLayer(
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

            final url =
                'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

            return CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
            );
          },
        );
      },
    );
  }
}

//? A non interactive mini map that displays a location given its lat, long and zoom level. It updates with WidgetRef.
class DynamicMiniMap extends StatefulWidget {
  const DynamicMiniMap({
    super.key,
    required this.lat,
    required this.long,
    required this.zoom,
  });

  final double lat;
  final double long;
  final double zoom;

  @override
  State<DynamicMiniMap> createState() => _DynamicMiniMapState();
}

class _DynamicMiniMapState extends State<DynamicMiniMap> {
  late MapController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MapController(
      location: LatLng(widget.lat, widget.long),
      zoom: widget.zoom,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final a =
        _controller.projection.toTileIndex(LatLng(widget.lat, widget.long));
    final myX = (a.x * pow(2.0, widget.zoom)).floor();
    final myY = (a.y * pow(2.0, widget.zoom)).floor();
    final zoom = widget.zoom.toInt();
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$zoom!2i${myX - 1}!3i$myY!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
        ),
        CachedNetworkImage(
          imageUrl:
              'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$zoom!2i$myX!3i$myY!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
        ),
        CachedNetworkImage(
          imageUrl:
              'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$zoom!2i${myX + 1}!3i$myY!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
        ),
      ],
    );
  }
}
