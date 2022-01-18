//
//  ContentView.swift
//  Shared
//
//  Created by Иван Бущик on 17.01.2022.
//

import SwiftUI

struct ContentView: View{
    var body: some View {
		VStack(alignment: .center) {
			Text("GradeMapper")
				.font(.largeTitle)
				.fontWeight(.heavy)
				.multilineTextAlignment(.center)
			NavigationView {
				List{
					ForEach(subjectsNames, id: \.self) {
						subjectName in NavigationLink("\(subjectName)", destination: SubjectView(name: subjectName))
					}
				}
			}
		}.padding([.leading, .top], 5.0)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
	}
}




