//
//  DropDownCell.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/29/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var dropDown: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension View {
    func applyStyling(isValue: Bool) -> some View {
        return self.modifier(columnsFormate(isValue: isValue))
    }
}

struct columnsFormate: ViewModifier {
    var isValue: Bool
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(isValue ? .primary : .secondary)
            .padding(5)
    }
}

struct RowColumnBuiler: View {
    var fieldName: String
    var fieldValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .applyStyling(isValue: false)
                .background(Color.green)
            Text(fieldValue)
                .applyStyling(isValue: true)
                .background(Color.green)
        }
        .background(Color.red)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 3)
    }
}

struct DropDownCell: View {
    @State var showTransition = false
    
    var body: some View {
        VStack {
            Button(action: { self.performTransition() }) {
                HStack {
                    VStack(alignment: .leading) {
                        self.rowColumn2
                        self.rowColumn3
                        self.rowColumn4
                        NavigationLink(destination: Text("Darling")) {
                            Text("Hit me")
                                .font(.system(size: 12))
                        }
                    }
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                        .rotationEffect(.degrees(self.showTransition ? 90 : 0))
                        .padding(.horizontal, 5)
                }
            }
            if self.showTransition {
                DataChangeDetail()
            }
        }
        .padding(.horizontal)
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
            self.showTransition.toggle()
        }
    }
}

struct GenericListFooterItem {
    let keyValueData : [(key: String, value: String)]
    
    init(keyValueData: [(key: String, value: String)]) {
        self.keyValueData = keyValueData
    }
}

struct DropDownCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrollView {
                VStack {
                    DropDownCell()
                    DropDownCell()
                }
            }
        }
    }
}
