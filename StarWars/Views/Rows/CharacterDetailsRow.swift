//
//  CharacterDetailsRow.swift
//  StarWars
//
//  Created by Fernando Garay on 25/07/2023.
//

import SwiftUI

//Character Details Row
struct CharacterDetailsRow: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.title2)
                .foregroundColor(Color.black)
            Spacer()
            Text(value.capitalized)
                .font(.title3)
                .foregroundColor(.gray)
        }
    }
}

struct CharacterDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsRow(title: "Mass", value: "90")
    }
}
