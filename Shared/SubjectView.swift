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


struct SubjectView: View {
	var ow = helpMe()
	@State var srr: Double = 0
	var name: String
	@State private var selectedGrade = Grade.One
	@State var selectedTypeOfGrade = "Контрольная работа"

	var body: some View {
		var current = subjects[name]!
		VStack(alignment: .center, spacing: 75){
			Text("\(name)")
				.font(.title)
				.fontWeight(.black)
				.multilineTextAlignment(.center)
			VStack(alignment: .leading, spacing: 30){
				Picker("Тип оценки", selection: $selectedTypeOfGrade){
					ForEach([String](subjects[name]!.keys), id: \.self) {
						subjectSN in Text("\(subjectSN)")
					}
				}.pickerStyle(.wheel)
				VStack{
					Picker("Оценка", selection: $selectedGrade){
						ForEach(Grade.allCases, id: \.self) {
							currGrade in Text("\(currGrade.rawValue)")
						}
					}
				}.pickerStyle(.segmented)
				}
			Button ("Добавить оценку"){
				ow.multiplier = current[selectedTypeOfGrade]!
				ow.gradesWeighted += Double(selectedGrade.rawValue) * ow.multiplier
				ow.weightsSum += ow.multiplier
				ow.sr = (ow.gradesWeighted / ow.weightsSum)
				print(ow.sr)
				print(ow.multiplier)
				self.srr = ow.sr
			}.buttonStyle(.borderedProminent)
		  Text(String(self.srr))
			  .fontWeight(.bold)
		}
		.padding(.top, -155.0)
	}
}
struct SubjectView_Previews: PreviewProvider {
	static var previews: some View {
		SubjectView(name: "Русский язык")
	}
}
