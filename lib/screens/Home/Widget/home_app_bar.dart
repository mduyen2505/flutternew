import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CustomAppBar extends StatefulWidget {
  final void Function(Map<String, dynamic>) onFilterChanged;

  const CustomAppBar({super.key, required this.onFilterChanged});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  String _currentLocation = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = 'No location access permission';
      });
      return;
    }

    String abbreviate(String text) {
      return text
          .split(' ')
          .map((word) => word.isNotEmpty ? word[0] : '')
          .join('')
          .toUpperCase();
    }

    try {
      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      // Get address from coordinates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        setState(() {
          String street = place.thoroughfare
                  ?.replaceAll("Đường", "St.")
                  .replaceAll("Street", "St.")
                  .trim() ??
              '';
          String administrativeAreaAbbr =
              abbreviate(place.administrativeArea ?? '');

          if (street.length + administrativeAreaAbbr.length > 20) {
            _currentLocation = '$street, $administrativeAreaAbbr';
          } else {
            _currentLocation =
                '$street, ${place.subAdministrativeArea ?? ''}, $administrativeAreaAbbr';
          }
        });
      } else {
        setState(() {
          _currentLocation = 'Unable to get address';
        });
      }
    } catch (e) {
      setState(() {
        _currentLocation = 'Unable to get location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {
            // Mở FilterDrawer khi ấn vào nút lọc
            Scaffold.of(context).openDrawer(); // Mở Drawer
          },
          icon: SvgPicture.asset(
            "images/icons/code-scan-svgrepo-com.svg",
            height: 30,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 38,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Store location',
                  style: TextStyle(
                    color: Color(0xFF707B81),
                    fontSize: 14,
                    fontFamily: 'Airbnb Cereal App',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 18,
                      child: SvgPicture.asset(
                        "images/map-point-svgrepo-com.svg",
                        height: 18,
                        width: 18,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      _currentLocation,
                      style: const TextStyle(
                        color: Color(0xFF1A242F),
                        fontSize: 16,
                        fontFamily: 'Airbnb Cereal App',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/icons/cart-2-svgrepo-com.svg",
            height: 30,
          ),
        ),
      ],
    );
  }
}
