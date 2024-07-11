//
//  ContentView.swift
//  RallyTransbetxi
//
//  Created by Pablo on 11/7/24.
//

import SwiftUI

struct RallyScreen: View {
    var body: some View {
        VStack {
            Image("Header")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity)
            CountdownTimerView()
            Spacer()
        }
        .padding(8)
    }
}

struct RallyScreen_Previews: PreviewProvider {
    static var previews: some View {
        RallyScreen()
    }
}
