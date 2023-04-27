// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

import 'package:portfolio_final_omar/firebase_options.dart';

class WorksModel {
  static List<WorksModel> items = [];

  String title;
  String tagLine;
  String category;
  String projectDuration;
  String projectPlatform;
  String applicationFrame;
  String imageUrl;
  String description;
  String publisedDate;
  String urlDownload;
  String urlLiveDemo;
  String urlPlayStore;
  String urlAppleStore;
  String features;
  String applicationUsed;
  String otherDetails;

  WorksModel({
    required this.title,
    required this.tagLine,
    required this.category,
    required this.projectDuration,
    required this.projectPlatform,
    required this.applicationFrame,
    required this.imageUrl,
    required this.description,
    required this.publisedDate,
    required this.urlDownload,
    required this.urlLiveDemo,
    required this.urlPlayStore,
    required this.urlAppleStore,
    required this.features,
    required this.applicationUsed,
    required this.otherDetails,
  });

  static getData() async {
    try {
      DatabaseReference ref = FirebaseConnection.connect;
      final snapshot = await ref.child('works').get();
      items.clear();
      for (var element in snapshot.children) {
        WorksModel item = WorksModel.fromMap(Map<String, dynamic>.from(element.value as Map));
        items.add(item);
      }
    } catch (e) {
      log('ERROR: $e');
    }
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'tagLine': tagLine,
      'category': category,
      'imageUrl': imageUrl,
      'projectDuration': projectDuration,
      'projectPlatform': projectPlatform,
      'applicationFrame': applicationFrame,
      'description': description,
      'publisedDate': publisedDate,
      'urlDownload': urlDownload,
      'urlLiveDemo': urlLiveDemo,
      'urlPlayStore': urlPlayStore,
      'urlAppleStore': urlAppleStore,
      'features': features,
      'applicationUsed': applicationUsed,
      'otherDetails': otherDetails,
    };
  }

  factory WorksModel.fromMap(Map<String, dynamic> map) {
    return WorksModel(
      title: map['title'] != null ? map['title'] as String : '',
      tagLine: map['tagLine'] != null ? map['tagLine'] as String : '',
      projectDuration: map['projectDuration'] != null ? map['projectDuration'] as String : '',
      projectPlatform: map['projectPlatform'] != null ? map['projectPlatform'] as String : '',
      applicationFrame: map['applicationFrame'] != null ? map['applicationFrame'] as String : '',
      category: map['category'] != null ? map['category'] as String : '',
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : '',
      description: map['description'] != null ? map['description'] as String : '',
      publisedDate: map['publisedDate'] != null ? map['publisedDate'] as String : '',
      urlDownload: map['urlDownload'] != null ? map['urlDownload'] as String : '',
      urlLiveDemo: map['urlLiveDemo'] != null ? map['urlLiveDemo'] as String : '',
      urlPlayStore: map['urlPlayStore'] != null ? map['urlPlayStore'] as String : '',
      urlAppleStore: map['urlAppleStore'] != null ? map['urlAppleStore'] as String : '',
      features: map['features'] != null ? map['features'] as String : '',
      applicationUsed: map['applicationUsed'] != null ? map['applicationUsed'] as String : '',
      otherDetails: map['otherDetails'] != null ? map['otherDetails'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorksModel.fromJson(String source) => WorksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorksModel(title: $title, category: $category, imageUrl: $imageUrl, description: $description, publisedDate: $publisedDate, urlDownload: $urlDownload, urlLiveDemo: $urlLiveDemo, urlPlayStore: $urlPlayStore, urlAppleStore: $urlAppleStore, features: $features, applicationUsed: $applicationUsed, otherDetails: $otherDetails)';
  }

  @override
  bool operator ==(covariant WorksModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.category == category &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.publisedDate == publisedDate &&
        other.urlDownload == urlDownload &&
        other.urlLiveDemo == urlLiveDemo &&
        other.urlPlayStore == urlPlayStore &&
        other.urlAppleStore == urlAppleStore &&
        other.features == features &&
        other.applicationUsed == applicationUsed &&
        other.otherDetails == otherDetails;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        category.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        publisedDate.hashCode ^
        urlDownload.hashCode ^
        urlLiveDemo.hashCode ^
        urlPlayStore.hashCode ^
        urlAppleStore.hashCode ^
        features.hashCode ^
        applicationUsed.hashCode ^
        otherDetails.hashCode;
  }
}
