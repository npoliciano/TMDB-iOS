#  TMDB

The TMDB app is a lightweight iOS version of the [TMDB website](https://www.themoviedb.org/).

## Technical Objectives

- Closures
- Asynchronous operations with GDC
- Integration with a public API
- Basic SPM integration
- Kingfisher for image fetching
- Use of Core Image to get predominant colour dynamically
- Run Youtube videos
- First contact with UIViewRepresentable for UIKit interoperability.
- Adaptable layout for iPad

## Frameworks and Architecture

- SwiftUI
- MVVM
- URLSession
- GDC
- HTTP Client
- Kingfisher
- WKWebView
- Youtube
- TMDB API

## Screenshots

| Movie list | Selected Section Movie List | Movie Details |
|---|---|---|
| ![Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 42 28](https://github.com/npoliciano/TMDB-iOS/assets/119764048/294f45e6-2b59-4703-a057-34d7851905a2) | ![Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 49 02](https://github.com/npoliciano/TMDB-iOS/assets/119764048/8ea51ea7-d9f8-4f0a-adc6-6f4217c1488a) | ![Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 43 44](https://github.com/npoliciano/TMDB-iOS/assets/119764048/a8d068d2-2ad6-4059-954b-c2564f24b618) |

| Movie list - iPad | Selected Section Movie List - iPad |
|---|---|
| ![iPad Simulator Screenshot - iPad Air (5th generation) - 2024-03-31 at 15 45 57](https://github.com/npoliciano/TMDB-iOS/assets/119764048/ba5cd9d6-5bdd-4599-9219-57b95df7777c) | ![iPad Simulator Screenshot - iPad Air (5th generation) - 2024-03-31 at 15 48 06](https://github.com/npoliciano/TMDB-iOS/assets/119764048/3ea5618a-8b79-4ee4-be2e-6ff7740e5efc) |  


| Movie list - Dark Mode| Selected Section Movie List - Dark Mode| Movie Details - Dark Mode|
|---|---|---|
| ![Dark Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 49 24](https://github.com/npoliciano/TMDB-iOS/assets/119764048/e67cf646-9533-413f-a317-0b0fcf4f0729) | ![Dark Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 49 20](https://github.com/npoliciano/TMDB-iOS/assets/119764048/bae87e5e-7dac-4790-b6d3-70e7a3f10847) | ![Dark Simulator Screenshot - iPhone 15 - 2024-03-31 at 15 49 36](https://github.com/npoliciano/TMDB-iOS/assets/119764048/12d4acaf-804e-44c1-82c5-6129158e0da8) |


![Landscape](https://github.com/npoliciano/TMDB-iOS/assets/119764048/2513c211-a106-4c32-ba61-b814fedfdf19)


### Known issues

- All the screens hit the API every time it appears. To save resources, an implementation like UIKit's `viewDidLoad` is needed as it would hit the API only once, when the view is loaded.
- It is known that `LazyVGrid` is recommended when a large amount of data needs to be presented. However, this approach was not performing well. The view was hiccupping so a regular `GridView` was applied to solve this issue temporarily. A better solution for this could be an `UICollectionView`.
