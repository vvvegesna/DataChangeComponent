//
//  addingSubView.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/29/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct addingSubView: View {
    @State private var isButtonVisible = false

    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation()) {
                Text("add view button")
            }

            subView()
                .transition(.dropDown)
                .animation(.spring())
        }
    }

    func subView() -> some View {
        Group {
            if isButtonVisible {
                dataChangeDetail()
            } else {
                EmptyView()
            }
        }
    }
}

struct addingSubView_Previews: PreviewProvider {
    static var previews: some View {
        addingSubView()
    }
}
