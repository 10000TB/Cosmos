//
//  TegStarRating.swift
//  star-rating-view
//
//  Created by Evgenii Neumerzhitckii on 28/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class TegStarRating {
  class func createStarLayers(raiting: Double, settings: TegStarRatingSettings) -> [CALayer] {

    var ratingRemander = numberOfFilledStars(raiting)

    var starLayers = [CALayer]()

    for starNumber in (0..<settings.numberOfStars) {
      ratingRemander--

      let fillLevel = starFillLevel(ratingRemander, starFillMode: settings.starFillMode)
      let starLayer = createCompositeStarLayer(fillLevel, settings: settings)
      starLayers.append(starLayer)
    }

    positionStarLayers(starLayers, marginBetweenStars: settings.marginBetweenStars)
    return starLayers
  }

  private class func createCompositeStarLayer(starFillLevel: Double,
    settings: TegStarRatingSettings) -> CALayer {

    if starFillLevel >= 1 {
      return createStarLayer(true, settings: settings)
    }
      
    if starFillLevel == 0 {
      return createStarLayer(false, settings: settings)
    }
      
    return createHalfStar(starFillLevel, settings: settings)
  }

  
  private class func createHalfStar(starFillLevel: Double, settings: TegStarRatingSettings) -> CALayer {
    let filledStar = createStarLayer(true, settings: settings)
    let emptyStar = createStarLayer(false, settings: settings)

    let parentLayer = CALayer()
    parentLayer.contentsScale = UIScreen.mainScreen().scale
    parentLayer.bounds = CGRect(origin: CGPoint(), size: emptyStar.bounds.size)
    parentLayer.anchorPoint = CGPoint()
    parentLayer.addSublayer(filledStar)
    parentLayer.addSublayer(emptyStar)
    
    // make filled layer width smaller according to fill level
    filledStar.bounds.size.width *= CGFloat(starFillLevel)
    
    return parentLayer
  }
  
  // Returns a number between 0 and 1 describing the star fill level.
  // 1 is a fully filled star. 0 is an empty star. 0.5 is a half-star.
  private class func starFillLevel(ratingRemainder: Double, starFillMode: TegStarFillMode) -> Double {
    var result = ratingRemainder + 1
    if result > 1 { result = 1 }
    if result < 0 { result = 0 }
    
    if starFillMode == TegStarFillMode.Precise {
      return correctFillLevelToCompensateForTheFactThatStarIsNotOneHundredPercentWide(result)
    }
    
    if starFillMode == TegStarFillMode.Full {
      result = Double(round(result))
    }
    
    if starFillMode == TegStarFillMode.Half {
      result = Double(round(result * 2) / 2)
    }
  
    return result
  }
  
  private class func correctFillLevelToCompensateForTheFactThatStarIsNotOneHundredPercentWide(fillLevel: Double) -> Double {
    if fillLevel >= 0 && fillLevel <= 1 {
      return 3.0 / 5.0 * fillLevel + 1.0 / 5.0
    }
    
    return fillLevel
  }
  
  private class func createStarLayer(isFilled: Bool, settings: TegStarRatingSettings) -> CALayer {
    let text = isFilled ? settings.starCharacterFilled : settings.starCharacterEmpty
    let color = isFilled ? settings.starColorFilled : settings.starColorEmpty

    return TegStarRaitingLayerHelper.createTextLayer(text, font:settings.starFont, color: color)
  }

  private class func numberOfFilledStars(rating: Double) -> Double {
    var stars = rating

    if stars > 5 { stars = 5 }
    if stars < 0 { stars = 0 }

    return stars
  }

  private class func positionStarLayers(layers: [CALayer], marginBetweenStars: CGFloat) {
    var positionX:CGFloat = 0

    for layer in layers {
      layer.position.x = positionX
      positionX += layer.bounds.width + marginBetweenStars
    }
  }
}
