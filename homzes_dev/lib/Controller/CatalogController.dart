// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes_dev/Views/Search&CatlogScreen2.dart';

class CatalogController extends GetxController {
  var isLoading = true.obs;
  var items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatalog();
  }

  void fetchCatalog() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('collection').get();
      final fetchedItems = snapshot.docs.map((doc) => doc.data()).toList();

      items.value = fetchedItems;
      for (var item in fetchedItems) {
        print("Catalog Item: $item");
      }
    } finally {
      isLoading.value = false;
    }
  }

  void ViewAllTextButton() {
    Get.to(
      const SearchCatlogscreen2(),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 500),
    );
  }
}
