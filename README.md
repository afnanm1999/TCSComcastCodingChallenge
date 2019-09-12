# TCS - ComcastCodingChallenge

### Features

- Lists All of the Character Names in a `UITableView` on the `MainViewController`.
- Uses `SplitViewController` to make the app accessable on an iPad.
- Two Different Varients of the application which use a shared Codebase.
- Create a Singleton for `APIHelper.swift` to make it easier to call network functions 
- Uses MVVM Design Pattern.

### Technical Specifications

- Xcode Version: <a href="https://developer.apple.com/documentation/xcode_release_notes/xcode_10_3_release_notes" target="_blank">10.3</a><br/>
- Design Pattern: <a href="https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel" target="_blank">MVVM</a>

### Dependencies

I avoided implementing any Dependencies in order to help Interviewers save some time. 

## Challenge

You can find the entire [Instructions Here](https://github.com/afnanm1999/TCSComcastCodingChallenge/blob/master/ChallengeInstructions.pdf)

### Challenge Requirements Checklist

- [x] Comprised of two parts, a list and a detail.
- [x] On Phones, the list and detail should be separate screens, on Tablets, list and detail should appear on the same screen
- [x] For the list view, data should be displayed as a text only, vertically scrollable list of character names
- [x] The app should offer search functionality that filters the character list according to characters whose titles or descriptions contain the query text
- [x] Clicking on an item should load the detail view of that character, including the character’s image, title, and description.
- [x] For the image in the detail view, use the URL in the "Icon" field of the API JSON response. For items with blank or missing image URLs, use a placeholder image
- [x] Two variants of the app should be created, using a single shared codebase
- [x] Each variant should have a different name, package-name, and url that it pulls data from
- [x] Consider custom cells instead of storyboard.
- [x] Follow MVVM Design Pattern
- [x] Strong network framework

### Personal Checklist

- [x] Cleanup `APIHelper.swift` file
- [x] Document Code
- [x] Reorganize Some code
- [ ] Reduce Clutter
- [ ] Cleanup View Models

### How to use the app

In order to test the app, project files need to be opened in Xcode 10.3<br/>
After the project has been opened successfully in Xcode click on the Schemes tab and select either `SimpsonsCharacterViewer` or `TheWireCharacterViewer`. You can now run the application on a device of your choice. Depending on which scheme you chose the API will change between "http://api.duckduckgo.com/?q=simpsons+characters&format=json" & "http://api.duckduckgo.com/?q=the+wire+characters&format=json". 

### Other

Please feel free to contact me at anytime if you have any questions.
