//
//  ContentView.swift
//  Order Coffee
//
//  Created by Marcus Davis on 2/27/21.
//

import SwiftUI

struct ContentView: View {
	
	@State var size = 5.0
	@State var foam = 5.0
	@State var milk = 5.0
	
	
    var body: some View {
		
		ZStack {
			LinearGradient(gradient: Gradient(colors: [Color("coffeeBrown"), Color("lightBrown")]),
						   startPoint: .topLeading,
						   endPoint: .bottomTrailing)
				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	
			mainMessage(message: "Customize Your Coffee", imageName: "cc-heart")
			
			VStack(spacing: 4) {
						Text("Size")
							.font(.custom("Avenir Next Demi Bold", size: 30))
							.foregroundColor(.white)
							.padding(.top, 150)
				
					optionText(option1: "Tall", option2: "Grande", option3: "Venti")
				
					HStack {
							Slider(value: $size, in: 0 ... 10, step: 5)
								.frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
								.accentColor(Color("oTan"))
						
									} // HStack
					
						Text("Foam")
							.font(.custom("Avenir Next Demi Bold", size: 30))
							.foregroundColor(.white)
				
						optionText(option1: "None", option2: "Light", option3: "Regular")
				
					HStack {
							Slider(value: $foam, in: 0 ... 10, step: 5)
								.frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
								.accentColor(Color("oTan"))
					} // HStack
					
				
						Text("Milk")
//							.font(.system(size: 30, weight: .bold))
							.font(.custom("Avenir Next Demi Bold", size: 30))
							.foregroundColor(.white)
				
						optionText(option1: "Soy", option2: "Almond", option3: "Coconut")
				
					HStack {
							Slider(value: $milk, in: 0 ... 10, step: 5)
								.frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
								.accentColor(Color("oTan"))
						} // HStack
		
				// on edit to collect the value from what the user chose
				Text("You ordered a \(sizeChoice(option: size)) coffee with \(foamChoice(option: foam)) foam and \(milkChoice(option: milk)) milk.")
					.font(.custom("Avenir Next Bold", size: 23))
					.padding()
					.frame(width: 350, height: 130, alignment: .center)
					.foregroundColor(Color("oTan"))
					.background(Color("offWhite"))
					.cornerRadius(10)
					 
			} // VStack
			.padding(.bottom)
		} // ZStack
		
    } // body
	
} // struct content view


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct mainMessage: View {
	var message: String
	var imageName: String
	
	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 20)  {
				
				Text("\(message)")
					//.font(.system(size: 40, weight: .medium))
					.font(.custom("Avenir Next Bold", size: 38))
					.foregroundColor(.white)
				
				Image("\(imageName)")
					.renderingMode(.original)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 130, height: 140)
					.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
			} // hStack
			Spacer()
		}
	}
} // struct

struct optionText: View {
	var option1: String
	var option2: String
	var option3: String
	
	var body: some View {
		HStack(spacing: 35) {
			Text("\(option1)")
				//.font(.system(size: 25, weight: .medium))
				.font(.custom("Avenir Next Medium", size: 31))
				.foregroundColor(.white)
				//.padding(.trailing, 20)
			Text("\(option2)")
				//.font(.system(size: 25, weight: .medium))
				.font(.custom("Avenir Next Medium", size: 30))
				.foregroundColor(.white)
				//.padding(.trailing, 20)
			Text("\(option3)")
				//.font(.system(size: 25, weight: .medium))
				.font(.custom("Avenir Next Medium", size: 28))
				.foregroundColor(.white)
				//.padding(.leading)
		} //hstack
	}
} // struct

func sizeChoice(option: Double)  -> String {
	switch option {
		case 0:
			return "tall"
		case 5:
			return "grande"
		case 10:
			return "venti"
		default:
			return "Grande"
	}
}

func foamChoice(option: Double)  -> String {
	switch option {
		case 0:
			return "no"
		case 5:
			return "light"
		case 10:
			return "regular"
		default:
			return "light"
	}
}

func milkChoice(option: Double)  -> String {
	switch option {
		case 0:
			return "soy"
		case 5:
			return "almond"
		case 10:
			return "coconut"
		default:
			return "almond"
	}
}
