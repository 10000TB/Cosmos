
/**

Defaults setting values.

*/
struct StarRatingDefaultSettings {
  init() {}
  
  /// Raiting value that is shown in the storyboard by default.
  static let rating: Double = 3.5
  
  /// The total number of start to be shown.
  static let totalStars = 5

  /**

  Defines how the star is filled when the rating value is not an integer value. It can either show full stars, half stars or stars partially filled according to the rating value.

  */
  static let fillMode = StarFillMode.Half
  
  /// Distance between stars.
  static let starMargin: Double = 5
  
  /// Size of the star.
  static var starSize: Double = 20
  
  /// Filled star color
  static let colorFilled = UIColor(red: 1, green: 149/255, blue: 0, alpha: 1)
  
  /// Empty star color
  static let colorEmpty = UIColor.clearColor()
  
  /// Border color of an empty star.
  static let borderColorEmpty = UIColor(red: 1, green: 149/255, blue: 0, alpha: 1)
  
  /// Width of the border for the empty star.
  static let borderWidthEmpty: Double = 1
  
  /// Font for the text
  static let textFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
  
  
  /// Calculates the size of the default text font.
  static var textSize: Double {
    get {
      return Double(textFont.pointSize)
    }
  }
  
  /// Color of the text
  static let textColor = UIColor.grayColor()
  
  /// Distance between the text and the star. The value is automatically calculated based on marginBetweenStarsAndTextRelativeToFontSize property and the font size.
  static let marginBetweenStarsAndText: CGFloat = 0
  
  /// Distance between the text and the star
  static let textMargin: Double = 5
  
  /**
  
  Points for drawing the star. Size is 100 by 100 pixels. Supply your points if you need to draw a different shape.
  
  */
  static let starPoints: [CGPoint] = [
    CGPoint(x: 49.5,  y: 0.0),
    CGPoint(x: 60.5,  y: 35.0),
    CGPoint(x: 99.0, y: 35.0),
    CGPoint(x: 67.5,  y: 58.0),
    CGPoint(x: 78.5,  y: 92.0),
    CGPoint(x: 49.5,    y: 71.0),
    CGPoint(x: 20.5,  y: 92.0),
    CGPoint(x: 31.5,  y: 58.0),
    CGPoint(x: 0.0,   y: 35.0),
    CGPoint(x: 38.5,  y: 35.0)
  ]
}
