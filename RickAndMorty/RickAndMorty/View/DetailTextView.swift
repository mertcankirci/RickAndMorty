//
//  DetailTextView.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 19.04.2023.
//

import SwiftUI

struct DetailTextView: View {
    
    @State var title: String
    @State var value : String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack {
                Text("\(title):")
                    .font(.system(size: 22, weight: .bold))
                    .frame(width: 100, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: false)
                //.padding(.top, 20)
                
            }
            VStack{
                Text(value)
                    .font(.system(size: 22))
                    .frame(width: 200, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: false)
                //.padding(.top, 5)
            }
        }
        .padding(.vertical, 5)
    }
}





struct DetailTextView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTextView(title: "Status", value: "Alive")
    }
}
