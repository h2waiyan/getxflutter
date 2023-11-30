import 'package:get/get.dart';

class Counter extends GetxController {
  var count = 0.obs; // observed

  // increment() => count++;
  void increment() {
    count++;
  }
}


// 1. Get install
// 2. Create a class extends
// 3. Create a counter variable --- obs

// 4. Create a object
// 5. obs => obx
// 6. object name.increment method
