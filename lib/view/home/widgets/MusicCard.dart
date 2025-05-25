import 'package:flutter/material.dart';
import 'package:music_app/util/images.dart';
import '../../../data/model/MusicModel.dart';
import '../../../util/dimensions.dart';

class MusicCard extends StatelessWidget {
  final MusicModel service;
  final VoidCallback onTap;

  const MusicCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height:
              screenWidth < 360
                  ? 67
                  : 70,
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeSmall,
            vertical: Dimensions.paddingSizeExtraSmall,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            image: DecorationImage(
              image: AssetImage(service.bgImg),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Color.fromRGBO(0, 0, 0, 0.79),
                BlendMode.darken,
              ),
            ),
            border: Border.all(color: const Color(0xff2C2D31), width: 1),
          ),
          child: Row(
            children: [
              Image.asset(
                service.icon,
                height: screenWidth < 360 ? 40 : 47,
                width: screenWidth < 360 ? 40 : 47,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.fontSizeDefault,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      service.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.fontSizeSmall,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Image.asset(Images.frwdIcon, height: 13, width: 7),
            ],
          ),
        ),
      ),
    );
  }
}
