import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart'; // Thêm import cho geocoding
import 'package:geolocator/geolocator.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String _currentLocation = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Kiểm tra quyền truy cập vị trí
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = 'Không có quyền truy cập vị trí';
      });
      return;
    }

    String abbreviate(String text) {
      // Tách chuỗi thành danh sách từ và lấy chữ cái đầu của mỗi từ
      return text
          .split(' ')
          .map((word) => word.isNotEmpty ? word[0] : '')
          .join('')
          .toUpperCase(); // Viết hoa
    }

    try {
      // Lấy vị trí hiện tại
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Chuyển đổi tọa độ thành địa chỉ
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];

        setState(() {
          // Định dạng địa chỉ: Tên đường và viết tắt administrativeArea
          String street = place.thoroughfare
                  ?.replaceAll("Đường", "St.")
                  .replaceAll("Street", "St.")
                  .trim() ??
              '';
          String administrativeAreaAbbr =
              abbreviate(place.administrativeArea ?? '');

          // Kiểm tra độ dài của địa chỉ
          if (street.length + administrativeAreaAbbr.length > 20) {
            // 20 là độ dài tối đa
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
        _currentLocation = 'Unable to get location'; // Hiển thị lỗi chi tiết
      });
      print('Error getting location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // IconButton đầu tiên
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/icons/code-scan-svgrepo-com.svg",
            height: 30,
          ),
        ),
        // Dùng Expanded cho Column
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
        // IconButton thứ hai
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
