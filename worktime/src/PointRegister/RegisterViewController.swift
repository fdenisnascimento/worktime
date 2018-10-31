//
//  ViewController.swift
//  worktime
//
//  Created by Denis Nascimento on 30/10/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var presenter : RegisterPresenter?
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }
    
    func setupPresenter() {
        presenter = RegisterPresenterImpl()
        presenter?.attachView(view: self)
        presenter?.startClock()
    }
    
    @IBAction func registerTime(_ sender: Any) {
        presenter?.sendRegister(time: dateTextField.text!)
    }
    
}

extension RegisterViewController : RegisterView {
    func messageError(message: String) {
        AlertView.showMessage(targetVC: self, title: "Work Time", message: message) { (index) in
            
        }
    }
    
    func updateLabelWithTime(time: String) {
        clockLabel.text = time
    }
    
    func completed(time: String) {
     
    }
}

