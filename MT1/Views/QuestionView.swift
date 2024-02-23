//
//  QuestionView.swift
//  MT1
//
//  Created by Cenk Bilgen on 2024-02-22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quiz: QuizModel
    let question: Question


    init(question: Question) {
        self.question = question
    }

    var body: some View {
        VStack {
        }
    }
}

#Preview {
    QuestionView(question: .mock)
}
