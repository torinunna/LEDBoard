//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by YUJIN KWON on 2022/08/25.
//

import UIKit

protocol SettingDelegate: AnyObject {
    func changeDisplay(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    weak var delegate: SettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurreView()
    }
    
    private func configurreView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    @IBAction func textColorPressed(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func backgroudColorPressed(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.orangeButton {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        } else {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        self.delegate?.changeDisplay(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
    }
}
