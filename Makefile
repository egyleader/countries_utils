.PHONY: sync-data generate test all clean

## Fetch latest country data from REST Countries v3.1 API
sync-data:
	dart pub add http --dev
	dart tool/fetch_countries.dart
	dart pub remove http

## Run code generation (freezed + json_serializable)
generate:
	dart run build_runner build --delete-conflicting-outputs

## Run tests
test:
	dart test

## Sync data + generate + test
all: sync-data generate test

## Remove generated files
clean:
	find lib -name "*.g.dart" -delete
	find lib -name "*.freezed.dart" -delete
