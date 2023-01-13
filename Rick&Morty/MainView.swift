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
        List {
            ForEach(vm.characters) { item in
                VStack {
                    Text(item.name)
                    
                    Text(item.nickname)
                    
                    Text("Played by: " + item.portrayed)
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
