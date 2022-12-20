//
//  FloorView.swift
//  Elevator
//
//  Created by Kaique Monteiro on 19/12/22.
//

import SwiftUI

struct FloorView: View {
    @State var floor: Floor?

    var elevators: [Int?] = []
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(floor?.people ?? [], id: \.id) { person in
                        Text("🥷")
                            .font(.system(size: 36))
                    }
                }
            }
            Spacer()
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(elevators, id: \.self) { passengers in
                        Text(String(passengers ?? 0))
                            .font(.system(size: 36))
                            .border(.red)
                    }
                }
            }.fixedSize()
        }

    }
}

struct FloorView_Previews: PreviewProvider {
    static var previews: some View {
        FloorView()
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
