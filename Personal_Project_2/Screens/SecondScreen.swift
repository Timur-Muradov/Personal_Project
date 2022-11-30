//
//  SecondScreen.swift
//  Personal_Project_2
//
//  Created by Тимур Мурадов on 04.10.2022.
//

import Foundation
import UIKit

class SecondScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableViewSecondscreen: UITableView!
    
    var item: Item?
    
    var JogaService = jogaService()
    
    var listItem: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSecondscreen.delegate=self
        tableViewSecondscreen.dataSource = self
        
        tableViewSecondscreen.reloadData()        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableViewSecondscreen.dequeueReusableCell(withIdentifier: "SecondScreenCell", for: indexPath) as? SecondScreenCell {
            
            let Cell = listItem[indexPath.row]
            cell.secondImageCell.image = UIImage(named: Cell.pic)
            cell.secondLabel.text = Cell.name
            
            cell.secondImageCell.layer.cornerRadius = 10
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listItem[indexPath.row]
        let str = UIStoryboard(name: "Main", bundle: nil)
        if let vc = str.instantiateViewController(identifier: "DetailScreen") as? DetailScreen {
            vc.item = item
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
