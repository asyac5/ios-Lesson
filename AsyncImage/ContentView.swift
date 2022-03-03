//
//  ContentView.swift
//  AsyncImage
//
//  Created by akira nishimura on 2022/03/03.
//

import SwiftUI

private let imageURL:String = "https://........png"

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModifier()
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: imageURL),transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase{
            case .success(let image):
                image.imageModifier()
                    .transition(.move(edge: .bottom))
            case .failure(_):
                Image(systemName: "hand.thumbsdown.fill")
                    .iconModifier()
            case .empty:
                Image(systemName: "hand.draw")
                    .iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}
        
        
//        AsyncImage(url: URL(string: imageURL)){phase in
//            if let image = phase.image{
//                image.imageModifier()
//            }else if phase.error != nil{
//                Image(systemName: "cloud.drizzle")
//                    .iconModifier()
//            }else{
//                Image(systemName: "figure.walk")
//                    .iconModifier()
//            }
//        }
//        .padding(40)
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
