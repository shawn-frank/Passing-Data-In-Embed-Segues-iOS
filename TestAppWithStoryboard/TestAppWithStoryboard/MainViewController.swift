//
//  MainViewController.swift
//  TestAppWithStoryboard
//
//  Created by Shawn Frank on 22/01/2022.
//

import UIKit

protocol MainViewControllerDelegate
{
    func updateValueInSideMenu()
}

class MainViewController: UIViewController
{
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Container views"
    }
    
    var currentVal = 0
    
    var delegate: MainViewControllerDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ToSideBarVC"
        {
            let sideMenuVC = segue.destination as! SideMenuViewController
            sideMenuVC.delegate = self
            delegate = sideMenuVC
        }
    }
    
    @IBAction func sendMessageToContainer(_ sender: Any)
    {
        delegate?.updateValueInSideMenu()
    }
}

extension MainViewController: SideMenuViewControllerDelegate
{
    func updateValueInMain()
    {
        currentVal += 1
        
        messageLabel.text = "Message from container: \(currentVal)"
    }
}
