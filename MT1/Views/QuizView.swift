//
//  ContentView.swift
//  MT1
//
//  Created by Cenk Bilgen on 2024-02-21.
//

import SwiftUI
import Combine

struct QuizView: View {
    @StateObject var quiz = QuizModel(count: 3)

    var body: some View {
        VStack {
            if quiz.isFinished {
                //
            } else if let question = quiz.currentQuestion {
                //
            } else {
                Text("No Questions")
            }
        }
    }
}

#Preview {
    QuizView()
}
