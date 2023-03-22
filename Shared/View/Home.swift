//
//  Home.swift
//  NotesApp
//
//  Created by XIAOCHUAN HE on R 5/03/22.
//

import SwiftUI

struct Home: View {
    @State var showColors = false
    @State var animateButton = false
    
    var body: some View {
        HStack(spacing: 0 ){
            if isMacOS{
                Group{
                    SideBar()
                    Rectangle()
                        .fill(Color.black.opacity(0.15))
                        .frame(width:1)
                }
            }
            mainContent()
        }
#if os(macOS)
        .ignoresSafeArea()
#endif
        .frame(alignment: .leading)
//        .frame(width: isMacOS ? realRect.width / 1.7 : nil,height: isMacOS ? realRect.height - 180 :nil ,alignment: .leading)
        .background(isMacOS ? .clear : Color.gray.opacity(0.5), ignoresSafeAreaEdges: .all)
#if os(iOS)
        .overlay(SideBar())
#endif
        .buttonStyle(BorderlessButtonStyle())
        .textFieldStyle(PlainTextFieldStyle())
    }
    @ViewBuilder
    func mainContent() -> some View{
        VStack{
            HStack(spacing: 10){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
                TextField("Search", text: .constant(""))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(isMacOS ? 0 : 10)
            .overlay(
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height:1)
                    .padding(.horizontal, -25)
                    .offset(y:6)
                ,alignment: .bottom)
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("Notes")
                        .font(isMacOS ? .system(size: 33,weight: .bold) : .largeTitle.bold())
                        .frame(maxWidth: .infinity,alignment: .leading)
                    let columns = Array(
                        repeating: GridItem(.flexible(),spacing: isMacOS ? 25 :15) , count: isMacOS ? 3: 1)
                    LazyVGrid(columns: columns,spacing: 25, content: {
                        ForEach(notes){note in
                            cardView(note: note)
                        }
                    })
                    .padding(.top,30)
                }
                .padding(.top, isMacOS ? 45 : 30)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:  .top)
        .padding(.top, isMacOS ? 40:0)
        .padding(.horizontal,25)
    }
    @ViewBuilder
    func cardView(note: NoteModel) -> some View{
        VStack{
            Text(note.note)
                .font(isMacOS ? .title3 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity,alignment: .leading)
            Spacer()
            HStack{
                Text(note.date, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Spacer(minLength: 0)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 15,weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                })
            }
            .padding(.top,55)
            
        }
        .padding()
        .background(note.color)
        .cornerRadius(18)
    }
    @ViewBuilder
    func SideBar() -> some View{
        VStack{
#if os(macOS)
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            
            AddButton()
                .zIndex(1)
#endif
            VStack(spacing:15){
                ForEach(noteColors,id: \.self){color in
                    Circle()
                        .fill(color)
                        .frame(width:isMacOS ? 20:25,height:isMacOS ? 20:25)
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil: 0)
            .opacity(showColors ? 1:0)
            .zIndex(0)
#if os(iOS)
            AddButton()
                .zIndex(1)
#endif
        }
#if os(macOS)
        .frame(maxHeight:.infinity,alignment: .top)
        .padding(.vertical)
        .padding(.horizontal,22)
        .padding(.top,35)
#else
        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
        .background(
            BlurView(style: .systemUltraThinMaterial)
                .opacity(showColors ? 1: 0)
                .ignoresSafeArea()
        )
#endif
    }
    @ViewBuilder
    func AddButton()-> some View{
        Button(action: {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)){
                self.showColors.toggle()
                self.animateButton.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.spring()){
                    self.animateButton.toggle()
                }
            }
        }, label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .scaleEffect(self.animateButton ? 1.1: 1)
                .padding(isMacOS ? 12: 15)
                .background(Color.black )
                .clipShape(Circle())
        })
        .rotationEffect(.init(degrees: self.showColors ? 45:0))
        .scaleEffect(self.animateButton ? 1.1: 1)
        .padding(.top,30)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
        //            .previewDevice(PreviewDevice(rawValue: "mac"))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .preferredColorScheme(.light)
    }
}
