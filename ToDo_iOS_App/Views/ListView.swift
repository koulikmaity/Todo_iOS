//
//  ListView.swift
//  ToDo_iOS_App
//
//  Created by Koulik Maity on 16/08/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
//                Text("No Items")
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
        //            .onDelete { IndexSet in
        //                items.remove(atOffsets: IndexSet)
        //            }
                    .onDelete(perform: listViewModel.deleteItem)
        //            .onMove { IndexSet, Int in
        //                items.move(fromOffsets: IndexSet, toOffset: Int)
        //            }
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle("ToDo List 📝")
        .toolbar {
            EditButton()
            NavigationLink {
                AddView()
            } label: {
                Text("Add")
            }
        }
    }
    
//    func deleteItem(indexSet: IndexSet){
//        items.remove(atOffsets: indexSet)
//    }
//
//    func moveItem(from: IndexSet, to: Int){
//        items.move(fromOffsets: from, toOffset: to)
//    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
