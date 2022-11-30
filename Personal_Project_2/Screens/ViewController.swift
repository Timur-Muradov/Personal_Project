//
//  ViewController.swift
//  Personal_Project_2
//
//  Created by Тимур Мурадов on 20.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var centralImage: UIImageView!
    @IBOutlet var centralLabel: UILabel!
    
    
    var JogaService = jogaService()
    
    var listWorkout: [Workout] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        centralImage.image = UIImage(named: "Pic")
        centralLabel.text = "Практикуйте йогу и ваша жизнь станет лучше! Йога успокаивает нервную систему, снимает напряжение  после сидячей работы, укрепляет мышцы. С помощью йоги вы станете не только здоровыми, но и спокойными, энергичными, сможете раскрыть ваш  потенциал!"
        
        
        let videos = JogaService.getJogaVideo()
        videos.forEach { workout in
            listWorkout.append(workout)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWorkout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            var Cell = listWorkout[indexPath.row]
            cell.labelCell.text = Cell.section
            cell.imageCell.image = UIImage(named: Cell.pic)
            cell.imageCell.layer.cornerRadius = 10
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemsArray = listWorkout[indexPath.row].items
        var listItem: [Item] = []
        itemsArray.forEach { item in
            listItem.append(item)
        }

        
        let str = UIStoryboard(name: "Main", bundle: nil)
        if let vc = str.instantiateViewController(identifier: "SecondScreen") as? SecondScreen {
            vc.listItem = listItem
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    


}



