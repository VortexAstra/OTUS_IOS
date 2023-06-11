//
//  ContentView.swift
//  OTUS_1
//
//  Created by Артем Устинов on 11.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTabIndex = 0
    @State private var showingSheet = false
    
    var body: some View {
        TabView(selection: $selectedTabIndex, content: {
            NavigationStack {
                VStack {
                    MyUIView().frame(width: 200, height: 100)
                    Button("Open note screen") {
                        selectedTabIndex = 1
                        
                    }
                }
                .navigationBarTitle("Link Screen")
            }
            .tabItem { Label("Link", systemImage: "link") }.tag(0)
            
             NavigationStack {
                List {
                    NavigationLink(destination: Text("Note 1")) {
                        Text("Note 1")
                    }
                    NavigationLink(destination: Text("Note 2")) {
                        Text("Note 2")
                    }
                }
                .navigationBarTitle("Note Screen")
            }
            .tabItem { Label("Note", systemImage: "note") }.tag(1)
            
            VStack {
                Text("Tornado screen")
                Button("Open Modal") {
                    showingSheet.toggle()
                }.sheet(isPresented: $showingSheet, content: {
                    SheetView()
                })
            }
            .tabItem { Label("Tornado", systemImage: "tornado") }.tag(2)
        })
    }
}

#Preview {
    ContentView()
}


struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

// MARK: - UIKIT

struct MyUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let label = UILabel(frame: .zero)
        label.text = "Hello UIKit"
        label.frame = .init(x: 50, y: 25, width: 100, height: 50)
        view.addSubview(label)
        view.backgroundColor = .red
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print(#function)
    }
}
