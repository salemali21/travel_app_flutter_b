import 'package:get/get.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/network/firestore_service.dart';

class SearchResultsController extends GetxController {
  bool isLoading = false;

  List<TourModel> results = [];

  onInit() async {
    super.onInit();
  }

  Future<void> searching({
    String? city,
    DateTime? checkIn,
    DateTime? checkOut,
  }) async {
    results = [];
    isLoading = true;
    update();

    var querySnapshot = await FirestoreServic.instance.getTours();

    querySnapshot.docs.forEach((element) {
      results.add(TourModel.fromJson(element.data()));
    });

    isLoading = false;
    update();
  }
}
