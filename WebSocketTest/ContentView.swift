//
//  ContentView.swift
//  WebSocketTest
//
//  Created by Archie on 2019/6/27.
//  Copyright © 2019 Archie. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World").onAppear(perform: connect)
    }

    private func connect() {
        WebSocketManager.shared.connect()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
