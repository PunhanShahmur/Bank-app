import Foundation

struct Card {
    
    let cardName: String
    let cardNumber: String
    let expirationDate: String
    let cvc: String
    let cardType: CardType
    var balance: Double = 100
    
}

enum CardType: String, CaseIterable {
    case salary
    case bonus
    case credit
    
    var cardType: String {
           switch self {
           case .salary: return "Maaş kartı"
           case .bonus: return "Bonus kartı"
           case .credit: return "Kredit kart"
           }
       }
}

