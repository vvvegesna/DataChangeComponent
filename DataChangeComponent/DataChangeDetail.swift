//
//  dataChangeDetail.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/29/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct rowColumnBuiler: View {
    var fieldName: String
    var fieldValue: String
    
    var body: some View {
        HStack(spacing: 5) {
            Text(fieldName)
                .applyStyling(isValue: false)
            Text(fieldValue)
                .applyStyling(isValue: true)
                .frame(maxWidth: .infinity)
        }
    }
}

struct DataChangeDetail: View {
    
    let data: GenericListFooterItem
    
    var rows: Int {
        let records = self.data.keyValueData.count
        let isEven = (records % 2) == 0
        let quotient = records / 2
        return isEven ? quotient : (quotient + 1)
    }
    
    var columns = 2
    
    init() {
        var arrayOfPairs = [(key: String, value: String)]()
        
        let pair1 = ("Account Name", "Aron Randell Brown")
        let pair2 = ("Professinal title", "Pediatrists")
        let pair3 = ("Speciality", "Internal medicin - pediatrics")
        
        arrayOfPairs.append(pair1)
        arrayOfPairs.append(pair2)
        arrayOfPairs.append(pair3)
        
        self.data = GenericListFooterItem(keyValueData: arrayOfPairs)
    }
    
    var body: some View {
        GridLayout(rows: self.rows, columns: self.columns) { position in
            Group {
                if position < self.data.keyValueData.count {
                    rowColumnBuiler(fieldName: self.data.keyValueData[position].key, fieldValue: self.data.keyValueData[position].value)
                } else {
                   EmptyView()
                }
                
            }
        }
        .padding()
        .background(Color(.tertiarySystemGroupedBackground))
        .cornerRadius(16)
        .transition(.dropDown)
    }
}

struct dataChangeDetail_Previews: PreviewProvider {
    static var previews: some View {
        DataChangeDetail()
    }
}
