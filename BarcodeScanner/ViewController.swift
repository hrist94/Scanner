//
//  ViewController.swift
//  BarcodeScanner
//
//  Created by Kirill Khristenko on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btn(_ sender: UIButton) {
        
        SPQRCode.scanning(handled: { data, controller in
                    self.bindingData(data: data)
                    controller.dismiss(animated: true)
                }, on: self)
            }
            func bindingData(data: SPQRCodeData) {
                
                switch data {
                case .url(let uRL):
                    label.text = "\(uRL)"
                case .text(let string):
                    label.text = string
                case .ethWallet(let string):
                    print(string)
                }
                label.isHidden = false
                
    }
    
}

