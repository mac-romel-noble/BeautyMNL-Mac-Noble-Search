![alt coverphoto](https://github.com/mac-romel-noble/BeautyMNL-Mac-Noble-Search/blob/main/search%20mockup.jpeg)

# BeautyMnl-Mac-Noble
BeautyMnl assessment code exam for Mac Romel Noble

## Design Pattern Used
### MVVM
* Used on a couple of components to separate the logic from the UI thus making it reusable. Can also be helpful to reduce clutter in the controllers.

### Coordinator pattern
* Used for navigating the UI. As much as possible, UI components should not be aware of other UI components for more modularity and encapsulation of scope.

## Dependencies
### `LBTATools`
* Contains extensions and classes to speed up UI development
* I programmatically created the UI for this project to showcase my understanding of how UIKit works.

### `Kingfisher`
* Provides easy loading of images from the web.
* Configure placeholder
* Lazily load images on scroll
* Auto caching of images

### `RxSwift`
* Powerful tool for reactive programming but in this project used simply to debounce keystrokes from the searchbar.

## Notable features
* Clean UI
* Localized formats for prices and dates
* Video playback of movie trailers
