import 'package:HDTech/constants.dart';
import 'package:flutter/material.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  // Trạng thái của các switch
  bool _eneblefaceidforlogin = false;
  bool _enblepushnotifications = false;
  bool _enblelocationservices = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Thiết lập chiều cao cho Container
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Căn trái cho các phần tử
        children: [
          // Tiêu đề App Settings
          const Text(
            'App Settings',
            style: TextStyle(
              fontSize: 20, // Kích thước chữ lớn hơn cho tiêu đề
              fontWeight: FontWeight.bold, // Đậm
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20), // Khoảng cách giữa tiêu đề và switch

          // Switch đầu tiên
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  const Text(
                    'Eneble Face ID For Log In',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: _eneblefaceidforlogin,
                    activeTrackColor: kprimaryColor,
                    onChanged: (value) {
                      setState(() {
                        _eneblefaceidforlogin = value; // Cập nhật trạng thái
                      });
                    },
                  ),
                ],
              ),
              const Divider(), // Đường line dưới Row
            ],
          ),

          const SizedBox(height: 12), // Tạo khoảng cách giữa các switch

          // Switch thứ hai
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  const Text(
                    'Eneble Push Notifications',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: _enblepushnotifications,
                    activeTrackColor: kprimaryColor,
                    onChanged: (value) {
                      setState(() {
                        _enblepushnotifications = value; // Cập nhật trạng thái
                      });
                    },
                  ),
                ],
              ),
              const Divider(), // Đường line dưới Row
            ],
          ),

          const SizedBox(height: 12),

          // Switch thứ ba
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Đẩy các phần tử ra hai bên
                children: [
                  const Text(
                    'Eneble Location Services',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: _enblelocationservices,
                    activeTrackColor: kprimaryColor,
                    onChanged: (value) {
                      setState(() {
                        _enblelocationservices = value; // Cập nhật trạng thái
                      });
                    },
                  ),
                ],
              ),
              const Divider(), // Đường line dưới Row
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
