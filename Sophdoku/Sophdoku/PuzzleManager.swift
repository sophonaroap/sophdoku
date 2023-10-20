//
//  PuzzleManager.swift
//  Sophdoku
//
//  Created by Soph Codes on 10/15/23.
//

import Foundation
import SwiftUI

struct Puzzle: Codable {
    var difficulty: String
    var puzzle: [Int?]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        difficulty = try container.decode(String.self, forKey: .difficulty)
        puzzle = try container.decode(String.self, forKey: .puzzle).map { Int(String($0)) }
    }
    init(difficulty: String, puzzle: String) {
        self.difficulty = difficulty
        self.puzzle = puzzle.map { Int(String($0)) }
    }
}


final class PuzzleManager: ObservableObject {
    @Published var initialPuzzle: Puzzle?
    @Published var latestNumber: Int = 0
    @Published var puzzle: [Int?]?
    @Published var solution: [Int]?
    
    func getIndex(index: Int) -> Int? {
        return puzzle![index]
    }
    
    func setIndex(index: Int, value: Int) {
        var new_puzzle = puzzle
        new_puzzle![index] = value
        puzzle = new_puzzle

        latestNumber = value
    }
    
    func clearBoard() {
        self.puzzle = self.initialPuzzle?.puzzle
    }
    
    func setPuzzle(puzzle: Puzzle) {
        self.puzzle = puzzle.puzzle
        self.initialPuzzle = puzzle
    }
        
    func getPuzzle(difficulty: String = "easy", completionHandler: @escaping (Puzzle) -> Void) {
        print("\n\nGetting books")
        
        let url = URL(string: "https://octopus-app-2tf3v.ondigitalocean.app/sophdoku/\(difficulty.lowercased())")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching books: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let puzzle = try JSONDecoder().decode(Puzzle.self, from: data)
                    self.setPuzzle(puzzle: puzzle)
//                    print(self.puzzle!)
                    
                    completionHandler(puzzle)
                
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
    func getSolution() {
        print("Getting solution")
        
        let puzzle_string = initialPuzzle?.puzzle?.map { String($0 ?? 0) }.joined().replacingOccurrences(of: "0", with: ".") ?? ""
        
        print(puzzle_string)
        
        let data = "puzzle=\(puzzle_string)".data(using: .utf8)!
        let url = URL(string: "https://octopus-app-2tf3v.ondigitalocean.app/sophdoku/\(initialPuzzle?.difficulty.lowercased() ?? "easy")")!
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with fetching books: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
//                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let solution = try JSONDecoder().decode([Int].self, from: data)
                    self.solution = solution
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
    func getIncorrectIndexes() -> [Int] {
        var incorrectIndexes: [Int] = []
        
        for i in 0..<81 {
            if puzzle![i] != solution?[i] {
                incorrectIndexes.append(i)
            }
        }
        
        return incorrectIndexes
    }
    
    func getIndexCorrectness(index: Int) -> Bool {
        if puzzle![index] == solution?[index] {
            return true
        } else {
            return false
        }
    }
}


