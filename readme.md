<!-- title -->

# KPCameraButtonClone

<!-- /title -->

<!-- badges -->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit)

<!-- /badges -->

<!-- short-description -->

**Slavish reimplementation of the shape-morphing shutter button in Camera.app.**

<!-- /short-description -->

## Overview

KPCameraButtonClone provides `KPCameraButton`, a [`UIButton`](https://developer.apple.com/documentation/uikit/uibutton) subclass that mimics the shutter button in Apple's Camera.app. The center of the button animates between a white circle for photos, a red circle for video, and a red rounded square while recording.

It's packaged as a [CocoaPods](https://cocoapods.org) pod, and was written in 2014 for iOS 7.

## Getting started

### Dependencies

KPCameraButtonClone requires iOS 7.0 or newer and ARC. It only uses UIKit and Core Animation.

It was written with Xcode 5.1 and CocoaPods 0.29.0. The `KPCameraButton` class also compiles without warnings against the iOS 26.2 SDK in Xcode 26.3.

### Installation

KPCameraButtonClone isn't published to the CocoaPods trunk, so point your [Podfile](https://guides.cocoapods.org/using/the-podfile.html) at this repository:

```ruby
pod 'KPCameraButtonClone', :git => 'https://github.com/kitschpatrol/KPCameraButtonClone.git'
```

Then run `pod install`.

Alternatively, copy `Classes/KPCameraButton.h` and `Classes/KPCameraButton.m` into your project.

## Usage

Create a `KPCameraButton` in code, or set it as the custom class of a button in Interface Builder (the example project does this). Then set its `cameraButtonMode`:

```objc
#import "KPCameraButton.h"

// -init creates a 66 × 66 point button, the size of the shutter button in Camera.app
KPCameraButton *cameraButton = [[KPCameraButton alloc] init];
cameraButton.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
[cameraButton addTarget:self action:@selector(didTouchCameraButton:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:cameraButton];

// Setting the mode animates the change
cameraButton.cameraButtonMode = KPCameraButtonModeVideoReady;
```

| Mode                               | Center of the button       |
| ---------------------------------- | -------------------------- |
| `KPCameraButtonModePhoto`          | White circle. The default. |
| `KPCameraButtonModeVideoReady`     | Red circle.                |
| `KPCameraButtonModeVideoRecording` | Red rounded square.        |

The button doesn't change modes when it's tapped. Handle its touch event and set the next mode yourself, as the example does to switch between ready and recording.

The ring and the photo-mode center are white, so the button needs a dark background.

## Examples

### CameraButtonClone

The `Example` project shows the button on a black background, with a segmented control for switching between the three modes. In either video mode, tapping the button toggles between ready and recording.

To run the example project, clone the repo, and run `pod install` from the Example directory first. Then open `Example/CameraButtonClone.xcworkspace` in Xcode.

```sh
git clone https://github.com/kitschpatrol/KPCameraButtonClone.git
cd KPCameraButtonClone/Example
pod install
open CameraButtonClone.xcworkspace
```

The example's Podfile predates CocoaPods 1.0, so `pod install` fails with current versions of CocoaPods. (See [Known issues](#known-issues).)

## Background

### Implementation notes

The ring and the center of the button are `CAShapeLayer`s. Changing modes animates the center layer's `fillColor` and `path` with `CABasicAnimation`. All dimensions are proportional to the default 66 point size.

`[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]` doesn't path-tween cleanly between a circle and a rounded square, so `KPCameraButton` draws both shapes with the same sequence of curves and lines. The circle is a rounded square with a corner radius of half its width. The curve handles are offset by the corner radius times 0.4476666667, which a comment in the source calls "Apple's variation on 'Kappa?'", referring to the constant discussed in [Bezier Paths: making rectangles with rounded corners](https://nacho4d-nacho4d.blogspot.com/2011/05/bezier-paths-rounded-corners-rectangles.html).

While the button is highlighted, its center fades to 20% opacity.

### Known issues

- The shape helper only works for squares, so the button's width and height must be equal.
- The layers are sized once when the button is created. Changing the button's frame afterwards doesn't resize them.
- `setHighlighted:` tracks the previous highlight state in a `static` variable that's shared by every instance, so when two buttons are highlighted at the same time, one of them skips its highlight animation.
- `setEnabled:` calls `setNeedsDisplay`, but the button doesn't implement `drawRect:`, so a disabled button looks the same as an enabled one.
- The ring's path from `CGPathCreateWithEllipseInRect` is never released, which leaks a small amount of memory for each button.
- The example's Podfile and its checked-in `Pods` directory were generated by CocoaPods 0.29.0. With CocoaPods 1.14.3, `pod install` fails with "The abstract target Pods must specify a platform since its dependencies are not inherited by a concrete target."
- The example's test target only contains Xcode's template test, which always fails.

## Maintainers

[kitschpatrol](https://github.com/kitschpatrol)

<!-- contributing -->

## Contributing

[Issues](https://github.com/kitschpatrol/KPCameraButtonClone/issues) are welcome and appreciated.

Please open an issue to discuss changes before submitting a pull request. Unsolicited PRs (especially AI-generated ones) are unlikely to be merged.

This repository uses [MDAT](https://github.com/kitschpatrol/mdat) for readme placeholder expansion.

<!-- /contributing -->

<!-- license -->

## License

[MIT](license.txt) © [Eric Mika](https://ericmika.com)

<!-- /license -->
