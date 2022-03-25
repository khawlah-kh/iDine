//
//  ItemDetail.swift
//  iDine
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order : Order
    let item : MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                   
                Text("\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            Spacer()
            Button {
                order.add(item: item)
                
            } label: {
                Text("Add")
                    .kerning(2)
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/2, height: 56)
                    .background(Color.yellow)
                    .cornerRadius(12)

                
                
            }
            
        }.padding()
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            ItemDetail(item: MenuItem.example)
        }
    }
}
