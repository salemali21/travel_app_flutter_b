import 'package:get/get.dart';
import 'package:travel_app/models/category_model.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/network/firestore_service.dart';

class HomeController extends GetxController {
  List<String> continents = [];
  List<CategoryModel> popularCategory = [];
  int currentIndex = 0;
  List<TourModel> tours = [];

  onInit() {
    super.onInit();
    getContinents();
    getPopularCategory();
    getTours();
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
    print(popularCategory);
  }

  void onChangeContinent(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  Future<void> getTours() async {
    var querySnapshot = await FirestoreServic.instance.getTours();
    querySnapshot.docs.forEach((element) {
      tours.add(TourModel.fromJson(element.data()));
    });
    print(tours);
    update();
  }
}
