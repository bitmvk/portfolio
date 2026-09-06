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

- Indigo → violet gradient background, translucent rounded cards, accent
  buttons (`StadiumBorder`), emojis instead of image assets.
- All styling lives in `ThemeData` (main.dart) and `widgets/page_frame.dart`.

## Responsive design

- Content is centered and constrained to `maxWidth: 600` — readable on any
  screen size; everything scrolls vertically on small screens.
- No fixed pixel layouts; buttons and cards stretch with the available width.

## Run

```sh
flutter pub get
flutter run
```
