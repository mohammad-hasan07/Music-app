import 'package:flutter/material.dart';
import 'package:music_app/util/images.dart';
import 'package:music_app/view/home/HomeScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text('News Page', style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text('TrackBox Page', style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text('Projects Page', style: TextStyle(fontSize: 24, color: Colors.white))),
  ];

  final List<String> labels = ['Home', 'News', 'TrackBox', 'Projects'];
  final List<String> icons = [
    Images.dashIcon1,
    Images.dashIcon2,
    Images.dashIcon3,
    Images.dashIcon4
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _screens[_selectedIndex], // Show selected screen
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10)),
            border: Border.symmetric(horizontal: BorderSide(color: Color(0xff2C2D31),width: 1))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(labels.length, (index) {
              final isSelected = _selectedIndex == index;
      
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SizedBox(
                  width: 70,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(icons[index],color: isSelected?Colors.white:Colors.grey, height: 23,width: 23,),
                          SizedBox(height: 4),
                          Text(
                            labels[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      if (isSelected)
                        Positioned(
                          top: -11,
                          child: Container(
                            width: 24,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
