//
//  DismissAlarmView.swift
//  Speech match test
//
//  Created by Jackie Xu on 2/23/19.
//  Copyright © 2019 Jackie Xu. All rights reserved.
//

import UIKit

class DismissAlarmView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupViews()
        
    }
    
    let words: UITextView = {
        let words: UITextView = UITextView()
        words.text = "Take a picture of your sink to be exempt from today's payment to Mark"
        words.font = UIFont(name: "HelveticaNeue-Thin", size: 36)
        words.textColor = UIColor.darkGray
        words.sizeToFit()
        words.backgroundColor = UIColor.white
        words.isEditable = false
        words.isScrollEnabled = false
        
        
        words.translatesAutoresizingMaskIntoConstraints = false
        return words
    }()
    
    let takePicture: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Take picture", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
        
        button.addTarget(self, action: #selector(DismissAlarmController.takePicturePressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let words2: UITextView = {
        let words: UITextView = UITextView()
        words.text = "... or hit snooze and pay"
        words.font = UIFont(name: "HelveticaNeue-Thin", size: 36)
        words.textColor = UIColor.darkGray
        words.sizeToFit()
        words.backgroundColor = UIColor.white
        words.isEditable = false
        words.isScrollEnabled = false
        
        
        words.translatesAutoresizingMaskIntoConstraints = false
        return words
    }()
    
    let snoozeButton: UIButton = {
        let button: UIButton = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        button.backgroundColor = UIColor.darkGray
        button.setTitle("Snooze", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 26)

        
        button.addTarget(self, action: #selector(DismissAlarmController.snoozePressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    func setupViews() {
        addSubview(words)
        addSubview(takePicture)
        addSubview(snoozeButton)
        addSubview(words2)

        addConstraintsWithString("H:|-10-[v0]-10-|")
        addConstraintsWithString("H:|-10-[v3]-10-|")
        addConstraintsWithString("V:|-60-[v0]-25-[v1(70)]-45-[v3]-25-[v2(70)]")
        
        addConstraintsWithString("H:[v1(200)]")
        addConstraintsWithString("H:[v2(200)]")
        (takePicture).centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        (snoozeButton).centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
    }
    
    func addConstraintsWithString(_ str:String){
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: str, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:[
            "v0":words,
            "v1":takePicture,
            "v2":snoozeButton,
            "v3":words2
            ]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
