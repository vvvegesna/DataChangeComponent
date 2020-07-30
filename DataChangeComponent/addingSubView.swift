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
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.performTransition() }) {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(self.isButtonVisible ? 90 : 0))
                }
                self.rowColumn1
                Spacer()
            }
            
            VStack(alignment: .leading) {
                self.rowColumn2
                self.rowColumn3
                self.rowColumn4
            }

            subView()
            
            Spacer()
        }
        .padding()
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
    
    var rowColumn1: some View {
        Text("DC-0000003")
            .font(.system(size: 14))
            .foregroundColor(.accentColor)
    }
    var rowColumn2: some View {
        HStack(spacing: 8) {
            Text("Status")
                .applyStyling(isValue: false)
            Text("Not Processed")
                .applyStyling(isValue: true)
        }
    }
    var rowColumn3: some View {
        HStack(spacing: 8) {
            Text("SObject type")
                .applyStyling(isValue: false)
            Text("Account")
                .applyStyling(isValue: true)
        }
    }
    var rowColumn4: some View {
        HStack(spacing: 8) {
            Text("City")
                .applyStyling(isValue: false)
            Text("Mesa")
                .applyStyling(isValue: true)
        }
    }
    
    func performTransition() {
        withAnimation(.easeInOut(duration: 1)) {
            self.isButtonVisible.toggle()
        }
    }
}

struct addingSubView_Previews: PreviewProvider {
    static var previews: some View {
        addingSubView()
    }
}
