
import UIKit

class RevealViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
 
var vc = ViewController()
  
//  var petCard: PetCard?
  var swipeInteractionController: SwipeInteractionController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    titleLabel.text = petCard?.name
//    imageView.image = petCard?.image
    swipeInteractionController = SwipeInteractionController(viewController: self)
  }
  
  @IBAction func dismissPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}

