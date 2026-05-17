.PHONY: get clean clean_ios pod feature build_runner build_dir build_apk build_ipa

# Lấy các dependencies (pub get)
get:
	flutter pub get

# Chạy build runner (sinh code tự động cho freezed, json_serializable, injectable...)
build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

# Chạy build runner cho một thư mục chỉ định, ví dụ: make build_dir path=lib/features/user
build_dir:
	@if [ "$(path)" = "" ]; then \
		echo "Bạn cần cung cấp path! Cú pháp: make build_dir path=lib/features/user"; \
		exit 1; \
	fi
	flutter pub run build_runner build --build-filter="$(path)/**"

# Xóa cache Flutter và sau đó pub get lại
clean:
	flutter clean
	flutter pub get

# Cài đặt lại Pod cho iOS (pod install)
pod:
	cd ios && pod install --repo-update && cd ..

# Xóa hoàn toàn thư mục Pods, Podfile.lock và cài lại pod từ đầu
clean_ios:
	cd ios && rm -rf Pods/ && rm -rf Podfile.lock && pod install --repo-update && cd ..

# Tạo nhanh một feature mới bằng Mason
# Lệnh dùng: make feature name=login
feature:
	@if [ "$(name)" = "" ]; then \
		echo "Bạn cần cung cấp tên feature! Cú pháp: make feature name=login"; \
		exit 1; \
	fi
	mason make feature --name $(name) -o lib/features/$(name)

# Build ứng dụng Android định dạng APK (Release)
build_apk:
	flutter build apk --release

# Build ứng dụng iOS định dạng IPA (Release)
build_ipa:
	flutter build ipa --release
