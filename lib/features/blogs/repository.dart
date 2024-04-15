import 'package:catelyne_pet_flutter/data/firebase/constants.dart';
import 'package:catelyne_pet_flutter/data/firebase/firestore_db.dart';
import 'package:catelyne_pet_flutter/features/blogs/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogRepo = Provider(
  (ref) => BlogRepo(
    firestoreDB: ref.watch(firestoreProvider),
  ),
);

class BlogRepo {
  final FirestoreDB firestoreDB;

  BlogRepo({required this.firestoreDB});

  final List<BlogModel> _allBlogs = [];
  bool _areBlogsLoaded = false;
  bool _areBlogsLoading = false;

  Future<List<BlogModel>> get allBlogs async {
    while (!_areBlogsLoaded) {
      if (_areBlogsLoading) {
        // wait
        await Future.delayed(const Duration(milliseconds: 500));
      } else {
        await _fetchBlogs();
      }
    }
    return _allBlogs;
  }

  Future<void> _fetchBlogs() async {
    _areBlogsLoading = true;
    List<BlogModel> blogs = [];

    try {
      final QuerySnapshot blogsRef = await firestoreDB.firestore
          .collection(FirebaseConstants.blogsCollection)
          .get();
      if (blogsRef.docs.isNotEmpty) {
        List<DocumentSnapshot> docs = blogsRef.docs;
        for (DocumentSnapshot doc in docs) {
          BlogModel blog =
              BlogModel.fromMap(doc.data() as Map<String, dynamic>);
          blogs.add(blog);
        }
      } else {
        print(
            'No blogs found in the collection ${FirebaseConstants.blogsCollection}');
      }
    } catch (e) {
      print('Error getting blogs: $e');
    }
    if (blogs.isNotEmpty) _allBlogs.addAll(blogs);
    print('blogs are refreshed!');
    _areBlogsLoading = false;
    _areBlogsLoaded = true;
  }
}
