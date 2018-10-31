//
//  RegisterView.swift
//  worktime
//
//  Created by Denis Nascimento on 30/10/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import Foundation

protocol RegisterView {
    func completed(time: String)
    func updateLabelWithTime(time: String)
    func messageError(message: String)
}
