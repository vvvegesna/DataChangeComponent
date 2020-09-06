//
//  dataChangeDetail.swift
//  DataChangeComponent
//
//  Created by Vegesna, Vijay V EX1 on 7/29/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct DataChangeDetail: View {
    
    let detailItem: GenericListFooterItem
    
//    var rows: Int {
//        let records = self.detailItem.keyValueData.count
//        let isEven = (records % 2) == 0
//        let quotient = records / 2
//        return isEven ? quotient : (quotient + 1)
//    }
    
    var rows: Int {
        let records = self.detailItem.keyValueData.count
        return Int(ceil(CGFloat(records) / 2))
    }
    
    var columns = 2
    
    init() {
        var arrayOfPairs = [(key: String, value: String)]()
        
        let pair1 = ("Account Name bigger bigger", "Aron Randell Brown maximus max")
        let pair2 = ("Professinal title", "Pediatrists")
        let pair3 = ("Speciality", "Internal medicin - pediatrics medicin - pediatrics")
        let pair4 = ("Lalaland", "Emma Watson Emma stone")

        arrayOfPairs.append(pair1)
        arrayOfPairs.append(pair2)
        arrayOfPairs.append(pair3)
        arrayOfPairs.append(pair4)
        
        self.detailItem = GenericListFooterItem(keyValueData: arrayOfPairs)
    }
    
    var body: some View {
        GridLayout(rows: self.rows, columns: self.columns) { position in
            if position < self.detailItem.keyValueData.count {
                RowColumnBuiler(fieldName: self.detailItem.keyValueData[position].key, fieldValue: self.detailItem.keyValueData[position].value)
            }
        }
        .padding()
        .background(Color(.tertiarySystemGroupedBackground))
        .cornerRadius(16)
        .transition(.move(edge: .top))
        .zIndex(0)
    }
}

struct dataChangeDetail_Previews: PreviewProvider {
    static var previews: some View {
        DataChangeDetail()
    }
}
