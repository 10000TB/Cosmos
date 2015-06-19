import UIKit
import Star

class ViewController: UIViewController {
  
  @IBOutlet weak var startRatingWithFilledStyle: StarRatingView!
  
  @IBOutlet weak var starRatingViewHalf: StarRatingView!
  
  @IBOutlet weak var starRatingViewOne: StarRatingView!
  
  @IBOutlet weak var starRatingViewPrecise: StarRatingView!
  
  @IBOutlet weak var ratingSlider: UISlider!
  @IBOutlet weak var ratingLabel: UILabel!
  private let startRating:Float = 3.7
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ratingSlider.value = startRating
        
    updateRating()
  }
  
  private func updateLabel() {
    
  }
  
  @IBAction func onSliderChanged(sender: AnyObject) {
    updateRating()
  }
  
  private func updateRating() {
    let value = Double(ratingSlider.value)
    startRatingWithFilledStyle.show(rating: value)
    starRatingViewOne.show(rating: value)
    starRatingViewHalf.show(rating: value)
    starRatingViewPrecise.show(rating: value)
    
    self.ratingLabel.text = ViewController.formatValue(value)
  }
  
  private class func formatValue(value: Double) -> String {
    return String(format: "%.2f", value)
  }
}