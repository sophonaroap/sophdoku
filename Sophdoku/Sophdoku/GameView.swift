//
//  GameView.swift
//  Sophdoku
//
//  Created by Soph Codes on 10/17/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var puzzleManager: PuzzleManager
    @State var difficulty: String
    
    @State var currNum: Int?
    @State var isGuess: Bool = false
    @State var clearCell: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if puzzleManager.puzzle != nil {
                Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                    ForEach(0..<9) { row in
                        GridRow {
                            ForEach(0..<9) { col in
                                CellView(currentValue: puzzleManager.getIndex(index: (row * 9) + col))
                                    .onTapGesture {
                                        if currNum != nil {
                                            if puzzleManager.initialPuzzle?.puzzle![(row * 9) + col] == nil {
                                                puzzleManager.setIndex(index: (row * 9) + col, value: currNum!)
                                                
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }
                .onAppear(perform: {
                    print(puzzleManager.puzzle![0...5])
                })
                .padding()
            } else {
                ProgressView()
            }
            
            Spacer()
            
            HStack {
                Grid {
                    GridRow {
                        ForEach(1..<4, id: \.self) { num in
                            Button(action: {
                                if currNum == num {
                                    currNum = nil
                                } else {
                                    currNum = num
                                }
                            }, label: {
                                Text("\(num)")
                            })
                            .background(currNum == num ? Color.blue : Color.clear)
                        }
                    }
                    GridRow {
                        ForEach(4..<7, id: \.self) { num in
                            Button(action: {
                                if currNum == num {
                                    currNum = nil
                                } else {
                                    currNum = num
                                }
                            }, label: {
                                Text("\(num)")
                            })
                            .background(currNum == num ? Color.blue : Color.clear)
                        }
                    }                    
                    GridRow {
                        ForEach(7..<10, id: \.self) { num in
                            Button(action: {
                                if currNum == num {
                                    currNum = nil
                                } else {
                                    currNum = num
                                }
                            }, label: {
                                Text("\(num)")
                            })
                            .background(currNum == num ? Color.blue : Color.clear)
                        }
                    }
                }
                Divider()
                    .frame(height: 60)
                VStack {
                    Button {
                        isGuess.toggle()
                    } label: {
                        Image(systemName: "pencil.tip.crop.circle")
                    }
                    Button(role: .destructive) {
                        clearCell.toggle()
                        if clearCell == true {
                            currNum = nil
                            isGuess = false
                        }
                    } label: {
                        Image(systemName: "eraser")
                    }
                    Button(role: .destructive) {
                        puzzleManager.clearBoard()
                    } label: {
                        Image(systemName: "restart.circle")
                    }
                }
            }
            .buttonStyle(.bordered)
            Spacer()
        }
        .onAppear(perform: {
            puzzleManager.getPuzzle(difficulty: difficulty) { puzzle in
                puzzleManager.getSolution()
            }
        })
    }
}

#Preview {
    GameView(puzzleManager: PuzzleManager(), difficulty: "easy")
}
