import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel {
  final String title;
  final String description;
  final String icon;
  final String bgImg;

  MusicModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.bgImg,
  });

  factory MusicModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw Exception('MusicModel.fromFirestore: data is null');
    }

    return MusicModel(
      title: data['title'] as String? ?? '',
      description: data['description'] as String? ?? '',
      icon: data['icon'] as String? ?? '',
      bgImg: data['bg_img'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'bg_img': bgImg,
    };
  }

  @override
  String toString() {
    return 'MusicModel(title: $title, description: $description, icon: $icon, bg_img: $bgImg)';
  }
}
