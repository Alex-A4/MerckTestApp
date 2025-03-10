# merck_test_app
Link to [description](https://disk.yandex.ru/i/wOpUZoC6HH0-Fw)

## Installing
```sh
brew install fvm

fvm use
# OR directly
fvm use 3.24.5

fvm dart pub global activate melos
fvm flutter pub get

melos bs
```

## Melos
- Run `melos bs` to call pub get
- Run `melos test` to run tests
- Run `melos check` to run analyzer and format check
- Run `melos gen` to generate all build_runner classes and localization


## Structure notes
- Because app is small, `data` and `domain` dirs are in the root of project, not in features itself
