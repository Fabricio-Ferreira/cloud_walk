import 'package:get/get.dart';
import './apod_details_controller.dart';

class ApodDetailsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ApodDetailsController());
    }
}