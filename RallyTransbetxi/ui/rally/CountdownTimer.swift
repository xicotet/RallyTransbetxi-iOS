import SwiftUI

struct CountdownTimerView: View {
    @State private var timeLeft: TimeInterval = DateTimeUtils.secondsUntilStartOfEvent()
    @State private var darkTheme: Bool = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.green, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                )
                .padding(.horizontal, 16)
                .frame(height: 160)
                .overlay(
                    VStack {
                        if timeLeft > 0 {
                            VStack {
                                Text(timeString(from: timeLeft))
                                    .font(.custom("AntaFamily", size: 30))
                                    .foregroundColor(darkTheme ? .white : .black)
                                Image("Ruralnostra")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 16)
                            }
                            .padding(16)
                        }
                    }
                )
            
            if timeLeft <= 0 {
                Image("Ruralnostra")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
        }
        .onReceive(timer) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
            }
        }
    }
    
    private func timeString(from time: TimeInterval) -> String {
        let days = Int(time) / (60 * 60 * 24)
        let hours = (Int(time) / (60 * 60)) % 24
        let minutes = (Int(time) / 60) % 60
        let seconds = Int(time) % 60
        return String(format: "%02dd %02dh %02dm %02ds", days, hours, minutes, seconds)
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView()
    }
}
