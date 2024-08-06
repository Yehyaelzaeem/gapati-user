import 'dart:async';
import 'dart:ui';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/generated/locale_keys.g.dart';
import 'package:cogina/presentation/component/custom_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/assets_constant/images.dart';
import '../../../../data/app_urls/app_url.dart';

class GoogleMapScreen extends StatefulWidget {
  final int tripId;
  const GoogleMapScreen({super.key, required this.tripId});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final DatabaseReference _locationRef = FirebaseDatabase.instance.reference().child('trips');
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  double deviceRotation = 0.0;
  BitmapDescriptor? mapIcon;
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  void _updateMarkers(Map<dynamic, dynamic> data) async{
    Set<Marker> newMarkers = {};
    BitmapDescriptor mapIcon = await getBitmapDescriptorFromImageProvider(
      AssetImage(AppImages.car),
      Size(100, 100),
    );
    data.forEach((key, value) {
      if (value['trip_id'] == widget.tripId) {
        final double lat = double.parse(value['pickup_lat']);
        final double lng = double.parse(value['pickup_lng']);
        final double myLat = double.parse(value['drop_lat']);
        final double myLng = double.parse(value['drop_lng']);
        final LatLng myPosition = LatLng(myLat, myLng);
        final LatLng position = LatLng(lat, lng);
        newMarkers.add(
          Marker(
            markerId: MarkerId('User'),
            position: myPosition,
          ),
        );
        newMarkers.add(
          Marker(
            markerId: MarkerId('Delivery'),
             icon: mapIcon,
            position: position,
          ),
        );
        _getPolyline(position,myPosition);
        setState(() {

        });
      }
    });
    setState(() {
      _markers = newMarkers;
    });
  }
  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _locationRef.orderByChild('trip_id').equalTo(widget.tripId).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.snapshot.value != null) {
            final data = snapshot.data.snapshot.value as Map<dynamic, dynamic>;
            return GoogleMap(
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              onMapCreated: (controller) {
                _mapController = controller;
                _updateMarkers(data);
                if (_markers.isNotEmpty) {
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(
                      _markers.first.position,
                    ),
                  );
                }
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(29.9734676, 31.2821032),
                zoom: 16,
              ),
               markers: _markers,
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 5,
                ),
              },
            );
          } else {
            return Center(child: Text(LocaleKeys.noAvailableTrip.tr(),style: TextStyles.font16CustomGray500Weight.copyWith(
              fontWeight: FontWeight.w600
            ),));
          }
        } else if (snapshot.hasError) {
          return Center(child: Text(LocaleKeys.errorLoadingData.tr(),style: TextStyles.font16CustomGray500Weight.copyWith(
              fontWeight: FontWeight.w600
          ),));
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
  Future<BitmapDescriptor> getBitmapDescriptorFromImageProvider(
      ImageProvider imageProvider,
      Size imageSize,
      ) async {
    final Completer<BitmapDescriptor> completer = Completer();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final double imageWidth = imageSize.width;
    final double imageHeight = imageSize.height;

    final Rect imageRect = Rect.fromLTWH(0, 0, imageWidth, imageHeight);
    final Rect destinationRect = Rect.fromLTWH(0, 0, imageWidth, imageHeight);

    final Paint paint = Paint()..color = Colors.transparent;

    final ImageStream stream = imageProvider.resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) async {
      final Size imageSize = Size(imageInfo.image.width.toDouble(), imageInfo.image.height.toDouble());
      final Rect sourceRect = Rect.fromLTRB(0, 0, imageSize.width, imageSize.height);
      paintImage(
        canvas: canvas,
        rect: destinationRect,
        image: imageInfo.image,
        fit: BoxFit.fill,
        // sourceRect: sourceRect,
        // paintFilterQuality: FilterQuality.high,
      );

      final ui.Image image = await pictureRecorder.endRecording().toImage(
        imageWidth.toInt(),
        imageHeight.toInt(),
      );

      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        final Uint8List bytes = byteData.buffer.asUint8List();
        final BitmapDescriptor bitmapDescriptor = BitmapDescriptor.fromBytes(bytes);
        completer.complete(bitmapDescriptor);
      } else {
        completer.completeError('Failed to load image');
      }
    }));

    return completer.future;
  }
  void _getPolyline(LatLng startPosition ,LatLng endPosition) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppURL.kApiGoogleMap,
      PointLatLng(startPosition.latitude, startPosition.longitude),
      PointLatLng(endPosition.latitude, endPosition.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    setState(() {});
  }
}
