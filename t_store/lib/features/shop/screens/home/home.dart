import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/custom_shapes/image_text/vertical_image_text.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart_icon.dart';
import 'package:t_store/common/widgets/products/product_cards/card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final popularProducts = [
      {
        'image': TImages.productImage1,
        'brand': 'Nike',
      },
      {
        'image': TImages.productImage2,
        'brand': 'Adidas',
      },
      {
        'image': TImages.productImage3,
        'brand': 'Puma',
      },
      {
        'image': TImages.productImage4,
        'brand': 'Reebok',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // home categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return TVerticalImageText(
                                image: TImages.shoeIcon,
                                title: 'Shoes',
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                       SizedBox(height: TSizes.spaceBtwSections,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            

            // Carousel Slider
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: PromoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3,
                ],
              ),
            ),

            SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: TSectionHeading(
                title: 'Popular Products',
                onPressed: () {},
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) {
               final product = popularProducts[index];
                return TProductCardVertical(
                  image: product['image']!,
                  brand: product['brand']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: TColors.white),
          ),
        ],
      ),
      actions: [TCartCounterIcon(onPressed: () {}, iconColor: TColors.white)],
    );
  }
}
