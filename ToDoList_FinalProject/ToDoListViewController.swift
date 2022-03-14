//
//  ToDoListViewController.swift
//  ToDoList_FinalProject
//
//  Created by Mauro Mujica-Parodi on 3/14/22.
//

import UIKit

class ToDoListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ToDoListViewController.didTapAddItemButton(_:)))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: todo.priority.rawValue, for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = todo.name
        cell.detailTextLabel?.text = todo.description
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath =
                self.tableView.indexPath(for: cell) else { return }
        detailViewController.todo = todos[indexPath.row]
    }
    
    func didTapAddItemButton(_ sender: UIBarButtonItem)
        {
            // Create an alert
            let alert = UIAlertController(
                title: "Create new to-do",
                message: "Please fill out the to-do name; all other fields are optional:",
                preferredStyle: .alert)

            // Add a text field to the alert for the new item's title
            alert.addTextField { field in
                field.placeholder = "Name"
                field.returnKeyType = .next}
            
            alert.addTextField { field in
                field.placeholder = "Description"
                field.returnKeyType = .next}
            

            // Add a "cancel" button to the alert. This one doesn't need a handler
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            // Add a "OK" button to the alert. The handler calls addNewToDoItem()
            alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (_) in
                if let name = alert.textFields?[0].text
                {
                    if let description = alert.textFields?[1].text {
                        self.addNewToDoItem(name: name, description: description)
                    } else {
                        let description = ""
                        self.addNewToDoItem(name: name, description: description)
                    }
                    
                }
            }))

            // Present the alert to the user
            self.present(alert, animated: true, completion: nil)
        }

    private func addNewToDoItem(name: String, description: String)
        {
            // The index of the new item will be the current item count
            let newIndex = todos.count

            // Create new item and add it to the todo items list
            todos.append(ToDo(name: name, description: description, priority: .p4, dueDate: Date()))

            // Tell the table view a new row has been created
            tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
        }

}
