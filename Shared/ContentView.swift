//
//  SubjectView.swift
//  GradeMapper
//
//  Created by Иван Бущик on 18.01.2022.
//

import SwiftUI
enum Grade: Int, Identifiable, CaseIterable{
	case One = 1
	case Two = 2
	case Three = 3
	case Four = 4
	case Five = 5

	var id: Int { self.rawValue }
}


struct ContentView: View {
	var counter = counters()
	@State var sr: Double = 0
	@State private var selectedGrade = Grade.One
	@State var selectedTypeOfGrade = "Контрольная работа"

	var body: some View {
		Text("GradeMapper")
			.font(.largeTitle)
			.fontWeight(.heavy)
			.multilineTextAlignment(.center)
			.padding(.top, -75)
		VStack(alignment: .center, spacing: 75){
			VStack(alignment: .leading, spacing: 30){
				Picker("Тип оценки", selection: $selectedTypeOfGrade){
					ForEach([String](coof.keys), id: \.self) {
						subjectSN in Text("\(subjectSN)")
					}
				}.pickerStyle(.wheel)
				VStack{
					Picker("Оценка", selection: $selectedGrade){
						ForEach(Grade.allCases, id: \.self) {
							currGrade in Text("\(currGrade.rawValue)")
						}
					}
				}.pickerStyle(.segmented).padding(.horizontal, 20)
			}.padding(.top, 100)
			Button ("Добавить оценку"){
				counter.multiplier = coof[selectedTypeOfGrade]!
				counter.gradesWeighted += Double(selectedGrade.rawValue) * counter.multiplier
				counter.weightsSum += counter.multiplier
				self.sr = (counter.gradesWeighted / counter.weightsSum)
			}.buttonStyle(.borderedProminent)
		  Text(String("Средний балл: \(self.sr)"))
			  .fontWeight(.bold)
			Button ("Очистить"){
				counter.multiplier = 1.5
				counter.gradesWeighted = 0
				counter.weightsSum = 0
				self.sr = 0
			}.buttonStyle(.borderedProminent)
		}
		.padding(.top, -155.0)
		
		
	}
}
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
