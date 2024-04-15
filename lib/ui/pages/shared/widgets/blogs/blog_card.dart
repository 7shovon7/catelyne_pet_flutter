import 'package:catelyne_pet_flutter/features/blogs/view_models.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
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
            blog.featuredImage,
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
          blog.postedAt.toString().toUpperCase(),
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
