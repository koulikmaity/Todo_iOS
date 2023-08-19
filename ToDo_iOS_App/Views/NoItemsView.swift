//
//  NoItemsView.swift
//  ToDo_iOS_App
//
//  Created by Koulik Maity on 19/08/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("There are no items!!!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the Add button and add a bunch of items to your TODO ")
                    .padding(.bottom, 15)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳👇")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("SecondaryAccentColor") : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(
                    color: animate ? Color("SecondaryAccentColor").opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                     x: 0,
                    y: animate ? 20 : 10
                )
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
