//
//  ContentView.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/28/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    DropDownCell()
                    DropDownCell()
                }
            }
            .navigationBarTitle("DataChanges history")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
