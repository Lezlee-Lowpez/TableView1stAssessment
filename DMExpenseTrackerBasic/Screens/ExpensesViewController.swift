//
//  ExpensesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/28/23.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDataSource{
    
   
    @IBOutlet weak var expenseSumLabel: UILabel!
    @IBOutlet weak var expensesTableView: UITableView!
    
    var category:String = ""
    var expenses:[Expense] = []
    
    // Step 7.2
    init?(coder: NSCoder, category:String, expenses:[Expense]){
        self.category = category
        self.expenses = expenses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configureViewController() {
        let totalCategoryExpenses = expenses.reduce(0) { $0 + $1.amount }
        expenseSumLabel.text = "You spent $\(totalCategoryExpenses) on \(category)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        self.title = category
        configureViewController()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return expenses.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as? ExpenseCell else {
            fatalError("Could not dequeue a cell with identifier: ExpenseCell")
        }
        let expense = expenses[indexPath.row]
        cell.set(expense: expense)
        return cell
       }
   }

   extension ExpensesViewController: UITableViewDelegate {
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // Handle row selection if needed
       }
   }
    

