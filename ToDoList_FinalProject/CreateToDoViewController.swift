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
    var dueDate: Date = Date()
    
    
    @IBOutlet weak var toDoNameInput: UITextField!
    @IBOutlet weak var toDoDescriptionInput: UITextView!
    @IBOutlet weak var prioritySegmentPicker: UISegmentedControl!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDescriptionInput.text = "Please fill out description"
        toDoDescriptionInput.textColor = UIColor.lightGray
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        toDoDescriptionInput.layer.borderWidth = 0.5
        toDoDescriptionInput.layer.borderColor = borderColor.cgColor
        toDoDescriptionInput.layer.cornerRadius = 5.0

        // Do any additional setup after loading the view.
    }
    
    /* next two functions taken from: https://stackoverflow.com/questions/27652227/add-placeholder-text-inside-uitextview-in-swift
     */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
    
//    @IBAction func addToDo(_ sender: UIButton) {
//        let newIndex = todos.count
//        todos.append(ToDo(name: name, description: description, priority: .p4, dueDate: Date()))
//        // Tell the table view a new row has been created
//        ToDoListViewController.tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
//        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            name = toDoNameInput.text!
            tmpdescription = toDoDescriptionInput.text!
            priority = priorityHelper(prioritySegmentPicker.selectedSegmentIndex)
            dueDate = dueDatePicker.date
                
            
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
    
//    @objc func didTapAddItemButton(_ sender: UIBarButtonItem)
//        {
//            // Create an alert
//            let alert = UIAlertController(
//                title: "Create new to-do",
//                message: "Please fill out the to-do name; all other fields are optional:",
//                preferredStyle: .alert)
//
//            // Add a text field to the alert for the new item's title
//            alert.addTextField { field in
//                field.placeholder = "Name"
//                field.returnKeyType = .next}
//
//            alert.addTextField { field in
//                field.placeholder = "Description"
//                field.returnKeyType = .next}
//
//
//            // Add a "cancel" button to the alert. This one doesn't need a handler
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//            // Add a "OK" button to the alert. The handler calls addNewToDoItem()
//            alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (_) in
//                if let name = alert.textFields?[0].text
//                {
//                    if let description = alert.textFields?[1].text {
//                        self.addNewToDoItem(name: name, description: description)
//                    } else {
//                        let description = ""
//                        self.addNewToDoItem(name: name, description: description)
//                    }
//
//                }
//            }))
//
//            // Present the alert to the user
//            self.present(alert, animated: true, completion: nil)
//        }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
