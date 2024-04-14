import 'package:catelyne_pet_flutter/features/products/view_models.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/grid_view_builder.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/cs_scaffold.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/cs_footer.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/controllers/home_page_controller.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/sections/home_best_sellers_section.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/widgets/banner_fg_content.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/sections/home_product_categories.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/widgets/home_client_testimonials.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/widgets/news_letter.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/widgets/offer_message_banner.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/views/widgets/section_title_with_button.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/blogs/blog_view_model.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/widgets/blogs/blog_card.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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

    final dataController = ref.watch(homePageController);

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
              ...homePageBestSellersSectionWidgets(
                context,
                contentWidth,
                dataController,
              ),
            ],
          ),
        ),
        HomeClientTestimonialsSection(contentWidth: contentWidth),
        SizedBox(
          width: contentWidth - UiConstants.generalDisplayHorizontalPadding * 2,
          child: Column(
            children: [
              SectionTitleWithButton(
                title: 'Popular articles',
                buttonText: 'View All',
                displayWidth: contentWidth,
                onPressed: () {},
              ),
              CsGridView(
                maxItemsPerRow: 4,
                children: blogs.map((e) => BlogCard(blog: e)).toList(),
              ),
              NewsLetterSectionInHomePage(
                screenShouldShrink: screenShouldShrink,
              ),
              const SizedBox(height: 80.0),
              SectionTitleWithButton(
                title: 'New Products Arrival',
                buttonText: 'View All',
                displayWidth: contentWidth,
                onPressed: () {},
              ),
              FutureBuilder(
                future: dataController.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductViewModel> allProducts = snapshot.data ?? [];
                    if (allProducts.isEmpty) {
                      return const Center(
                        child: Text('No Products Found!'),
                      );
                    } else {
                      return CsGridView(
                        maxItemsPerRow: 3,
                        rowGap: 20.0,
                        children: List.generate(
                          allProducts.length,
                          (index) => CsProductCard(product: allProducts[index]),
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        // Footer
        CsFooter(contentWidth: contentWidth),
      ],
    );
  }
}
