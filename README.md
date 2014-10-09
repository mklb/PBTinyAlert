# PBTinyAlert

[![CI Status](http://img.shields.io/travis/mklb/PBTinyAlert.svg?style=flat)](https://travis-ci.org/mklb/PBTinyAlert)
[![Version](https://img.shields.io/cocoapods/v/PBTinyAlert.svg?style=flat)](http://cocoadocs.org/docsets/PBTinyAlert)
[![License](https://img.shields.io/cocoapods/l/PBTinyAlert.svg?style=flat)](http://cocoadocs.org/docsets/PBTinyAlert)
[![Platform](https://img.shields.io/cocoapods/p/PBTinyAlert.svg?style=flat)](http://cocoadocs.org/docsets/PBTinyAlert)

PBTinyAlert is a tiny, lightweight, and customizable notification view for your iOS portrait app. It uses the [Facebook Pop Framework][pop] for fluid and fancy animations.

  [pop]: https://github.com/facebook/POP

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. If you want to customize, copy the source files directly into your project.

![PBTinyAlert Demo Gif](https://raw.githubusercontent.com/mklb/PBTinyAlert/master/PBTinyAlert.gif)

## Usage

It’s easy as pie:

```objective-c
PBTinyAlert *myAlert = [PBTinyAlert withTitle:@"Try again"
                                      Message:@"Super swift message"
                              BackgroundColor:nil
                                    TextColor:nil
                                       Effect:PBFillEffect];
[myAlert showAndHideIn:3.f];
```

## PBTinyAlert methods

All method names should speak for themselves:

```objective-c
-(void)show;
-(void)showWithVibration;
-(void)showAndHideIn:(float)seconds;
-(void)showWithVibrationAndHideIn:(float)seconds;
-(void)hide;
-(void)vibrate;
```


## Installation

PBTinyAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

    pod "PBTinyAlert"

## Setup

- You need include `AudioToolbox` in your project
- Facebook Pop is already included as a dependency

## License

PBTinyAlert is available under the MIT license. See the LICENSE file for more info.
