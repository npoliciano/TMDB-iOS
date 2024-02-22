#  TMDB

### Known issues

- All the screens hit the API every time it appears. To save resources, an implementation like UIKit's `viewDidLoad` is needed as it would hit the API only once, when the view is loaded.
- It is known that `LazyVGrid` is recommended when a large amount of data needs to be presented. However, this approach was not performing well. The view was hiccupping so a regular `GridView` was applied to solve this issue temporarily. A better solution for this could be an `UICollectionView`.
