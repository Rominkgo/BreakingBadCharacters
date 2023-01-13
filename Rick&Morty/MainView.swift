//
//  MainView.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import SwiftUI

struct MainView: View {
       
    @StateObject var vm = ApiFetcher()
    
    var body: some View {
        VStack(alignment: .customCenter) {
            Text("List of Star Wars Planets")
            
            List() {
                ForEach(vm.planets) { planet in
                    VStack(alignment: .customCenter) {

                            Text("Planet ")
                                 .font(.caption)
                                 .multilineTextAlignment(.center)
                                 .foregroundColor(.blue)
                            
                            Text(planet.name)
                                .font(.title)
                                .multilineTextAlignment(.center)
                      
                        Text(planet.terrain)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }
                    
                    .listRowSeparator(.automatic)
                    .listStyle(.insetGrouped)
                    .listRowSeparatorTint(.clear)
                        .padding()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct CustomCenter: AlignmentID {
  static func defaultValue(in context: ViewDimensions) -> CGFloat {
    context[HorizontalAlignment.center]
  }
}

extension HorizontalAlignment {
  static let customCenter: HorizontalAlignment = .init(CustomCenter.self)
}
