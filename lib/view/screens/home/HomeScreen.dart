import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/util/images.dart';
import 'package:music_app/view/base/button.dart';
import 'package:music_app/view/base/input_field.dart';
import 'package:music_app/view/base/loader.dart';
import 'package:music_app/view/screens/home/widgets/MusicCard.dart';
import 'package:provider/provider.dart';
import '../../../view_model/service_view_model.dart';
import 'ServiceDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  int _hintIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _hintIndex = (_hintIndex + 1) % hints.length;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ServiceViewModel>(context, listen: false).loadServices();
    });
  }

  final List<String> hints = [
    'Search “Punjabi Lyrics”',
    'Search “Bollywood Hits”',
    'Search “Custom Beats”',
    'Search “Top Artists”',
  ];

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ServiceViewModel>(context);
    Dimensions.init(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFA90140), Color(0xFF550120)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Dimensions.paddingSizeOverLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InputField(
                          controller: searchController,
                          subTitle: hints[_hintIndex],
                          bgColor: const Color(0xff2F2F39),
                          color: const Color(0xff61616B),
                          size: Dimensions.fontSizeDefault,
                          maxLine: 1,
                          subTitleWidget: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 800),
                            layoutBuilder: (currentChild, previousChildren) {
                              return Stack(
                                alignment: Alignment.centerLeft,
                                children: <Widget>[
                                  ...previousChildren,
                                  if (currentChild != null) currentChild,
                                ],
                              );
                            },
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                            ) {
                              final isNew = child.key == ValueKey(_hintIndex);

                              final offsetAnimation = Tween<Offset>(
                                begin: isNew ? const Offset(0, 1) : Offset.zero,
                                end: isNew ? Offset.zero : const Offset(0, -1),
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                ),
                              );

                              return SlideTransition(
                                position: offsetAnimation,
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            },
                            child: Text(
                              hints[_hintIndex],
                              key: ValueKey(_hintIndex),
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: const Color(0xff61616B),
                              ),
                            ),
                          ),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Images.searchIcon,
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 22,
                                child: VerticalDivider(
                                  width: 1,
                                  color: Color(0xff45454F),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                Images.micIcon,
                                height: 21,
                                width: 30,
                              ),
                            ],
                          ),
                          radius: 10,
                        ),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeLarge),
                      Image.asset(Images.profileImg, height: 34, width: 34),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeLarge),
                Text(
                  "Claim your",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.fontSizeDefault,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Free Demo",
                  style: GoogleFonts.lobster(fontSize: 44, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Text(
                  "for custom Music Production",
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeDefault,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(height: 110),
                    Center(
                      child: Button(
                        title: "Book Now",
                        onTap: () {},
                        width: 96,
                        height: 36,
                        radius: Dimensions.radiusOverLarge,
                        fontSize: 13,
                      ),
                    ),
                    Positioned(
                      left: -25,
                      child: Image.asset(Images.cd, height: 100, width: 100),
                    ),
                    Positioned(
                      right: -38,
                      child: Image.asset(
                        Images.guitar,
                        height: 120,
                        width: 135,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child:
                !viewModel.loading
                    ? viewModel.services.isNotEmpty
                        ? ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: viewModel.services.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.paddingSizeLarge,
                                ),
                                child: Text(
                                  "Hire hand-picked Pros for popular music services",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              final serviceIndex = index - 1;
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      serviceIndex ==
                                              viewModel.services.length - 1
                                          ? 20
                                          : 0,
                                ),
                                child: MusicCard(
                                  service: viewModel.services[serviceIndex],
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => ServiceDetailScreen(
                                                viewModel
                                                    .services[serviceIndex]
                                                    .title,
                                              ),
                                        ),
                                      ),
                                ),
                              );
                            }
                          },
                        )
                        : Center(
                          child: Text(
                            "No services found",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                    : Center(child: Loader()),
          ),
        ],
      ),
    );
  }
}
