//
//  GridLayout.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 8/3/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct GridLayout<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(alignment: .top) {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(self.getItemPosition(row: row, column: column))
                    }
                }.background(Color.blue)
            }
        }.background(Color.yellow)
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    private func getItemPosition(row: Int, column: Int) -> Int {
        var index = 0
        index = row * self.columns + column
        return index
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout(rows: 2, columns: 2) { position in
            Text("Hello World! \(position)")
        }
    }
}
