//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
