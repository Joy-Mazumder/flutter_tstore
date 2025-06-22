import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/style/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  final String image;
  final String brand;

  const TProductCardVertical({
    super.key,
    this.image=TImages.productImage1,
    this.brand = 'Nike',
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, Wishlist Button, Diascount Tag
            TRoundedContainer(
              height: 180,
      
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              // showBorders: true,
              child: Stack(
                children: [
                  // Thumbnail Image
                  TRoundedImage(imageUrl: image),
      
                  //Sale Tag
                  Positioned(
                    // top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withAlpha(
                        (255 * 0.8).round(),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      // showBorders: true,
                      child: Text(
                        '25%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),
      
                  // Favourite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            // SizedBox(height: TSizes.spaceBtwItems/2,),
      
            // Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        brand,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ), // Row
                  
               ],
              ),
            ),

            Spacer(),
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: '38.0',),
                      ), // Text
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ),
                        ), // BoxDecoration
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ), // SizedBox
                      ), // Container
                    ],
                  ), // Row
 
          ],
        ),
      ),
    );
  }
}


class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    required this.smallSize,
  });

  final String title;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          smallSize
              ? Theme.of(context).textTheme.labelMedium
              : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
