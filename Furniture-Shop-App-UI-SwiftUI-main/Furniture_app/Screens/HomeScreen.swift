//
//  HomeScreen.swift
//  Furniture_app
//
//  Base by Abu Anwar MD Abdullah on 14/2/21.
//  Edited by Jessica Luo & Akshara 3/12/22
//

import SwiftUI
import RealmSwift
//struct products{
//    let item1 = Item(t: "jacket", s: "S", c: "lightly used", i: 1, d : 25)
//    let item2 = Item(t: "kid's shirt", s: "M", c: "used with signs of wear", i: 2, d: 5)
//    let item3 = Item(t: "dress", s: "M", c: "used with signs of wear", i: 3, d:180)
//    let item4 = Item(t: "sandals", s: "7", c: "new", i: 4, d: 50)
//    var products : [Item] = []
//
//    init(){
//        products = [item1, item2, item3, item4]
//    }
//
//    func get(index: Int) -> Item{
//        return products[index]
//    }
//}
class sheetProducts: Object{
    let defaultRealm = try! Realm()
    
    
}
struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    private let categories = ["All", "Tops", "Bottoms", "Outerwear", "Shoes", "Accessories"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        //let allproducts = products()
                        let item1 = Item(t: "jacket", s: "S", c: "lightly used", i: 1, d : 25, brand: "Pendleton")
                        let item2 = Item(t: "kid's shirt", s: "M", c: "used with signs of wear", i: 2, d: 5, brand: "Jurassic Park")
                        let item3 = Item(t: "dress", s: "M", c: "used with signs of wear", i: 3, d:180, brand: "Balenciaga")
                        let item4 = Item(t: "sandals", s: "7", c: "new", i: 4, d: 50, brand: "Nike")
                        let products = [item1, item2, item3, item4]
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: DetailScreen(item: products[i]),
                                        label: {
                                            ProductCardView(size: 210, product: products[i])
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: DetailScreen(item: products[3-i]),
                                        label: {
                                            ProductCardView(size: 180, product: products[3-i])
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
//                                ForEach(0 ..< 4) { i in
//                                    ProductCardView(size: 180, product: products[3-i])
//                                }
//                                //ProductCardView(image: Image("shoes_1"), size: 180)
//                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
        }
//        .navigationBarTitle("") //this must be empty
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
//            Button(action: {}) {
//                Image(uiImage: #imageLiteral(resourceName: "Profile"))
//                    .resizable()
//                    .frame(width: 42, height: 42)
//                    .cornerRadius(10.0)
//            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("i")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Cycle")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Clothes", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
//    let image: Image
    let size: CGFloat
    let product: Item
    
    var body: some View {
        VStack {
            let image = Image(product.photo)
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text(product.type).font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$\(product.price)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("fav"), action: {})
            BottomNavBarItem(image: Image("shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
