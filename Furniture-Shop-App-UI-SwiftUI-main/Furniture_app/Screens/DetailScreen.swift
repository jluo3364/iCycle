//
//  DetailScreen.swift
//  Furniture_app
//
//  Base created by Abu Anwar MD Abdullah on 15/2/21.

import SwiftUI
struct products{
    let item1 = Item(t: "jacket", s: "S", c: "lightly used", i: 1, d : 25, brand: "Pendleton")
    let item2 = Item(t: "kid's shirt", s: "M", c: "used with signs of wear", i: 2, d: 5, brand: "Jurassic Park")
    let item3 = Item(t: "dress", s: "M", c: "used with signs of wear", i: 3, d:180, brand: "Balenciaga")
    let item4 = Item(t: "sandals", s: "7", c: "new", i: 4, d: 50, brand: "Nike")
    var products : [Item] = []

    init(){
        products = [item1, item2, item3, item4]
    }

    func get(index: Int) -> Item{
        return products[index]
    }
}
struct DetailScreen: View {
    var item: Item
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                Image(item.photo)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView(item: item)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$\(item.price)")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let prod = products()
        DetailScreen(item: prod.get(index: 0))
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var item: Item
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(item.type)
                .font(.title)
                .fontWeight(.bold)
            //                Rating
//            HStack (spacing: 4) {
//                ForEach(0 ..< 5) { item in
//                    Image("star")
//                }
//                Text("(4.9)")
//                    .opacity(0.5)
//                    .padding(.leading, 8)
//                Spacer()
//            }
            
//            Text("Description")
//                .fontWeight(.medium)
//                .padding(.vertical, 8)
//            Text("cozy fleece jacket")
//                .lineSpacing(8.0)
//                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text(item.size)
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Condition")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text(item.condition)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //                Colors and Counter
            HStack {
//                VStack (alignment: .leading) {
//                    Text("Colors")
//                        .fontWeight(.semibold)
//                    HStack {
//                        ColorDotView(color: Color(red: 0.808, green: 0.1, blue: 0.23))
//                    }
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
                VStack (alignment: .leading) {
                    Text("Brand")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text(item.brand)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
//                HStack {
//                    //                        Minus Button
//                    Button(action: {}) {
//                        Image(systemName: "minus")
//                            .padding(.all, 8)
//
//                    }
//                    .frame(width: 30, height: 30)
//                    .overlay(RoundedCorner(radius: 50).stroke())
//                    .foregroundColor(.black)
//
//                    Text("1")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .padding(.horizontal, 8)
//
//                    //                        Plus Button
//                    Button(action: {}) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.white)
//                            .padding(.all, 8)
//                            .background(Color("Primary"))
//                            .clipShape(Circle())
//                    }
//                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
