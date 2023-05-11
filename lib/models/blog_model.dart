// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

import '../firebase_options.dart';

class BlogModel {
  static List<BlogModel> items = [];

  int? id;
  String? imageUrl;
  String? title;
  String? publisedDate;
  String? category;
  String? author;
  String? description;

  BlogModel({
    this.id,
    this.imageUrl,
    this.title,
    this.publisedDate,
    this.category,
    this.author,
    this.description,
  });

  static getData() async {
    try {
      DatabaseReference ref = FirebaseConnection.connect;
      final snapshot = await ref.child('blogs').get();
      items.clear();
      int i = -1;
      for (var element in snapshot.children) {
        BlogModel item = BlogModel.fromMap(Map<String, dynamic>.from(element.value as Map));
        item.id = ++i;
        items.add(item);
      }
    } catch (e) {
      log('ERROR: $e');
    }
  }

  BlogModel copyWith({
    int? id,
    String? imageUrl,
    String? title,
    String? publisedDate,
    String? category,
    String? author,
    String? description,
  }) {
    return BlogModel(
      id: id ?? this.id,
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
      'id': id,
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
      id: map['id'] != null ? map['id'] as int : null,
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
    return 'BlogModel(id: $id, imageUrl: $imageUrl, title: $title, publisedDate: $publisedDate, category: $category, author: $author, description: $description)';
  }

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.imageUrl == imageUrl &&
      other.title == title &&
      other.publisedDate == publisedDate &&
      other.category == category &&
      other.author == author &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      imageUrl.hashCode ^
      title.hashCode ^
      publisedDate.hashCode ^
      category.hashCode ^
      author.hashCode ^
      description.hashCode;
  }
}
