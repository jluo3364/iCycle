//
//  Item.swift
//  Furniture_app
//
//  Created by Jessica Luo on 12/3/22.
//

import Foundation
struct Item: Hashable{
    var type: String
    var size: String
    var condition: String
    var photo: String
    var price: Int
    var brand: String;
    
    init (t: String, s:String, c:String, i: Int, d: Int, brand: String){
        self.type = t
        self.size = s
        self.condition = c;
        self.photo = "items_\(i)"
        self.price = d
        self.brand = brand
    }
}
