//
//  EditToDoViewController.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/14/22.
//

import UIKit

class EditToDoViewController: UIViewController {

    var name: String = ""
    var tmpdescription: String = ""
    var priority: ToDo.Priority = .p4
    var dueDate: String!
    var dueDate_date: Date!
    
    @IBOutlet weak var toDoNameInput: UITextField!
    @IBOutlet weak var toDoDescriptionInput: UITextView!
    @IBOutlet weak var prioritySegmentPicker: UISegmentedControl!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    var todo: ToDo?
    var rowNumber: Int?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = todo {
            toDoNameInput.text = t.name
            toDoDescriptionInput.text = t.description
            dueDate = t.dueDate
            dueDateLoadHelper()
            priorityLoadHelper(t)
            
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "updateSegue") {
            if (validationHelper() == true) {
                updateHelper()
                
                return true
            } else {
                alertHelper()
                return false
            }
            
        } else {return true}
    }
    
    
    
    func dueDateLoadHelper (){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dueDate_date = dateFormatter.date(from: dueDate)
        dueDatePicker.setDate(dueDate_date, animated: true)
    }
    
    func priorityLoadHelper(_ t: ToDo){
        switch (t.priority) {
        case ToDo.Priority.p1:
            prioritySegmentPicker.selectedSegmentIndex = 0
        case ToDo.Priority.p2:
            prioritySegmentPicker.selectedSegmentIndex = 1
        case ToDo.Priority.p3:
            prioritySegmentPicker.selectedSegmentIndex = 2
        case ToDo.Priority.p4:
            prioritySegmentPicker.selectedSegmentIndex = 3
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
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dueDate = dateFormatter.string(from: sender.date)
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
    
    func updateHelper () {
        guard let row = rowNumber else {
            print("there has been an error with the row number")
            return
        }
        todos[row].name = toDoNameInput.text!
        todos[row].description = toDoDescriptionInput.text!
        todos[row].priority = priorityHelper(prioritySegmentPicker.selectedSegmentIndex)
        todos[row].dueDate = dueDate
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "updateSegue") {
            guard let detailViewController = segue.destination as? DetailViewController else { return }
            detailViewController.todo = todos[rowNumber!]
            detailViewController.rowNumber = rowNumber
            
            todo?.name = toDoNameInput.text!
            todo?.description = toDoDescriptionInput.text!
            todo?.priority = priorityHelper(prioritySegmentPicker.selectedSegmentIndex)
            todo?.dueDate = dueDate
            rowNumber
        }
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
