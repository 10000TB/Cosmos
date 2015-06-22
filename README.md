🔨🔨🔨 This is work in progress 🔨🔨🔨

# Cosmos, a star rating control for iOS / Swift

<img src='https://raw.githubusercontent.com/exchangegroup/Star/master/graphics/star_screenshot.png' alt='Star raiting control for iOS / Swift' width='250'>

This is a UI control for iOS for showing a 5-star rating or taking the rating input from the user. Cosmos is a subclass of a UIView.

* Shows star rating with an optional text label.
* Can be used as a rating input control.
* Cosmos view can be customized in the Storyboard without writing code.
* Includes different star filling modes: full, half-filled and precise.

<img src='https://raw.githubusercontent.com/exchangegroup/Star/master/graphics/Drawings/1280px-Sirius_A_and_B_artwork.jpg'
  alt="Binary star system of Sirius A and Sirius B (artist's impression)" width='450'>

> We are a way for the cosmos to know itself.

**Carl Sagan, Cosmos.**

*Picture of binary star system of Sirius A and Sirius B by [NASA](http://www.nasa.gov), [ESA](http://www.esa.int/ESA) and G. Bacon ([STScI](http://www.stsci.edu/portal/)). Source: [spacetelescope.org](http://www.spacetelescope.org/images/heic0516b/).*

## Setup

There are three ways you can add Cosmos to your Xcode project.

**Add source (iOS 7+)**

Simply add [CosmosDistrib.swift](https://github.com/exchangegroup/Cosmos/edit/master/Distrib/CosmosDistrib.swift) file into your Xcode project.

**Setup with Carthage (iOS 8+)**

Alternatively, add `github "exchangegroup/Cosmos" ~> 1.0` to your Cartfile and run `carthage update`.

**Setup with CocoaPods (iOS 8+)**

If you are using CocoaPods add this text to your Podfile and run `pod install`.

    use_frameworks!
    pod 'Cosmos', '~> 1.0'

## Usage

1. Add `import Cosmos` to your source code if you used Carthage or CocoaPods setup methods.

2. Add `View` control into your storyboard. Set its class to `CosmosView` in the *identity inspector*. Set its *module* property to `Cosmos` if you did Carthage or CocoaPods setup.

3. Customize the Cosmos view appearance in the *attributes inspector*.

<img src='https://raw.githubusercontent.com/exchangegroup/Cosmos/master/graphics/cosmos_storyboard_class_3.png' width='259' alt='Add Cosmos rating view to the storyboard'>

<img src='https://raw.githubusercontent.com/exchangegroup/Cosmos/master/graphics/cosmos_customize_in_storyboard.png' width='480' alt='Customize cosmos appearance in the attributes inspector in Xcode.'>

## Using Cosmos in code

You can also style and control the Cosmos view from your code by creating an outlet from the storyboard into your view controller or by creating a new instance of `CosmosView` class.

```Swift
// Change the cosmos view rating
cosmosView.rating = 4

// Change the text
cosmosView.text = "(123)"

```


## Customization

Customization can be made by changing `settings` properties. For example:

```
ratingView.settings.starColorFilled = UIColor.blackColor()
ratingView.settings.starFillMode = TegStarFillMode.Precise
```

## Demo app

This project includes a demo iOS app.

<img src='https://raw.githubusercontent.com/exchangegroup/Star/master/graphics/start-rating-view-ios-swift.png' alt='five star rating control for iOS written in Swift' width='320' >

## Alternative solutions

Here are some other star rating controls for iOS:

* [danwilliams64/DJWStarRatingView](https://github.com/danwilliams64/DJWStarRatingView)
* [dlinsin/DLStarRating](https://github.com/dlinsin/DLStarRating)
* [dyang/DYRateView](https://github.com/dyang/DYRateView)
* [erndev/EDStarRating](https://github.com/erndev/EDStarRating)
* [hugocampossousa/HCSStarRatingView](https://github.com/hugocampossousa/HCSStarRatingView)
* [strekfus/FloatRatingView](https://github.com/strekfus/FloatRatingView)
* [yanguango/ASStarRatingView](https://github.com/yanguango/ASStarRatingView)

## License

Star is released under the [MIT License](LICENSE).