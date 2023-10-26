import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/custom_expandable_tile.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/common/widgets/custom_ratio_list.dart';
import 'package:mobile/common/widgets/custom_ratio_row.dart';
import 'package:mobile/common/widgets/customappbar.dart';
import 'package:mobile/common/widgets/date_picker.dart';
import 'package:mobile/common/widgets/height_gap.dart';
import 'package:mobile/common/widgets/parent_widget.dart';
import 'package:mobile/common/widgets/price_row.dart';
import 'package:mobile/common/widgets/ratings_with_title.dart';
import 'package:mobile/common/widgets/secondary_button.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/resources/text_styles.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class PlanDetailScreen extends StatefulWidget {
  final MealPlans mealPlans;

  PlanDetailScreen({Key? key, required this.mealPlans}) : super(key: key);

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: context.appStrings.planDetails),
      body: Parent(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomNetworkImage(
                width: width,
                height: 212,
                imageUrl: widget.mealPlans.imageUrl,
                fit: BoxFit.fill),
          ),
          HeightGap(height: 20),
          InkWell(
            onTap: () {
              context.push(PagePath.sampleMenu);
            },
            child: SecondaryButton(
              backgroundColor: AppColors.backgroundWhiteColor,
              borderColor: AppColors.hyperLinkColor,
              textColor: AppColors.hyperLinkColor,
              text: context.appStrings.viewSampleMenu,
              width: width,
            ),
          ),
          HeightGap(height: 20),
          RatingWithTitle(
              title: widget.mealPlans.title!,
              ratings: widget.mealPlans.rating.toString()),
          HeightGap(height: 16),
          Text(
            widget.mealPlans.description!,
            style:
                AppStyles.medium14.copyWith(color: AppColors.inputLabelColor),
          ),
          HeightGap(height: 16),
          CustomExpandableTile(
            title: 'Benefits',
            items: [
              "Perfect for busy people",
              "Pause & resume anytime",
              "New dishes added every month",
              "Includes vegetarian & pescatarian options",
              "Fully customizable plan after purchase"
            ],
          ),
          CustomExpandableTile(
            title: 'Dietary Information',
            items: [
              "Carbs: 60 - 90g",
              "Protein: 100 - 110g",
              "Fat: 30 - 40 g",
            ],
          ),
          HeightGap(height: 24),
          Divider(
            color: AppColors.dividerColor,
          ),
          HeightGap(height: 24),
          CustomRadioList(
            headertext: "Choose your daily meals",
            titles: [
              'Breakfast + Lunch',
              'Lunch + Snack',
              'Lunch + Dinner + Snack',
              'Breakfast + Lunch + Dinner + 2 Snacks'
            ],
            selectedBackgroundColor: AppColors.greenShade,
            unselectedBackgroundColor: Colors.white,
            selectedborderColor: AppColors.hyperLinkColor,
            selectedTextColor: Colors.white,
            unselectedTextColor: Colors.black,
            unselectedborderColor: AppColors.blackBorder,
            onItemSelected: (p0) {
              print("this is $p0");
            },
          ),
          HeightGap(height: 16),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Daily calorie intake ',
                    style: AppStyles.medium14
                        .copyWith(color: AppColors.inputLabelColor)),
                TextSpan(
                  text: '(1200 - 1900) ',
                  style: AppStyles.medium14
                      .copyWith(color: AppColors.selectedRatio),
                ),
                TextSpan(
                    text: 'It depends upon the daily meals combo you choose.',
                    style: AppStyles.medium14
                        .copyWith(color: AppColors.inputLabelColor)),
              ],
            ),
          ),
          HeightGap(height: 24),
          Divider(
            color: AppColors.dividerColor,
          ),
          HeightGap(height: 24),
          CustomRadioRow(
            headertext: "Select days per week",
            titles: [
              '5 Days',
              '6 Days',
              '7 Days',
            ],
            selectedBackgroundColor: AppColors.greenShade,
            unselectedBackgroundColor: Colors.white,
            selectedborderColor: AppColors.hyperLinkColor,
            selectedTextColor: Colors.white,
            unselectedTextColor: Colors.black,
            unselectedborderColor: AppColors.blackBorder,
            onItemSelected: (p0) {
              print("this is $p0");
            },
          ),
          HeightGap(height: 24),
          Divider(
            color: AppColors.dividerColor,
          ),
          HeightGap(height: 24),
          CustomRadioRow(
            headertext: "Select days per week",
            titles: ['1 week', '2 weeks', '4 weeks', '8 weeks'],
            selectedBackgroundColor: AppColors.greenShade,
            unselectedBackgroundColor: Colors.white,
            selectedborderColor: AppColors.hyperLinkColor,
            selectedTextColor: Colors.white,
            unselectedTextColor: Colors.black,
            unselectedborderColor: AppColors.blackBorder,
            onItemSelected: (p0) {
              print("this is $p0");
            },
          ),
          HeightGap(height: 24),
          Divider(
            color: AppColors.dividerColor,
          ),
          HeightGap(height: 24),
          DatePicker(title: "Select starting date"),
          HeightGap(height: 24),
          Divider(
            color: AppColors.dividerColor,
          ),
          HeightGap(height: 16),
          PriceRow(inclVat: true, priceWithUnit: "AED 4300", title: "Subtotal"),
          HeightGap(height: 12),
          InkWell(
              onTap: () {
                context.push(PagePath.summary);
              },
              child: SecondaryButton(
                  backgroundColor: AppColors.selectedRatio,
                  borderColor: AppColors.selectedRatio,
                  textColor: AppColors.backgroundWhiteColor,
                  text: "Checkout",
                  width: width))
        ],
      )),
    );
  }
}
