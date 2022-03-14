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
