//
//  SideMenuViewController.swift
//  TestAppWithStoryboard
//
//  Created by Shawn Frank on 22/01/2022.
//

import UIKit

protocol SideMenuViewControllerDelegate
{
    func updateValueInMain()
}

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var currentVal = 0
    
    var delegate: SideMenuViewControllerDelegate?
    
    @IBAction func sendMessageToMain(_ sender: Any)
    {
        delegate?.updateValueInMain()
    }
}

extension SideMenuViewController: MainViewControllerDelegate
{
    func updateValueInSideMenu()
    {
        currentVal += 1
        
        messageLabel.text = "Message from main: \(currentVal)"
    }
}
