//
//  CreateToDoViewController.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/14/22.
//

import UIKit

class CreateToDoViewController: UIViewController {

    var name: String = ""
    var tmpdescription: String = ""
    var priority: ToDo.Priority = .p4
    var dueDate: String!

    
    
    @IBOutlet weak var toDoNameInput: UITextField!
    @IBOutlet weak var toDoDescriptionInput: UITextView!
    @IBOutlet weak var prioritySegmentPicker: UISegmentedControl!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        toDoDescriptionInput.layer.borderWidth = 0.5
        toDoDescriptionInput.layer.borderColor = borderColor.cgColor
        toDoDescriptionInput.layer.cornerRadius = 5.0
        dueDatePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dueDate = dateFormatter.string(from: dueDatePicker.date)

        // Do any additional setup after loading the view.
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            if (validationHelper() == true) {
                name = toDoNameInput.text!
                tmpdescription = toDoDescriptionInput.text!
                priority = priorityHelper(prioritySegmentPicker.selectedSegmentIndex)
                dueDate
            } else {
                alertHelper()
            }
                
            
        }
    }
    
    func priorityHelper(_ priority: Int) -> ToDo.Priority {
        switch priority {
        case 0:
            return ToDo.Priority.p1
        case 1:
            return ToDo.Priority.p2
        case 2:
            return ToDo.Priority.p3
        case 3:
            return ToDo.Priority.p4
        default:
            return ToDo.Priority.p4
        }
    }
    
    func validationHelper () -> Bool {
        if ((toDoNameInput.text == "") || (toDoNameInput.text == nil)) {
            return false
        } else {return true}
    }
    
    func alertHelper () {
        let title = "Error"
        let message = "Please add a title for your To-Do Item"
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dueDate = dateFormatter.string(from: sender.date)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
