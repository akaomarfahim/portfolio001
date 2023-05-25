import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import '../backend/Firebase/firebase_backend.dart';

class BlogModel {
  static List<BlogModel> items = [];

  int? key;
  String? imageUrl;
  String? title;
  String? publisedDate;
  String? category;
  String? author;
  String? description;

  BlogModel({
    this.key,
    this.imageUrl,
    this.title,
    this.publisedDate,
    this.category,
    this.author,
    this.description,
  });

  static getData() async {
    try {
      DatabaseReference ref = FirebaseAPI.connect;
      final snapshot = await ref.child('blogs').get();
      items.clear();
      for (var element in snapshot.children) {
        BlogModel item = BlogModel.fromMap(Map<String, dynamic>.from(element.value as Map));
        item.key = int.tryParse(element.key ?? '-1');
        items.add(item);
      }
    } catch (e) {
      log('ERROR: $e');
    }
  }

  BlogModel copyWith({
    int? key,
    String? imageUrl,
    String? title,
    String? publisedDate,
    String? category,
    String? author,
    String? description,
  }) {
    return BlogModel(
      key: key ?? this.key,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      publisedDate: publisedDate ?? this.publisedDate,
      category: category ?? this.category,
      author: author ?? this.author,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'imageUrl': imageUrl,
      'title': title,
      'publisedDate': publisedDate,
      'category': category,
      'author': author,
      'description': description,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      key: map['key'] != null ? map['key'] as int : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      publisedDate: map['publisedDate'] != null ? map['publisedDate'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) => BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BlogModel(key: $key, imageUrl: $imageUrl, title: $title, publisedDate: $publisedDate, category: $category, author: $author, description: $description)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.publisedDate == publisedDate &&
        other.category == category &&
        other.author == author &&
        other.description == description;
  }

  @override
  int get hashCode {
    return key.hashCode ^ imageUrl.hashCode ^ title.hashCode ^ publisedDate.hashCode ^ category.hashCode ^ author.hashCode ^ description.hashCode;
  }
}
