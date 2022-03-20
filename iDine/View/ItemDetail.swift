//
//  ItemDetail.swift
//  iDine
//
//  Created by khawlah khalid on 20/03/2022.
//

import SwiftUI

struct ItemDetail: View {
    let item : MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            Spacer()
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
