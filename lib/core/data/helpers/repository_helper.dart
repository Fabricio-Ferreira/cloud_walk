import 'package:cloud_walk_test/core/data/adapters/apod_list_adapter.dart';

class RepositoryHelper {
  RepositoryHelper._();

  static List<ApodListAdapter> filterList(List<ApodListAdapter> apodList, String title) {
    final apodListFiltered = <ApodListAdapter>[];
    apodList.forEach((element) {
      if ((element.title).toLowerCase().contains(title.toLowerCase())) {
        apodListFiltered.add(element);
      }
    });

    return apodListFiltered;
  }
}
