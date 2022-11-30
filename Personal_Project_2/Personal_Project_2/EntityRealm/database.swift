//
//  database.swift
//  Personal_Project_2
//
//  Created by Тимур Мурадов on 28.09.2022.

import Foundation
import RealmSwift

class Model: Object, Codable {

    @Persisted var workout: List<Workout>
}

class Workout: Object, Codable {
    
    @Persisted var section: String = ""
    @Persisted var items: List<Item>
    @Persisted var pic: String = ""
}


class Item: Object, Codable {
    
    @Persisted var name: String = ""
    @Persisted var detail: String = ""
    @Persisted var nameVideoFile: String = ""
    @Persisted var pic: String = ""
}

