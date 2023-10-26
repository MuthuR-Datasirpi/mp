import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/sample_menu_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/sample_menu_screen_states.dart';

class SampleMenuCubit extends Cubit<SampleMenuScreenStates> {
  SampleMenuCubit() : super(const SampleMenuScreenStates.initial());

  //TODO:Will delete this when api is implemented this is just to mock and render ui.
  final List<SampleMenuResponse> testMenuResponses = [
    SampleMenuResponse(
      day: "Monday",
      menuGroups: [
        MenuGroup(
          name: "Breakfast",
          id: 1,
          sampleMenuItems: [
            MenuItem(
              id: 1,
              createdDate: "2023-10-05",
              lastModifiedDate: "2023-10-05",
              createdBy: "John Doe",
              lastModifiedBy: "John Doe",
              version: 1,
              name: "Scrambled Eggs",
              nameAr: "بيض مخفوق",
              imageUrl: "image_url_1",
              description: "Delicious scrambled eggs",
              descriptionAr: "بيض مخفوق لذيذ",
              calories: 300,
              fats: 20,
              carbs: 10,
              proteins: 15,
              day: "Monday",
              planId: 1,
              menuGroupId: 1,
            ),
            // Add more sample menu items for Breakfast as needed
          ],
        ),
        MenuGroup(
          name: "Lunch",
          id: 2,
          sampleMenuItems: [
            MenuItem(
              id: 2,
              createdDate: "2023-10-05",
              lastModifiedDate: "2023-10-05",
              createdBy: "Jane Smith",
              lastModifiedBy: "Jane Smith",
              version: 1,
              name: "Grilled Chicken",
              nameAr: "دجاج مشوي",
              imageUrl: "image_url_2",
              description: "Healthy grilled chicken breast",
              descriptionAr: "صدر دجاج مشوي صحي",
              calories: 250,
              fats: 10,
              carbs: 5,
              proteins: 30,
              day: "Monday",
              planId: 1,
              menuGroupId: 2,
            ),
            // Add more sample menu items for Lunch as needed
          ],
        ),
        MenuGroup(
          name: "Dinner",
          id: 3,
          sampleMenuItems: [
            MenuItem(
              id: 3,
              createdDate: "2023-10-05",
              lastModifiedDate: "2023-10-05",
              createdBy: "Michael Johnson",
              lastModifiedBy: "Michael Johnson",
              version: 1,
              name: "Salmon Fillet",
              nameAr: "سمك السلمون المشوي",
              imageUrl: "image_url_3",
              description: "Grilled salmon fillet with lemon",
              descriptionAr: "سمك السلمون المشوي مع ليمون",
              calories: 350,
              fats: 15,
              carbs: 10,
              proteins: 40,
              day: "Monday",
              planId: 1,
              menuGroupId: 3,
            ),
            // Add more sample menu items for Dinner as needed
          ],
        ),
        MenuGroup(
          name: "Snacks",
          id: 4,
          sampleMenuItems: [
            MenuItem(
              id: 4,
              createdDate: "2023-10-05",
              lastModifiedDate: "2023-10-05",
              createdBy: "Amanda Brown",
              lastModifiedBy: "Amanda Brown",
              version: 1,
              name: "Greek Yogurt",
              nameAr: "زبادي يوناني",
              imageUrl: "image_url_4",
              description: "Creamy Greek yogurt with honey and berries",
              descriptionAr: "زبادي يوناني كريمي مع عسل وتوت",
              calories: 150,
              fats: 5,
              carbs: 20,
              proteins: 10,
              day: "Monday",
              planId: 1,
              menuGroupId: 4,
            ),
            // Add more sample menu items for Snacks as needed
          ],
        ),
      ],
    ),
    SampleMenuResponse(
      day: "Tuesday",
      menuGroups: [
        // Menu groups and items for Tuesday
      ],
    ),
    SampleMenuResponse(
      day: "Wednesday",
      menuGroups: [
        // Menu groups and items for Wednesday
      ],
    ),
    SampleMenuResponse(
      day: "Thursday",
      menuGroups: [
        // Menu groups and items for Thursday
      ],
    ),
    SampleMenuResponse(
      day: "Friday",
      menuGroups: [
        // Menu groups and items for Friday
      ],
    ),
    SampleMenuResponse(
      day: "Saturday",
      menuGroups: [
        // Menu groups and items for Saturday
        MenuGroup(
          name: "Breakfast",
          id: 1,
          sampleMenuItems: [
            MenuItem(
              id: 1,
              createdDate: "2023-10-06",
              lastModifiedDate: "2023-10-06",
              createdBy: "John Doe",
              lastModifiedBy: "John Doe",
              version: 1,
              name: "Pancakes",
              nameAr: "فطائر",
              imageUrl: "image_url_5",
              description: "Fluffy pancakes with maple syrup",
              descriptionAr: "فطائر سميكة مع شراب القيقب",
              calories: 400,
              fats: 10,
              carbs: 60,
              proteins: 8,
              day: "Saturday",
              planId: 1,
              menuGroupId: 1,
            ),
            // Add more sample menu items for Breakfast as needed
          ],
        ),
        MenuGroup(
          name: "Lunch",
          id: 2,
          sampleMenuItems: [
            MenuItem(
              id: 2,
              createdDate: "2023-10-06",
              lastModifiedDate: "2023-10-06",
              createdBy: "Jane Smith",
              lastModifiedBy: "Jane Smith",
              version: 1,
              name: "Caesar Salad",
              nameAr: "سلطة السيزر",
              imageUrl: "image_url_6",
              description: "Classic Caesar salad with grilled chicken",
              descriptionAr: "سلطة سيزر كلاسيكية مع دجاج مشوي",
              calories: 350,
              fats: 15,
              carbs: 20,
              proteins: 25,
              day: "Saturday",
              planId: 1,
              menuGroupId: 2,
            ),
            // Add more sample menu items for Lunch as needed
          ],
        ),
        MenuGroup(
          name: "Dinner",
          id: 3,
          sampleMenuItems: [
            MenuItem(
              id: 3,
              createdDate: "2023-10-06",
              lastModifiedDate: "2023-10-06",
              createdBy: "Michael Johnson",
              lastModifiedBy: "Michael Johnson",
              version: 1,
              name: "Grilled Salmon",
              nameAr: "سمك السلمون المشوي",
              imageUrl: "image_url_7",
              description: "Grilled salmon with herbs and garlic",
              descriptionAr: "سمك السلمون المشوي مع أعشاب وثوم",
              calories: 320,
              fats: 14,
              carbs: 10,
              proteins: 35,
              day: "Saturday",
              planId: 1,
              menuGroupId: 3,
            ),
            // Add more sample menu items for Dinner as needed
          ],
        ),
        MenuGroup(
          name: "Snacks",
          id: 4,
          sampleMenuItems: [
            MenuItem(
              id: 4,
              createdDate: "2023-10-06",
              lastModifiedDate: "2023-10-06",
              createdBy: "Amanda Brown",
              lastModifiedBy: "Amanda Brown",
              version: 1,
              name: "Fruit Salad",
              nameAr: "سلطة فواكه",
              imageUrl: "image_url_8",
              description: "Fresh fruit salad with a hint of mint",
              descriptionAr: "سلطة فواكه طازجة مع نعناع خفيف",
              calories: 180,
              fats: 2,
              carbs: 45,
              proteins: 3,
              day: "Saturday",
              planId: 1,
              menuGroupId: 4,
            ),
            // Add more sample menu items for Snacks as needed
          ],
        ),
      ],
    ),
    SampleMenuResponse(
      day: "Sunday",
      menuGroups: [
        // Menu groups and items for Sunday
      ],
    ),
  ];

  void getSampleMenuByDay(Weekday weekday) async {
    emit(const SampleMenuScreenStates.loading());
    try {
      //final response = await repository.getAllBrands();
      emit(
        SampleMenuScreenStates.onMenuFetched(
            weekday,
            testMenuResponses
                .firstWhere((element) => element.day == weekday.day.name)
                .menuGroups),
      );
    } on DioException catch (e) {
      emit(SampleMenuScreenStates.onError(e.message.toString()));
    }
  }
}
