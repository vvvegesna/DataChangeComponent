//
//  dataChangeDetail.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/29/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct dataChangeDetail: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("It's a Windy day")
            Text("Nayagra is looking amazing today!")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.tertiarySystemGroupedBackground))
        .cornerRadius(16)
        .transition(.dropDown)
    }
}

struct dataChangeDetail_Previews: PreviewProvider {
    static var previews: some View {
        dataChangeDetail()
    }
}
