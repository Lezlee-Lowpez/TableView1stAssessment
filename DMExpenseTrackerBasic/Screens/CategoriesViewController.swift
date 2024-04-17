//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        let category = categories[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        
        
        config.text = category
        
        cell.contentConfiguration = config
        
        return cell
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // Since it is a static function you need to call the name of the object first then the function
    var expenses = DataController.getExpenses()
    var expensesByCategory = [String:[Expense]]()
    var categories:[String] = []
    
    
    
    func initializeExpenseData() {
//         separate the expenses from above by category. Assign the result to our `expensesByCategory` dictionary.
        expensesByCategory = Expense.getExpensesByCategory(expenses: expenses)
        
        for key in expensesByCategory.keys{
            categories.append(key)

        }
        
        
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        initializeExpenseData()
        configureTableView()
    }

    @IBSegueAction func makeExpensesViewController(_ coder: NSCoder, sender: Any?) -> ExpensesViewController? {
        // Verify the sender is a UITableViewCell and obtain its indexPath.
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
//            print("Failed to get cell or index path")
            return nil
        }

        // Retrieve the selected category and corresponding expenses.
        let category = categories[indexPath.row]
        let expensesForCategory = expensesByCategory[category]

//        print("Selected Category: \(category)")
//        print("Expenses for Category: \(expensesForCategory!)")
        
        // Instantiate ExpensesViewController with the provided data.
        return ExpensesViewController(coder: coder, category: category, expenses: expensesForCategory!)    }
    
}
