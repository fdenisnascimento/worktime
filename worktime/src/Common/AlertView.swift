//
//  AlertView.swift
//  worktime
//
//  Created by Denis Nascimento on 30/10/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import Foundation
import UIKit

class AlertView {
    
    class  func showMessage(targetVC: UIViewController,  message: String!){
        AlertView.showMessage(targetVC: targetVC, title: "Work Time", message: message)
    }
    
    
    class  func showMessage(targetVC: UIViewController, title: String!, message: String!){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
        })))
        
        targetVC.present(alert, animated: true, completion: nil)
    }
    
    class  func showMessage(targetVC: UIViewController, title: String!, message: String!, completion: @escaping (_ buttomIndex: Int)->()){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction((UIAlertAction(title: "NÃO", style: .default, handler: {(action) -> Void in
            completion(0)
        })))
        
        alert.addAction((UIAlertAction(title: "SIM", style: .default, handler: {(action) -> Void in
            completion(1)
        })))
        
        targetVC.present(alert, animated: true, completion: nil)
    }
    
  
}
