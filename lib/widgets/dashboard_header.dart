import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;

        bool isSmallScreen = screenWidth < 400;
        bool isMediumScreen = screenWidth >= 400 && screenWidth < 600;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : (isMediumScreen ? 22 : 26),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'flisol.catefy.com/',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 11 : (isMediumScreen ? 12 : 14),
                      color: Colors.blue[400],
                    ),
                  ),
                ],
              ),
            ),

            _buildIconSection(screenWidth, isSmallScreen),
          ],
        );
      },
    );
  }

  Widget _buildIconSection(double screenWidth, bool isSmallScreen) {
    double iconSize = isSmallScreen ? 32 : (screenWidth < 600 ? 38 : 44);
    double spacing = isSmallScreen ? 4 : (screenWidth < 600 ? 6 : 8);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconButton(Icons.add, Colors.blue, iconSize),
        SizedBox(width: spacing),

        _buildIconButton(Icons.remove_red_eye, Colors.grey[400]!, iconSize),
        SizedBox(width: spacing),

        _buildIconButton(Icons.notifications, Colors.orange, iconSize),
        SizedBox(width: spacing),


        CircleAvatar(
          radius: iconSize / 2,
          backgroundColor: Colors.red[400],
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: iconSize * 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(size * 0.27),
      ),
      child: Icon(
        icon,
        color: color,
        size: size * 0.45,
      ),
    );
  }
}