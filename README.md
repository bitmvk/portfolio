# Portfolio (Flutter)

A responsive personal portfolio app built with Flutter for a UI internal exam.

## Pages & navigation

- **Home** – avatar, short introduction
- **About Me** – skills, frameworks, areas of interest
- **My Projects** – project cards with emoji icons and tech chips

Navigation is a simple `Navigator` stack: buttons `pushNamed` to a page, and
the AppBar shows a back arrow automatically. Every page has buttons to reach
the other two pages.

## Look

- Solid dark indigo background, translucent rounded cards, accent buttons
  (`StadiumBorder`), emojis instead of image assets. No gradients.
- All styling lives in `ThemeData` (main.dart) and `widgets/page_frame.dart`.

## Screenshots

`integration_test/app_test.dart` captures real rendered screenshots of every
page into `screenshots/`:

```sh
flutter test integration_test/app_test.dart -d linux
flutter test integration_test/app_test.dart -d linux --dart-define=PHONE=true
```

## Responsive design

- Content is centered and constrained to `maxWidth: 600` — readable on any
  screen size; everything scrolls vertically on small screens.
- No fixed pixel layouts; buttons and cards stretch with the available width.
- On Linux desktop, `PORTFOLIO_W`/`PORTFOLIO_H` override the window size so
  phone-sized layouts can be checked without a device.

## Run

```sh
flutter pub get
flutter run
```
