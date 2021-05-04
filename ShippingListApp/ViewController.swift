//
//  ViewController.swift
//  ShippingListApp
//
//  Created by ramil on 04.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items: [Item] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        return cell
    }
    
    private func saveData() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    
    private func loadData() {
        if let objects = UserDefaults.standard.value(forKey: "Items") as? Data {
            if let objectDecoded = try? JSONDecoder().decode(Array.self, from: objects) as [Item] {
                items = objectDecoded
            }
        }
    }
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        if let newItemName = newItemTextField.text {
            let newItem = Item(name: newItemName)
            items.append(newItem)
            newItemTextField.text = ""
            shoppingTableView.reloadData()
            saveData()
            
        }
    }
    
    @IBOutlet weak var newItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingTableView.delegate = self
        shoppingTableView.dataSource = self
        
        let item1 = Item(name: "Milk")
        let item2 = Item(name: "Chees")
        
        items = [item1, item2]
        loadData()
    }


}

