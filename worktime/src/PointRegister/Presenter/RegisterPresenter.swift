//
//  RegisterPresenter.swift
//  worktime
//
//  Created by Denis Nascimento on 30/10/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterPresenter {
    
    func attachView(view: RegisterView)
    func sendRegister(time: String)
    func startClock()
    
}

class RegisterPresenterImpl: RegisterPresenter {
    
    var view : RegisterView?
    
    func startClock(){
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(tick)), userInfo: nil, repeats: true)
    }
    
    func attachView(view: RegisterView) {
        self.view = view
    }
    
    func sendRegister(time: String) {
        if time.count <= 0 {
            self.view?.messageError(message: "Você não informou um horário, podemos comsiderar a hora atual?")
        }
    }
    
    @objc private func tick() {
        let time = DateFormatter.localizedString(from: Date(),
                                                dateStyle: .none,
                                                timeStyle: .medium)
        self.view?.updateLabelWithTime(time: time)
    }
    
}
