import 'package:get/get.dart';
import 'package:travel_app/models/category_model.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/network/firestore_service.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  List<String> continents = [];
  List<CategoryModel> popularCategory = [];
  int currentIndex = 0;
  List<TourModel> tours = [];

  onInit() async {
    super.onInit();
    isLoading = true;
    update();

    await getContinents();
    await getPopularCategory();
    await getTours();

    isLoading = false;
    update();
  }

  Future<void> getContinents() async {
    continents = [];
    var value = await FirestoreServic.instance.getContinents();
    var SelectForm = value.data()!["names"] as Map<String, dynamic>;
    SelectForm.forEach((key, value) {
      continents.add(value);
    });
    update();
  }

  Future<void> getPopularCategory() async {
    popularCategory = [];
    var documents = await FirestoreServic.instance.getPopularCategories();

    if (documents.data() == null) return;

    documents.data()!.forEach((key, value) {
      popularCategory.add(CategoryModel.fromJson(value));
    });
  }

  void onChangeContinent(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  Future<void> getTours() async {
    tours = [];
    var querySnapshot = await FirestoreServic.instance.getTours();
    querySnapshot.docs.forEach((element) {
      tours.add(TourModel.fromJson(element.data()));
    });
    update();
  }
}
