# MaskedLabel
[![Version](https://img.shields.io/github/release/darincon/MaskedLabel.svg)](https://github.com/darincon/MaskedLabel/releases) ![Language](https://img.shields.io/badge/language-Swift%203-orange.svg) [![CocoaPods compatible](https://img.shields.io/cocoapods/v/MaskedLabel.svg)](https://cocoapods.org/pods/MaskedLabel) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) ![License](https://img.shields.io/github/license/darincon/MaskedLabel.svg?style=flat)

| Swift Version | MaskedLabel View Version |
| ------------- | ------------------------ |
| 3.1           | 0.9.0                    |

MaskedLabel is a UILabel subclass that allows you to easily apply a gradient to its text or to make it transparent.

![alt tag](/demo.gif)

## Installation
### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```
To integrate MaskedLabel into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'MaskedLabel', '~> 0.9.0'
end
```
Then, run the following command:

```
$ pod install
```

### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```
$ brew update
$ brew install carthage
```

To integrate MaskedLabel into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "MaskedLabel/MaskedLabel" ~> 0.9.0
```
Run `carthage` update to build the framework and drag the built `MaskedLabel.framework` into your Xcode project.

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate MaskedLabel into your project manually.

## Usage
MaskedLabel can be used both programmatically and with storyboards.

### Storyboards
Add a UILabel to your storyboard and change its class to MaskedLabel.

### Programatically
* Initialization without parameters

```swift
let maskedLabel = MaskedLabel()
```
* Initialization with frame

```swift
let maskedLabel = MaskedLabel(frame: CGRect(x: 10, y: 50, width: 200, height: 100))
```
### Setup
There are a few properties you can set to obtain the desired behavior:

* **gradientColors:** An array of UIColor that defines the gradient. If it contains only one element, it will be applied as start and end color. In case this property is nil or an empty array, the value of **fillColor** will be used instead.
* **gradientLocations:** The location for each color provided in components. Each location must be a CGFloat value in the range of 0 to 1, inclusive. If 0 and 1 are not in the locations array, Quartz uses the colors provided that are closest to 0 and 1 for those locations.
* **startPoint:** The coordinate that defines the starting point of the gradient.
* **endPoint:** The coordinate that defines the ending point of the gradient.
* **fillColor:** Set this property when a constant color is needed instead of a gradient. If both this property and gradientColors are set, this color is omitted and the gradient will be applied to the text. The default color is black.
* **fillOption:** A constant indicating if the gradient, or color, will be applied to the label's background, making the text transparent, or to the text.

#### Example

```swift
let maskedLabel = MaskedLabel()
maskedLabel.gradientColors = [UIColor.red, UIColor.blue]
maskedLabel.startPoint = CGPoint(x: 0.0, y: 0.0)
maskedLabel.endPoint = CGPoint(x: maskedLabel.frame.width, y: maskedLabel.frame.height)
maskedLabel.fillOption = .background
maskedLabel.text = "MaskedLabel"
```

## License
ViewControllerStates is released under the MIT license. See [license](/LICENSE) for details.
