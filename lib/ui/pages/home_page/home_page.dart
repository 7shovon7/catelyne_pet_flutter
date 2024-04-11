import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/grid_view_builder.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/cs_scaffold.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/sections/home_best_sellers_section.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/banner_fg_content.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/sections/home_product_categories.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/home_client_testimonials.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/offer_message_banner.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/section_title_with_button.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/blogs/blog_view_model.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/widgets/blogs/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double offerBannerHeight = 0;
  double totalStackHeight = 0;
  double clientSectionHeigh = 0;
  Widget bannerMainContent = Container();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = context.width;
    double contentWidth = deviceWidth > UiConstants.largeDisplayMaxWidth
        ? UiConstants.largeDisplayMaxWidth
        : deviceWidth;
    bool screenShouldShrink = deviceWidth < UiConstants.largeDisplayMinWidth;

    List<BlogViewModel> blogs = [
      BlogViewModel(
        imgUrl:
            'https://static.wixstatic.com/media/90f66c_0b711d6586ff4650a93dce059b05522d~mv2.jpg/v1/fill/w_897,h_600,al_c,q_85/90f66c_0b711d6586ff4650a93dce059b05522d~mv2.jpg',
        title: 'Dapibus Ultrices Iaculis Nunc Commodo',
        date: 'DECEMBER 2, 2021',
      ),
      BlogViewModel(
        imgUrl:
            'https://th.bing.com/th/id/OIP.W_lj8k4OnWmspfDjtMTu_wHaE5?rs=1&pid=ImgDetMain',
        title: 'Aliquet Porttitor Lacusuctus Accumsan',
        date: 'DECEMBER 2, 2021',
      ),
      BlogViewModel(
        imgUrl:
            'https://3.bp.blogspot.com/-0YpV_yoC0t0/WPgwRCehH2I/AAAAAAAAADk/lpmwNidg1dY_5gCzr1JBpnOwlvHfq-DVgCLcB/w1152/pet.jpg',
        title: 'Elementum Tempus Egestas Suspendisse',
        date: 'DECEMBER 2, 2021',
      ),
      BlogViewModel(
        imgUrl:
            'https://www.petplay.com/cdn/shop/articles/blogs_1920x.jpg?v=1586953857',
        title: 'Dignissim Cras Tincidunt Lobortis',
        date: 'DECEMBER 2, 2021',
      ),
    ];

    return CsScaffold(
      additionalBgHeight: offerBannerHeight / 2.0,
      foregroundWidgets: [
        HomeBannerForegroundContent(
          screenShouldShrink: screenShouldShrink,
          deviceWidth: contentWidth,
        ),
      ],
      mainWidgets: [
        SizedBox(
          width: contentWidth - UiConstants.generalDisplayHorizontalPadding * 2,
          child: Column(
            children: [
              HomepageOfferMessageBanner(
                screenShouldShrink: screenShouldShrink,
                onChange: (p0) {
                  setState(() {
                    offerBannerHeight = p0.height;
                  });
                },
              ),
              ...homePageProductCategoriesSectionWidgets(context),
              ...homePageBestSellersSectionWidgets(context),
            ],
          ),
        ),
        HomeClientTestimonialsSection(contentWidth: contentWidth),
        SizedBox(
          width: contentWidth - UiConstants.generalDisplayHorizontalPadding * 2,
          child: Column(
            children: [
              SectionTitleWithButton(
                title: 'Popular articles about pets',
                buttonText: 'View All',
                onPressed: () {},
              ),
              CsGridView(
                maxItemsPerRow: 4,
                children: blogs.map((e) => BlogCard(blog: e)).toList(),
              ),
              const SizedBox(height: 80.0),
              Container(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  top: 60.0,
                  bottom: 60.0,
                ),
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Newsletter Updates',
                      style: GoogleFonts.ibmPlexSerif(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Enter your email address below to subscribe to our newsletter.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Expanded(
                          flex: 10,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: UiConstants.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            style: WidgetConstants.defaultButtonStyle,
                            onPressed: () {},
                            child: const Padding(
                              padding: WidgetConstants.defaultButtonPadding,
                              child: Text('Subscribe'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 16,
                          child: Container(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text('Your privacy is our policy.'),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
