//
//  ContentView.swift
//  Sophdoku
//
//  Created by Soph Codes on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var puzzleManager = PuzzleManager()
    
    var body: some View {
        VStack {
            NavigationStack {
                Spacer(minLength: 50)
                Text("SophDoku")
                    .font(.largeTitle)
                
                Text("A Sudoku game by Soph")
                    .font(.title2)
                
                List {
                    ForEach(["Easy", "Medium", "Hard"], id: \.self) { difficulty in
                        NavigationLink(destination: GameView(puzzleManager: puzzleManager, difficulty: difficulty)) {
                            Text(difficulty)
                        }
                    }
                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                    }
                    .navigationBarTitle("poop")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .navigationBarHidden(true)
                Spacer(minLength: 150)
            }
        }
    }
}

#Preview {
    ContentView()
}
