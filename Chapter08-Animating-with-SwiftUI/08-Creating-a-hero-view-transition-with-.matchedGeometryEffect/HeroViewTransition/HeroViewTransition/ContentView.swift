//
//  ContentView.swift
//  HeroViewTransition
//
//  Created by Giordano Scalzo on 05/07/2021.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let image : String
    let title : String
    let details : String
}

struct DestinationListView: View {
    @Binding var selectedItem: Item!
    @Binding var showDetail: Bool
    let animation: Namespace.ID

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(data) { item in
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: item.image,
                                               in: animation)
                        .onTapGesture {
                            selectedItem = item
                            withAnimation {
                                showDetail.toggle()
                            }
                        }
                }
            }
            .padding(.all, 20)
        }
    }
}

struct DestinationDetailView: View {
    var selectedItem: Item
    @Binding var showDetail: Bool
    let animation: Namespace.ID

    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: selectedItem.image,
                                           in: animation)
                Text(selectedItem.title)
                    .font(.title)
                Text(selectedItem.details)
                    .font(.callout)
                    .padding(.horizontal)
                Spacer()
            }
            .ignoresSafeArea(.all)
            Button {
                withAnimation {
                    showDetail.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black.opacity(0.8))
                    .clipShape(Circle())
            }
            .padding(.trailing,10)
        }
        .background(Color.white
                        .ignoresSafeArea(.all))
    }
}

struct ContentView: View {
    @State private var selectedItem: Item!
    @State private var showDetail = false
    @Namespace var animation
    var body: some View {
        ZStack {
            DestinationListView(selectedItem: $selectedItem,
                                showDetail: $showDetail,
                                animation: animation)
                .opacity(showDetail ? 0 : 1)
            if showDetail {
                DestinationDetailView(selectedItem: selectedItem,
                                      showDetail: $showDetail,
                                      animation: animation)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
