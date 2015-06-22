import UIKit

/*

A star rating view that can be used to show customer rating for the products. On can select number of stars by tapping on them when updateOnTouch settings is true. An optional text can be supplied that is shown to the right from the stars.

Example:

    cosmosView.rating = 4
    cosmosView.text = "(123)"

Shows: ★★★★☆ (132)

*/
@IBDesignable public class CosmosView: UIView {
  // MARK: - Inspectable properties for storyboard
  
  /**
  
  The currently shown number of stars, usually between 1 and 5. If the value is decimal the stars will be shown according to the Fill Mode setting.

  */
  @IBInspectable public var rating: Double = StarRatingDefaultSettings.rating {
    didSet {      
      update()
    }
  }
  
  /// Currently shown text. Set it to nil to display just the stars without text.
  @IBInspectable public var text: String? {
    didSet {
      update()
    }
  }
  
  
  @IBInspectable var totalStars: Int = StarRatingDefaultSettings.totalStars {
    didSet { settings.totalStars = totalStars }
  }
  
  @IBInspectable var starSize: Double = StarRatingDefaultSettings.starSize {
    didSet {
      settings.starSize = starSize
    }
  }
  
  @IBInspectable var colorFilled: UIColor = StarRatingDefaultSettings.colorFilled {
    didSet { settings.colorFilled = colorFilled }
  }
  
  @IBInspectable var colorEmpty: UIColor = StarRatingDefaultSettings.colorEmpty {
    didSet { settings.colorEmpty = colorEmpty }
  }
  
  @IBInspectable var borderColorEmpty: UIColor = StarRatingDefaultSettings.borderColorEmpty {
    didSet { settings.borderColorEmpty = borderColorEmpty }
  }
  
  @IBInspectable var borderWidthEmpty: Double = StarRatingDefaultSettings.borderWidthEmpty {
    didSet { settings.borderWidthEmpty = borderWidthEmpty }
  }
  
  @IBInspectable var starMargin: Double = StarRatingDefaultSettings.starMargin {
    didSet { settings.starMargin = starMargin }
  }
  
  @IBInspectable var fillMode: Int = StarRatingDefaultSettings.fillMode.rawValue {
    didSet {
      settings.fillMode = StarFillMode(rawValue: fillMode) ?? StarRatingDefaultSettings.fillMode
    }
  }
  
  @IBInspectable var textSize: Double = StarRatingDefaultSettings.textSize {
    didSet {
      settings.textFont = settings.textFont.fontWithSize(CGFloat(textSize))
    }
  }
  
  @IBInspectable var textMargin: Double = StarRatingDefaultSettings.textMargin {
    didSet { settings.textMargin = textMargin }
  }
  
  @IBInspectable var textColor: UIColor = StarRatingDefaultSettings.textColor {
    didSet { settings.textColor = textColor }
  }
  
  @IBInspectable var updateOnTouch: Bool = StarRatingDefaultSettings.updateOnTouch {
    didSet { settings.updateOnTouch = updateOnTouch }
  }
  
  @IBInspectable var minTouchRating: Double = StarRatingDefaultSettings.minTouchRating {
    didSet { settings.minTouchRating = minTouchRating }
  }
  
  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    update()
  }
  
  /// Star rating settings.
  public var settings = StarRatingSettings()
  
  /// Stores calculated size of the view. It is used as intrinsic content size.
  private var viewSize = CGSize()

  /**
  
  Updates the stars and optional text based on current values of `rating` and `text` properties.
  
  */
  public func update() {
    // Create star layers
    // ------------
    
    var layers = CosmosLayers.createStarLayers(rating, settings: settings)
    layer.sublayers = layers
    
    // Create text layer
    // ------------

    if let text = text {
      let textLayer = createTextLayer(text, layers: layers)
      layers.append(textLayer)
    }
    
    // Update size
    // ------------

    updateSize(layers)
  }
  
  /**
  
  Creates the text layer for the given text string.
  
  - parameter text: Text string for the text layer.
  - parameter layers: Arrays of layers containing the stars.
  
  - returns: The newly created text layer.
  
  */
  private func createTextLayer(text: String, layers: [CALayer]) -> CALayer {
    let textLayer = StarRatingLayerHelper.createTextLayer(text,
      font: settings.textFont, color: settings.textColor)
    
    let starsSize = StarRatingSize.calculateSizeToFitLayers(layers)
    
    StarRatingText.position(textLayer, starsSize: starsSize, textMargin: settings.textMargin)
    
    layer.addSublayer(textLayer)
    
    return textLayer
  }
  
  /**

  Updates the size to fit all the layers containing stars and text.
  
  - parameter layers: Array of layers containing stars and the text.

  */
  private func updateSize(layers: [CALayer]) {
    viewSize = StarRatingSize.calculateSizeToFitLayers(layers)
    invalidateIntrinsicContentSize()
  }
  
  /// Returns the content size to fit all the star and text layers.
  override public func intrinsicContentSize() -> CGSize {
    return viewSize
  }
  
  
  // MARK: - Touch recognition
  
  /// Closure will be called when user touches the star view. The touch rating argument is passed to the closure.
  public var touchedTheStar: ((Double)->())?
  
  /// Overriding the function to detect the first touch gesture.
  public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)
    
    if let touch = touches.first {
      let location = touch.locationInView(self).x
      onDidTouch(location, starsWidth: widthOfStars)
    }
  }
  
  /// Overriding the function to detect touch move.
  public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesMoved(touches, withEvent: event)
    
    if let touch = touches.first {
      let location = touch.locationInView(self).x
      onDidTouch(location, starsWidth: widthOfStars)
    }
  }

  /**

  Called when the view is touched.

  - parameter locationX: The horizontal location of the touch relative to the width of the stars.
  
  - parameter starsWidth: The width of the stars excluding the text.
  
  */
  func onDidTouch(locationX: CGFloat, starsWidth: CGFloat) {
    let calculatedTouchRating = StarTouch.touchRating(locationX, starsWidth: starsWidth,
      settings: settings)
    
    if settings.updateOnTouch {
      rating = calculatedTouchRating
      update()
    }
    
    touchedTheStar?(calculatedTouchRating)
  }
  
  
  /// Width of the stars (excluding the text). Used for calculating touch location.
  var widthOfStars: CGFloat {
    if let sublayers = self.layer.sublayers where settings.totalStars <= sublayers.count {
      let starLayers = Array(sublayers[0..<settings.totalStars])
      return StarRatingSize.calculateSizeToFitLayers(starLayers).width
    }
    
    return 0
  }
  
  /// Increase the hitsize of the view if it's less than 44px for easier touching.
  override public func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
    let oprimizedBounds = CosmosTouchTarget.optimize(bounds)
    return oprimizedBounds.contains(point)
  }
}
