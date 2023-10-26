import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common/widgets/primary_button.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/sample_menu_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/sample_menu_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/sample_menu_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/sample_menu_days_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/sample_menu_loading_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/sample_menu_menu_list_item_widget.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class SampleMenuScreen extends StatefulWidget {
  const SampleMenuScreen({Key? key, this.categoryId}) : super(key: key);

  final int? categoryId;

  @override
  State<SampleMenuScreen> createState() => _SampleMenuScreenState();
}

class _SampleMenuScreenState extends State<SampleMenuScreen> {
  @override
  void initState() {
    _onDaySelected(Weekday(1, Weekdays.Monday));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: Text(
          context.appStrings.sampleMenu,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.materialPadding),
        child: Column(
          children: [
            SampleMenuDaysWidget(onTap: _onDaySelected),
            const SizedBox(height: Dimensions.materialPadding),
            ListTile(
              tileColor: AppColors.dividerColor,
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.all(Dimensions.padding_8),
              leading: const Icon(Icons.info, color: AppColors.primaryBlack),
              title: Text(context.appStrings.this_sample_menu_gives,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: Dimensions.materialPadding),
            BlocBuilder<SampleMenuCubit, SampleMenuScreenStates>(
                builder: (context, state) => state.maybeWhen(
                    loading: () => const SampleMenuLoadingWidget(),
                    onError: (error) => Center(child: Text(error)),
                    onMenuFetched: (weekday, menuGroups) => Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(weekday.day.name,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                              const SizedBox(
                                  height: Dimensions.materialPadding),
                              Expanded(
                                  child: ListView.separated(
                                      itemCount: menuGroups.length,
                                      separatorBuilder: (context, _) =>
                                          const SizedBox(
                                              height: Dimensions.padding_20),
                                      itemBuilder: (context, index) =>
                                          SampleMenuListItemWidget(
                                              menuGroup: menuGroups[index])))
                            ],
                          ),
                        ),
                    orElse: () => const SizedBox.shrink()))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: Dimensions.materialPadding,
            left: Dimensions.materialPadding,
            bottom: Dimensions.materialPadding),
        child: PrimaryButton(
          label: context.appStrings.customize_my_plan,
          onPressed: () {},
        ),
      ),
    );
  }

  void _onDaySelected(Weekday weekday) {
    context.read<SampleMenuCubit>().getSampleMenuByDay(weekday);
  }
}
