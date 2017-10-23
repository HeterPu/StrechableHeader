StrechableHeader
==============
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/HeterPu/StrechableHeader/blob/master/LICENSE)&nbsp;
[![CocoaPods](https://img.shields.io/badge/pod-1.1.0-blue.svg)](https://cocoapods.org)&nbsp;
[![Platform](https://img.shields.io/badge/platform-iOS-lightgray.svg)](https://cocoapods.org)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;


A light strechable header for UIScrollview， UITableview ，UICollectionView，


Demo Project
==============
See `StrechableHeaderDemo/StrechableHeaderDemo.xcodeproj`

<img src="https://raw.github.com/HeterPu/StrechableHeader/master/screenshots/1.PNG" width="760"><br/>
<img src="https://raw.github.com/HeterPu/StrechableHeader/master//screenshots/2.PNG" width="760">


Installation
==============

### CocoaPods

1. Add `pod 'StrechableHeader'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import "UIScrollView+StrechableHeader.h".


ONLY TWO STEPS:


1.SET HEADER
[self.collectionView setStrechHeader:[self header]
withNaviBarHidden:self.navigationController.navigationBar.isHidden];

2.UPDATE HEADER
[self.collectionView updateStrechHeader];

Requirements
==============
This library requires `iOS 6.0+` and `Xcode 6.0+`.


License
==============
StrechableHeader is provided under the MIT license. See LICENSE file for details.
