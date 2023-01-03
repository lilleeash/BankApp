//
//  CategoryModel.swift
//  BankApp
//
//  Created by Darya Zhitova on 29.08.2022.
//

import Foundation


struct CategoryModel: Identifiable {
    
    let id = UUID().uuidString
    
    let title: String
    let color: String
    let percent: Int
    
    
    static let categories = [
          CategoryModel(title: "Goods", color: "lightPink", percent: 45),
          CategoryModel(title: "Transport", color: "lightBlue", percent: 30),
          CategoryModel(title: "Education", color: "lightIndigo", percent: 15),
          CategoryModel(title: "Other", color: "lightGreen", percent: 10)
       ]
    
    
}
