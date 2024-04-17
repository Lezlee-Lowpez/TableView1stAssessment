//
//  Expense.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

struct Expense {
    var title:String
    var category:String
    var amount:Double
    
    static func calculateTotalSpent(expenses:[Expense]) -> Double{
        var total = 0.0
        for expense in expenses {
            total += expense.amount
        }
        return total
    }
    
    static func getExpensesByCategory(expenses:[Expense]) -> [String:[Expense]]{
        
        // returns a dictionary where key = category and value = object belonging to that category
        //You add paretheses after creating an empty dictionary
        
        
        var my_dictionary = [String:[Expense]]()
        
        for expense in expenses {
            // set the key of dictionary  and value as array of expense objects
            if var expensesInCategory = my_dictionary[expense.category] {
                expensesInCategory.append(expense)
                my_dictionary[expense.category] = expensesInCategory
                
            } else {
                my_dictionary[expense.category] = [expense]
            }
        }
        
        
        
        return my_dictionary
    }
}
