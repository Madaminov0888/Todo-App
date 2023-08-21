//
//  NoItemsView.swift
//  TodoList
//
//  Created by Muhammadjon Madaminov on 13/07/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    
    var body: some View {
        ScrollView {
            Image(systemName: "note.text.badge.plus")
                .resizable()
                .foregroundColor(.secondary)
                .scaledToFit()
                .frame(width: 200, height: 100)
                .padding(.top, 30)
            Text("There are no items !")
                .font(.title)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                
                .padding(.horizontal, 30)
            Text("Are you a productive person? I think you should click add button")
                .foregroundColor(.secondary)
                .padding(.horizontal,30)
            NavigationLink {
                AddView()
            } label: {
                Text("Add something 🥳")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : .accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, animate ? 60 : 90)
            .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 20,
                    x: 0,
                    y: animate ? 50 : 30)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)

        }
        .frame(maxWidth: 400)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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
        NavigationStack {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
