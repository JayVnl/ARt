import SwiftUI

struct HeaderScrollViewTitle: View {
    let title: String
    let titleColor: Color
    let height: CGFloat
    let largeTitle: Double

    var body: some View {
        let largeTitleOpacity = (max(largeTitle, 0.5) - 0.5) * 2
        let tinyTitleOpacity = 1 - min(largeTitle, 0.5) * 2
        return ZStack {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(titleColor)
                    .fontWeight(.black)
                    .padding(.horizontal, 16)

                Spacer()
            }
            .padding(.bottom, 8)
            .opacity(sqrt(largeTitleOpacity))
            .minimumScaleFactor(0.5)

            ZStack {
                HStack {
                    Text("ARt")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(Font.system(size: 40, design: .serif))
                        .padding(.horizontal, 20)
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.black)
                    }) //: BUTTON
                        .padding(.all, 8)
                        .background(.white)
                        .padding(.horizontal, 20)
                }
                
                
            }
            .padding(.bottom, (height - 18) / 2)
            .opacity(sqrt(tinyTitleOpacity))
        }.frame(height: height)
    }
}
