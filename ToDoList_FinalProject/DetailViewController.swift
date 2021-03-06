//
//  ViewController.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/5/22.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var toDoNameLabel: UILabel!
    @IBOutlet weak var toDoDescriptionLabel: UILabel!
    @IBOutlet weak var toDoDueDate: UILabel!
    var todo: ToDo?
    @IBOutlet weak var toDoPriority: UILabel!
    var rowNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = todo {
            toDoNameLabel.text = t.name
            toDoDescriptionLabel.text = t.description
            toDoDueDate.text = t.dueDate
            toDoPriority.text = t.priority.rawValue
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editToDo") {
            guard let editToDoViewController = segue.destination as? EditToDoViewController else { return }
            editToDoViewController.todo = todo
            editToDoViewController.rowNumber = rowNumber
        }
    }

    @IBAction func cancelUpdate(segue:UIStoryboardSegue) {
      
    }
    
    @IBAction func update(segue:UIStoryboardSegue) {
        let toDoEditVC = segue.source as! EditToDoViewController
        rowNumber = toDoEditVC.rowNumber
        toDoNameLabel.text = toDoEditVC.todo?.name
        toDoDescriptionLabel.text = toDoEditVC.todo?.description
        toDoDueDate.text = toDoEditVC.dueDate
        toDoPriority.text = toDoEditVC.todo?.priority.rawValue
        
    }
}

