import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/blogs/blog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });

  final BlogViewModel blog;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 200,
          child: Image.network(
            blog.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          blog.title,
          textAlign: TextAlign.left,
          style: GoogleFonts.ibmPlexSerif(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          blog.date.toUpperCase(),
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: UiConstants.offWhite,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
