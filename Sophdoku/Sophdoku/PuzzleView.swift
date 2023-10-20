//
//  PuzzleView.swift
//  Sophdoku
//
//  Created by Soph Codes on 10/15/23.
//

import SwiftUI

struct PuzzleView: View {
    @ObservedObject var puzzleManager: PuzzleManager
    
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(0..<3) { row in
                GridRow {
                    ForEach(0..<9) { col in
                        CellView(puzzleManager: puzzleManager, index: (row * 9) + col)
                    }
                }
            }
            ForEach(3..<6) { row in
                GridRow {
                    ForEach(0..<9) { col in
                        CellView(puzzleManager: puzzleManager, index: (row * 9) + col)
                    }
                }
            }            
            ForEach(6..<9) { row in
                GridRow {
                    ForEach(0..<9) { col in
                        CellView(puzzleManager: puzzleManager, index: (row * 9) + col)
                    }
                }
            }
        }
    }
}

#Preview {
    PuzzleView(puzzleManager: PuzzleManager())
}
// struct PuzzleView: View {
//    @State var puzzleManager: PuzzleManager
//    @State var currPuzzle: Puzzle
//    
//    var body: some View {
//        Grid {
//            GridRow {
//                ForEach(0..<9) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(9..<18) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(18..<27) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(27..<36) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(36..<45) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(45..<54) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(54..<63) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(63..<72) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//            GridRow {
//                ForEach(72..<81) { col in
////                    CellView(puzzleManager: puzzleManager, index: col)
//                    Text("\(puzzleManager.puzzle?.puzzle?[col] ?? 0)")
//                }
//            }
//        }
//        .navigationTitle(puzzleManager.puzzle?.difficulty ?? "easy")
//        .aspectRatio(1, contentMode: .fit)
//        .background(Color.gray)
//        
//    }
//    
//}
//
//struct PuzzleView_Previews: PreviewProvider {
//    @State static var puzzle = Puzzle(difficulty: "easy", puzzle: "...46.....8.2..73.9....7...6....2.4..15...2.9.4...8........6..17....49.3..9...5..")
//    @State static var pm = PuzzleManager()
//    
//    
//    static var previews: some View {
//        PuzzleView(puzzleManager: pm, currPuzzle: puzzle)
//    }
//}

