import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/grid_view_builder.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/banner_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';

class HomeClientTestimonialsSection extends StatefulWidget {
  const HomeClientTestimonialsSection({
    super.key,
    required this.contentWidth,
  });

  final double contentWidth;

  @override
  State<HomeClientTestimonialsSection> createState() =>
      _HomeClientTestimonialsSectionState();
}

class _HomeClientTestimonialsSectionState
    extends State<HomeClientTestimonialsSection> {
  double clientSectionHeight = 0;
  @override
  Widget build(BuildContext context) {
    final activeTextColor = Theme.of(context).colorScheme.onPrimary;

    Widget singeClientPart({
      required String imgUrl,
      required String description,
      required String address,
    }) {
      const spacer = SizedBox(height: 20.0);
      return Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imgUrl,
                ),
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          spacer,
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeTextColor,
            ),
          ),
          spacer,
          Text(
            address,
            style: GoogleFonts.ibmPlexSerif(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: UiConstants.accentColor,
            ),
          ),
        ],
      );
    }

    return Stack(
      children: [
        BannerBackground(height: clientSectionHeight),
        MeasuredSize(
          onChange: (size) {
            setState(() {
              clientSectionHeight = size.height;
            });
          },
          child: Center(
            child: SizedBox(
              width: widget.contentWidth -
                  UiConstants.generalDisplayHorizontalPadding * 2,
              child: Column(
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    'What pets say about our shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: activeTextColor,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Clients Testimonials',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: activeTextColor,
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  CsGridView(
                    maxItemsPerRow: 3,
                    childFlex: 4,
                    dividerFlex: 1,
                    children: [
                      singeClientPart(
                        imgUrl:
                            'https://th.bing.com/th/id/OIP.rva2Zilgpv7RqADazS_F2wHaJ4?rs=1&pid=ImgDetMain',
                        description:
                            'Vestibulum commodo sapien non elit porttitor, vitae volutpat nibh mollis. Nulla porta risus id neque.',
                        address: 'Glen Sparkle, MIAMI',
                      ),
                      singeClientPart(
                        imgUrl:
                            'https://th.bing.com/th/id/OIP.UKH4Z2nytiBxnEZwikPWSgAAAA?rs=1&pid=ImgDetMain',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce varius, tortor eget condimentum tristique.',
                        address: 'Sunnyvale, California',
                      ),
                      singeClientPart(
                        imgUrl:
                            'https://th.bing.com/th/id/OIP.ke4Lnw4bNdDfLbBMMcHLfQAAAA?w=400&h=400&rs=1&pid=ImgDetMain',
                        description:
                            'Aliquam erat volutpat. Nullam rhoncus magna non ante luctus, id maximus purus convallis.',
                        address: 'New York City, New York',
                      ),
                    ],
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
