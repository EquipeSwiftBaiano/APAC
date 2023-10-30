import SwiftUI

struct Weeather {
    var day: String
    var condition: String
}

struct Home: View {
    
    let weatherData = [
        Weather(day: "Seg", condition: "30"),
        Weather(day: "Ter", condition: "10"),
        Weather(day: "Quar", condition: "11"),
        Weather(day: "Qui", condition: "12"),
        Weather(day: "Sex", condition: "13"),
        Weather(day: "Sáb", condition: "14"),
        Weather(day: "Dom", condition: "15")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding()
                
                NavigationLink(destination: APACDetailView()) {
                    Text("APAC")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                       
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(weatherData, id: \.day) { weather in
                            VStack {
                                Text(weather.day)
                                    .font(.headline)
                                Spacer()
                                Text(weather.condition)
                                    .font(.subheadline)
                            }
                            .frame(width: 47, height: 100)
                        }
                    }
                    .frame(height: 130)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                    
                    
                )
              
            }
        }
    }
    
    struct APACDetailView: View {
        var body: some View {
            Text("Detalhes do APAC")
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
