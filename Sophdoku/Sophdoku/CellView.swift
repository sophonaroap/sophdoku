//
//  CellView.swift
//  Sophdoku
//
//  Created by Soph Codes on 10/17/23.
//

import SwiftUI

struct CellView: View {
    var currentValue: Int?
    
    var body: some View {
        ZStack {
            Rectangle()
                .border(Color.black)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(Color.white)
            
            if currentValue != nil {
                Text("\(currentValue!)")
                    .font(.system(size: 30))
                    .minimumScaleFactor(0.01)
            } else {
                Text(" ")
                    .font(.system(size: 30))
                    .minimumScaleFactor(0.01)
            }
        }
    }
}

#Preview {
    CellView(currentValue: 7)
}
// struct CellView: View {
//    @State var puzzleManager: PuzzleManager
//    @State var index: Int
//    @State var possibilities: [Int] = []
//    @State var value: Int?
//    @State var isCorrect: Bool?
//    
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundColor(isCorrect == nil ? .white : (isCorrect! ? .green : .red))
//                .border(Color.black)
//                .aspectRatio(1, contentMode: .fit)
//            if value != nil {
//                Text("\(value!)")
//                    .font(.system(size: 500))
//                    .minimumScaleFactor(0.01)
//            } else {
//                Text("nil")
//                    .font(.system(size: 500))
//                    .minimumScaleFactor(0.01)
////                Grid {
////                    GridRow {
////                        ForEach(0 ..< 3) { num in
////                                Text("\(num + 1)")
////                                .foregroundStyle(possibilities.contains(num + 1) ? .gray : .white)
////                                    .font(.system(size: 500))
////                                    .minimumScaleFactor(0.01)
////                            }
////                        .padding(.horizontal, 30)
////                    }
////                    GridRow {
////                        ForEach(3 ..< 6) { num in
////                                Text("\(num + 1)")
////                                .foregroundStyle(possibilities.contains(num + 1) ? .gray : .white)
////                                    .font(.system(size: 500))
////                                    .minimumScaleFactor(0.01)
////                            }
////                        .padding(.horizontal, 30)
////                    }
////                    GridRow {
////                        ForEach(6 ..< 9) { num in
////                                Text("\(num + 1)")
////                                .foregroundStyle(possibilities.contains(num + 1) ? .gray : .white)
////                                    .font(.system(size: 500))
////                                    .minimumScaleFactor(0.01)
////                            }
////                        .padding(.horizontal, 30)
////                    }
////                }
//            }
//        }
//        .onChange(of: value, { oldValue, newValue in
//            if newValue != nil {
//                puzzleManager.setIndex(index: index, value: newValue!)
//                isCorrect = puzzleManager.getIndexCorrectness(index: index)
//            }
//        })
//        .onAppear() {
//            if value == nil {
//                value = puzzleManager.puzzle?.puzzle![index]
//            }
//        }
//        .aspectRatio(1, contentMode: .fit)
//    }
//}
//
//#Preview {
//    CellView(puzzleManager: PuzzleManager(), index: 1, value: 1)
////    CellView(puzzleManager: PuzzleManager(), index: 1, possibilities: [1,3,4,7,8,9])
//}
