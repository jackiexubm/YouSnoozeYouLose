//
//  DismissAlarmController.swift
//  Speech match test
//
//  Created by Jackie Xu on 2/23/19.
//  Copyright © 2019 Jackie Xu. All rights reserved.
//

import Foundation
import UIKit

import Clarifai_Apple_SDK


class DismissAlarmController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = DismissAlarmView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @objc func takePicturePressed() {
        
        var concepts: [Concept] = []
        
        let dataAsset = DataAsset.init(image: Image(image: #imageLiteral(resourceName: "sink.jpg")))
        let input = Input.init(dataAsset:dataAsset)
        let inputs = [input]
        
        
        Clarifai.sharedInstance().generalModel.predict(inputs) { (outputs: [Output]?, error: Error?) in
            for output in outputs! {
                concepts.append(contentsOf:output.dataAsset.concepts!)
                
                for concept in concepts {
                    print(concept.name)
                }
            }
        }
        
        
        print("take picture")
    }
    
    @objc func snoozePressed() {
        
        print("snooze")
    }
    
    
}
