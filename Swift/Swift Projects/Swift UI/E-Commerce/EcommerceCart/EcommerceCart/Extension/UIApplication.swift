//
//  UIApplication.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
