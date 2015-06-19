
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
  
  Defines how the star should appear to be filled when the rating value is not an integer value.
  
  */
  static let starFillMode = StarFillMode.Half
  
  /// Distance between stars expressed. The value is automatically calculated based on marginBetweenStarsRelativeToFontSize property and the font size.
  static let marginBetweenStars:CGFloat = 0
  
  /**
  
  Distance between stars expressed as a fraction of the font size. For example, if the font size is 12 and the value is 0.25 the distance will be 4.
  
  */
  static let marginBetweenStarsRelativeToFontSize = 0.1
  
  /// The font used to draw the star character
  static let starFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
  
  /// Character used to show a filled star
  static let textFilled = "★"
  
  /// Character used to show an empty star
  static let textEmpty = "☆"
  
  /// Filled star color
  static let starColorFilled = UIColor(red: 1, green: 149/255, blue: 0, alpha: 1)
  
  /// Empty star color
  static let starColorEmpty = UIColor(red: 1, green: 149/255, blue: 0, alpha: 1)
  
  /// Font for the text
  static let textFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
  
  /// Color of the text
  static let textColor = UIColor.grayColor()
  
  /// Distance between the text and the star. The value is automatically calculated based on marginBetweenStarsAndTextRelativeToFontSize property and the font size.
  static let marginBetweenStarsAndText: CGFloat = 0
  
  /**
  
  Distance between the text and the star expressed as a fraction of the font size. For example, if the font size is 12 and the value is 0.25 the margin will be 4.
  
  */
  static let marginBetweenStarsAndTextRelativeToFontSize = 0.25
  
  /**
  
  When true the fill level is corrected to appear more gradual for default characters ★ and ☆. Applied only for precise star fill level.
  
  */
  static let correctFillLevelForPreciseMode = true
}
