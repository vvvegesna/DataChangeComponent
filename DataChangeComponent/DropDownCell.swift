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

struct DetailViewBuilder<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color(.tertiarySystemGroupedBackground))
            .cornerRadius(16)
            .transition(.dropDown)
    }
}

struct columnsFormate: ViewModifier {
    var isValue: Bool
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(isValue ? nil : .secondary)
            .padding(3)
    }
}

extension View {
    func applyStyling(isValue: Bool) -> some View {
        return self.modifier(columnsFormate(isValue: isValue))
    }
}

struct DropDownCell: View {
    @State var showTransition = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.performTransition() }) {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(self.showTransition ? 90 : 0))
                }
                self.rowColumn1
                Spacer()
            }
            
            VStack(alignment: .leading) {
                self.rowColumn2
                self.rowColumn3
                self.rowColumn4
            }
            
            if self.showTransition {
                DetailViewBuilder {
                    dataChangeDetail()
                }
            }
            Spacer()
        }
        .padding()
    }
    var rowColumn1: some View {
        Text("DC-0000003")
            .font(.system(size: 14))
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

struct DropDownCell_Previews: PreviewProvider {
    static var previews: some View {
        DropDownCell()
    }
}