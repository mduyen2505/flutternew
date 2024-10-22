import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/apps-ui-application-svgrepo-com.svg",
            height: 14,
          ),
        ),
        SizedBox(
          width: 195,
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
                  const Text(
                    'Mondolibug, Sylhet',
                    style: TextStyle(
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
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            "images/bag-smile-svgrepo-com.svg",
            height: 30,
          ),
        ),
      ],
    );
  }
}
