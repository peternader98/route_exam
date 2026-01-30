import 'package:flutter/material.dart';
import 'package:route_exam/models/catalog_item_model.dart';

class CatalogProvider extends ChangeNotifier {
  List<CatalogItemModel> items = [];
  int itemCount = 0;

  void remove(CatalogItemModel item) {
    items.remove(item);
    itemCount--;
    notifyListeners();
  }

  void add(CatalogItemModel item) {
    items.add(item);
    itemCount++;
    notifyListeners();
  }

  int calculateTotal() {
    int total = 0;

    if(items.isEmpty) return total;

    items.forEach((element) { total += element.price;});
    return total;
  }

  Map<CatalogItemModel, int> countGeneral(List<CatalogItemModel> list){
    Map<CatalogItemModel, int> count = {};

    for(CatalogItemModel ele in list){
      count.update(ele, (value) => value + 1, ifAbsent: () => 1);
    }

    print(count);

    return count;
  }
}
