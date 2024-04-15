import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final String title;
  final String content;
  final List<String> tags;
  final String featuredImage;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final Timestamp postedAt;

  BlogModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.featuredImage,
    required this.createdAt,
    required this.updatedAt,
    required this.postedAt,
  });

  // Factory method to create BlogModel object from a map
  factory BlogModel.fromMap(Map<String, dynamic> map) {
    List<String> tags = (map['tags'] as List<dynamic>).cast<String>();
    return BlogModel(
      title: map['title'],
      content: map['content'],
      tags: tags,
      featuredImage: map['featuredImage'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      postedAt: map['postedAt'],
    );
  }

  // Method to convert BlogModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'tags': tags,
      'featuredImage': featuredImage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'postedAt': postedAt,
    };
  }
}
