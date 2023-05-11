// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

import 'package:portfolio_final_omar/firebase_options.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__toast.dart';

class WorksModel {
  static List<WorksModel> items = [];

  int? key;
  String? imageUrl;
  String? publisedDate;
  String? title;
  String? motto;
  String? category;
  String? projectDuration;
  String? projectPlatform; // For the platforms - the application is made
  String? toolsUsed; // Tools used to make the application
  String? features;
  String? description;
  String? urlDownload;
  String? urlLiveDemo;
  String? urlPlayStore;
  String? urlAppleStore;
  String? otherDetails;
  WorksModel({
    this.key,
    this.imageUrl,
    this.publisedDate,
    this.title,
    this.motto,
    this.category,
    this.projectDuration,
    this.projectPlatform,
    this.toolsUsed,
    this.features,
    this.description,
    this.urlDownload,
    this.urlLiveDemo,
    this.urlPlayStore,
    this.urlAppleStore,
    this.otherDetails,
  });

  static getData() async {
    DatabaseReference ref = FirebaseConnection.connect;
    final snapshot = await ref.child('works').get();
    if (snapshot.exists) {
      try {
        items.clear();
        for (var element in snapshot.children) {
          WorksModel item = WorksModel.fromMap(Map<String, dynamic>.from(element.value as Map));

          item.key = int.parse(element.key ?? '-1');
          items.add(item);
        }
      } catch (e) {
        log('ERROR: $e');
      }
    }
  }

  static removeItem(int id) async {
    try {
      DatabaseReference ref = FirebaseConnection.connect.child('works');
      await ref.child(id.toString()).remove();
      myToast('Item removed');
    } catch (e) {
      log('ERROR: $e');
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'imageUrl': imageUrl,
      'publisedDate': publisedDate,
      'title': title,
      'motto': motto,
      'category': category,
      'projectDuration': projectDuration,
      'projectPlatform': projectPlatform,
      'toolsUsed': toolsUsed,
      'features': features,
      'description': description,
      'urlDownload': urlDownload,
      'urlLiveDemo': urlLiveDemo,
      'urlPlayStore': urlPlayStore,
      'urlAppleStore': urlAppleStore,
      'otherDetails': otherDetails,
    };
  }

  factory WorksModel.fromMap(Map<String, dynamic> map) {
    return WorksModel(
      key: map['key'] != null ? map['key'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      publisedDate: map['publisedDate'] != null ? map['publisedDate'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      motto: map['motto'] != null ? map['motto'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      projectDuration: map['projectDuration'] != null ? map['projectDuration'] as String : null,
      projectPlatform: map['projectPlatform'] != null ? map['projectPlatform'] as String : null,
      toolsUsed: map['toolsUsed'] != null ? map['toolsUsed'] as String : null,
      features: map['features'] != null ? map['features'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      urlDownload: map['urlDownload'] != null ? map['urlDownload'] as String : null,
      urlLiveDemo: map['urlLiveDemo'] != null ? map['urlLiveDemo'] as String : null,
      urlPlayStore: map['urlPlayStore'] != null ? map['urlPlayStore'] as String : null,
      urlAppleStore: map['urlAppleStore'] != null ? map['urlAppleStore'] as String : null,
      otherDetails: map['otherDetails'] != null ? map['otherDetails'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorksModel.fromJson(String source) => WorksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorksModel(key: $key, imageUrl: $imageUrl, publisedDate: $publisedDate, title: $title, motto: $motto, category: $category, projectDuration: $projectDuration, projectPlatform: $projectPlatform, toolsUsed: $toolsUsed, features: $features, description: $description, urlDownload: $urlDownload, urlLiveDemo: $urlLiveDemo, urlPlayStore: $urlPlayStore, urlAppleStore: $urlAppleStore, otherDetails: $otherDetails)';
  }

  @override
  bool operator ==(covariant WorksModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.imageUrl == imageUrl &&
        other.publisedDate == publisedDate &&
        other.title == title &&
        other.motto == motto &&
        other.category == category &&
        other.projectDuration == projectDuration &&
        other.projectPlatform == projectPlatform &&
        other.toolsUsed == toolsUsed &&
        other.features == features &&
        other.description == description &&
        other.urlDownload == urlDownload &&
        other.urlLiveDemo == urlLiveDemo &&
        other.urlPlayStore == urlPlayStore &&
        other.urlAppleStore == urlAppleStore &&
        other.otherDetails == otherDetails;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        imageUrl.hashCode ^
        publisedDate.hashCode ^
        title.hashCode ^
        motto.hashCode ^
        category.hashCode ^
        projectDuration.hashCode ^
        projectPlatform.hashCode ^
        toolsUsed.hashCode ^
        features.hashCode ^
        description.hashCode ^
        urlDownload.hashCode ^
        urlLiveDemo.hashCode ^
        urlPlayStore.hashCode ^
        urlAppleStore.hashCode ^
        otherDetails.hashCode;
  }

  WorksModel copyWith({
    int? key,
    String? imageUrl,
    String? publisedDate,
    String? title,
    String? motto,
    String? category,
    String? projectDuration,
    String? projectPlatform,
    String? toolsUsed,
    String? features,
    String? description,
    String? urlDownload,
    String? urlLiveDemo,
    String? urlPlayStore,
    String? urlAppleStore,
    String? otherDetails,
  }) {
    return WorksModel(
      key: key ?? this.key,
      imageUrl: imageUrl ?? this.imageUrl,
      publisedDate: publisedDate ?? this.publisedDate,
      title: title ?? this.title,
      motto: motto ?? this.motto,
      category: category ?? this.category,
      projectDuration: projectDuration ?? this.projectDuration,
      projectPlatform: projectPlatform ?? this.projectPlatform,
      toolsUsed: toolsUsed ?? this.toolsUsed,
      features: features ?? this.features,
      description: description ?? this.description,
      urlDownload: urlDownload ?? this.urlDownload,
      urlLiveDemo: urlLiveDemo ?? this.urlLiveDemo,
      urlPlayStore: urlPlayStore ?? this.urlPlayStore,
      urlAppleStore: urlAppleStore ?? this.urlAppleStore,
      otherDetails: otherDetails ?? this.otherDetails,
    );
  }
}
