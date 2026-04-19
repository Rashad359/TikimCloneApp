//import SwiftUI
//
//struct SellerView2: View {
//    
//    let imageHeight: CGFloat = 250
//    
//    let sections: [SellerSection] = [
//        SellerSection(title: "Sementler", items: [
//            SellerItemModel(),
//            SellerItemModel(),
//            SellerItemModel()
//        ]),
//        SellerSection(title: "Borular", items: [
//            SellerItemModel(),
//            SellerItemModel(),
//            SellerItemModel(),
//            SellerItemModel()
//        ])
//    ]
//    
//    var body: some View {
//        ZStack {
//            Color.baseBackground
//                .ignoresSafeArea()
//            
//            ScrollView(showsIndicators: false) {
//                VStack(spacing: 0) {
//                    
//                    // MARK: - Parallax Image
//                    GeometryReader { geo in
//                        let offsetY = geo.frame(in: .global).minY
//                        let isScrollingDown = offsetY > 0
//                        let progress = max(-offsetY / imageHeight, 0)
//                        let scale = max(1 - progress * 0.15, 0.85)
//                        let opacity = max(1 - progress * 1.2, 0)
//                        
//                        Image("sellerTemplate")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(
//                                width: geo.size.width,
//                                height: isScrollingDown
//                                ? imageHeight + offsetY
//                                : imageHeight * scale
//                            )
//                            .clipShape(
//                                ArcBottomShape(arcHeight: 60)
//                            )
//                            .opacity(opacity)
//                            .offset(y: isScrollingDown ? -offsetY : 0)
//                    }
//                    .frame(height: imageHeight)
//                    // MARK: - Content
//                    VStack(alignment: .leading, spacing: 20) {
//                        sellerBanner
//                            .padding(.top, 12)
//                        
//                        ForEach(sections) { section in
//                            SellerHeaderView(title: section.title)
//                            
//                            ForEach(section.items) { item in
//                                SellerItem()
//                                    .background(Color.white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 8))
//                            }
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 40)
//                    .padding(.top, -100)
//                }
//            }
//            .ignoresSafeArea(edges: .top)
//        }
//    }
//}
//
//#Preview {
//    SellerView2()
//}
//
//extension SellerView2 {
//    private var sellerBanner: some View {
//        VStack {
//            Image("logoTemplate")
//                .padding(.top, 12)
//                .padding(.bottom, 6)
//            
//            VStack(spacing: 4) {
//                Text("NORM Sirketi")
//                
//                Text("Sement ve insaat mehsullari")
//                
//                Text("09:00 - 23:00")
//            }
//            
//            Divider()
//                .padding(.horizontal, 12)
//            
//            HStack {
//                HStack {
//                    Image("locationIcon")
//                    
//                    Text("Adresse bax")
//                }
//                
//                Spacer()
//                
//                HStack {
//                    Image("phoneIcon")
//                    
//                    Text("Elaqe saxla")
//                }
//            }
//            .padding(.horizontal, 12)
//            .padding(.bottom, 12)
//            
//        }
//        .frame(maxWidth: .infinity)
//        .background(
//            RoundedRectangle(cornerRadius: 16)
//                .fill(Color.white)
//        )
//    }
//}
//
//struct ArcBottomShape: Shape {
//    var arcHeight: CGFloat = 24
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        
//        // Arc across the bottom
//        path.addQuadCurve(
//            to: CGPoint(x: rect.minX, y: rect.maxY),
//            control: CGPoint(x: rect.midX, y: rect.maxY + arcHeight)
//        )
//        
//        path.closeSubpath()
//        return path
//    }
//}
