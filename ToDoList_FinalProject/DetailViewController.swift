//
//  ViewController.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/14/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var toDoNameLabel: UILabel!
    @IBOutlet weak var toDoDescriptionLabel: UILabel!
    var todo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = todo {
            toDoNameLabel.text = t.name
            toDoDescriptionLabel.text = t.description
        }
    }


}

