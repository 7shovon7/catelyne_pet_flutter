import 'package:catelyne_pet_flutter/features/blogs/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogViewModel extends BlogModel {
  BlogViewModel({
    required super.title,
    required super.content,
    required super.tags,
    required super.featuredImage,
    required super.postedAt,
  }) : super(
          createdAt: Timestamp.now(),
          updatedAt: Timestamp.now(),
        );

  factory BlogViewModel.fromBlogModel(BlogModel blog) {
    return BlogViewModel(
      title: blog.title,
      content: blog.content,
      tags: blog.tags,
      featuredImage: blog.featuredImage,
      postedAt: blog.postedAt,
    );
  }
}
