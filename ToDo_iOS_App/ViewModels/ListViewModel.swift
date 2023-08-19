//
//  ListViewModel.swift
//  ToDo_iOS_App
//
//  Created by Koulik Maity on 18/08/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "Read Book", isCompleted: true),
//            ItemModel(title: "Cooking food", isCompleted: false),
//            ItemModel(title: "Bed rest", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        guard let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        self.items = savedItem
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
