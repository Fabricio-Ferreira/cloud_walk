run_test:
	bash ./create_test_all_test.sh
	flutter test "test/test_all_test.dart" "test/test_all_widgets_test.dart"
	rm -f "test/test_all_test.dart"
	rm -f "test/test_all_widgets_test.dart"

run_test_cov:
	bash ./create_test_all_test.sh
	flutter test "test/test_all_test.dart" "test/test_all_widgets_test.dart" --coverage ${ARGS}
	rm -f "test/test_all_test.dart"
	rm -f "test/test_all_widgets_test.dart"