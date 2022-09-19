//
//  ViewController.swift
//  AnimationView
//
//  Created by Shubham Ramani on 19/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    static let cardCornerRadius: CGFloat = 25
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segueIdentifier(for: segue) == .reveal,
        let destinationViewController = segue.destination as? RevealViewController {
    
        destinationViewController.transitioningDelegate = self
      }
    }
    @IBAction func handleTap() {
      performSegue(withIdentifier: .reveal, sender: nil)
    }
}

extension ViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case reveal
  }
}

extension ViewController: UIViewControllerTransitioningDelegate {

func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
  
  return FlipPresentAnimationController(originFrame: cardView.frame)
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
  guard let revealVC = dismissed as? RevealViewController else {
    return nil
  }
  return FlipDismissAnimationController(destinationFrame: cardView.frame, interactionController: revealVC.swipeInteractionController)
}

func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
  guard let animator = animator as? FlipDismissAnimationController,
    let interactionController = animator.interactionController,
    interactionController.interactionInProgress
  else {
    return nil
  }
  return interactionController
}
}
