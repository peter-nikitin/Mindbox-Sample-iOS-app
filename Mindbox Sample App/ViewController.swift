//
//  ViewController.swift
//  Mindbox Sample App
//
//  Created by Никитин Петр on 21.06.2021.
//

import UIKit
import Mindbox

class ViewController: UIViewController {
    @IBOutlet weak var textLabel:UILabel?

    @IBOutlet weak var copyBtn: UIButton!
    
    @objc func copyUUID() {
        
        Mindbox.shared.getDeviceUUID{
            deviceUUID in let uuid = deviceUUID
            
            let pasteboard = UIPasteboard.general
            pasteboard.string = uuid
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        Mindbox.shared.getDeviceUUID{
            deviceUUID in self.textLabel?.text = deviceUUID
        }
        
        copyBtn.addTarget(self, action: #selector(self.copyUUID), for: .touchUpInside)
        
        
    }



       
    
}

