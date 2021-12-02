//
//  ProspectsView.swift
//  iosAppTutorials
//
//  Created by Jordy Hershel on 2.12.2021.
//

import SwiftUI

struct ProspectsView: View {
    
    //Here now we track if the parent struct have an environment object notice that here we write   @EnvironmentObject var Prospects: Prospects not   @EnvironmentObject var Prospects = Prospects()
    @EnvironmentObject var prospects: Prospects
    
    //In the enum we set up the different cases
    enum FilterType {
        case none, contacted, uncontacted
     }
    let filter: FilterType
    
   
    
    
    var  title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
            
        }
    }
    
    var body: some View {
        NavigationView {

                Text("People: \( prospects.people.count)")
                    .navigationBarTitle(title)
                    .navigationBarItems(trailing: Button(action: {
                        let prospect = Prospect()
                        prospect.name = "Jordy Hershel"
                        prospect.emailAddress = "jordy925@gmail.com"
                        self.prospects.people.append(prospect)
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scan")
                    })
            
         
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}