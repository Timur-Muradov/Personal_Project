//
//  jogaService.swift
//  Personal_Project_2
//
//  Created by Тимур Мурадов on 02.10.2022.

import Foundation
import RealmSwift

class jogaService {
    
    var realm = try! Realm()
    
    func saveJogaVideo(model: Model) {
        try! realm.write({
            self.realm.add(model)
        })
    }
    
    func jsonParcing() {
        if let path = Bundle.main.path(forResource: "joga", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let result = try? JSONDecoder().decode(Model.self, from: data) {
                        self.saveJogaVideo(model: result)
                    } 
              } catch {
                  print("ошибка парсинга")
              }
        }
    }
    
    func getModel() -> Results<Model> {
        let model = realm.objects(Model.self)
        return model
    }
    
    func getJogaVideo() -> List<Workout> {
        
        if let model = getModel().first {
            return model.workout
        } 
        
        jsonParcing()
        return getJogaVideo()
    }
    
}
