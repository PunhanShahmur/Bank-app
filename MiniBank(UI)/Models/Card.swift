import Foundation

struct Card {
    
    let cardName: String
    let cardNumber: String
    let expirationDate: String
    let cvc: String
    let cardType: CardType
    var balance: Double = 0
    
}

enum CardType: String, CaseIterable {
    case salary
    case bonus
    case credit
}

