DATE=$(shell date +%Y_%m%d_%H%M)
_TMPDIR=$(TMPDIR)

open: setup
	idea .

open-xcode: setup
	open ios/Runner.xcworkspace

setup:
	flutter pub get

watch: setup
	flutter pub run build_runner watch --delete-conflicting-outputs

build-dev-apk:
	flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
	flutter build apk --target lib/main_dev.dart
	rm -rf ./pomodoro_jjang_dev_????_????_????.apk
	cp build/app/outputs/flutter-apk/app-release.apk ./pomodoro_jjang_dev_$(DATE).apk

build-prd-apk:
	flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
	flutter build apk --target lib/main_prd.dart
	rm -rf ./pomodoro_jjang_prd_????_????_????.apk
	cp build/app/outputs/flutter-apk/app-release.apk ./pomodoro_jjang_prd_$(DATE).apk
