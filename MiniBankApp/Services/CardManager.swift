import Foundation

class CardManager {
    
    weak var bankApp: BankApp?
    var cards: [Card] = []
    
    //Retain Cycle yaranır - qarşısını almaq üçün weak vermək lazımdır. Dependecy İnjection --- memory leak (strong reference)
    
    
    
    //private(set) --- oxumaq olar, dəyişmək yox

    func showCards(isTransfer: Bool = false) { // default parameter
        
        if cards.isEmpty {
            
            addCard()
            
        } else {
            
            for (index, card) in cards.enumerated() {
                
                let cardName = card.type.rawValue.capitalized
                print("\(index + 1). \(cardName) kartı")
                print("Nömrə: \(card.number)")
                print("Balans: \(card.balance)")
                
            }
            
            if !isTransfer {
               
                print ("0. Yeni Card əlavə et")
                print("00. Geri")
                
                let choose = readLine() ?? ""
                
                if choose == "0" {
                    
                    addCard()
                    
                } else if choose == "00" {
                    
                    if let app = bankApp {
                        app.start()
                    }
                    
                }
                
            } else {
                
                
            }
        }
    }

    func addCard() {
        
        print("Kartın tipini seçin:")
        
        for (index, type) in CardType.allCases.enumerated() {
            print("\(index + 1). \(type.rawValue)")
        }
        
        print("00. Geri")

        var selectedType: CardType?
        
        while selectedType == nil {
            let chooseCardType = readLine() ?? ""
            
            switch chooseCardType {
                case "1":
                    selectedType = .maas
                case "2":
                    selectedType = .yighim
                case "3":
                    selectedType = .gunluk
                case "00":
                    if let app = bankApp {
                        app.start()
                    }
                default:
                    print("Yanlış seçim. Zəhmət olmasa 1, 2, 3 və ya 00 daxil edin.")
            }
            
            break
                
        }

        let number = askInt("Kart nömrəsi (16 rəqəm):", length: 16)
        let deadline = askInt("Kartın son tarixi (4 rəqəm):", length: 4)
        let cvc = askInt("CVC kodu (3 rəqəm):", length: 3)
        
        print("Balans daxil edin:")
        let balance = Int(readLine() ?? "") ?? 0

        let newCard: Card = .init(type: selectedType!, number: number, deadlineDate: deadline, cvc: cvc, balance: balance)
        
        cards.append(newCard)
        print("Kart əlavə olundu")
        
        showCards()
        
    }

    func askInt(_ message: String, length: Int) -> Int {
        while true {
            print(message)
            if let input = readLine(), input.count == length, let num = Int(input) {
                return num
            }
            print("Rəqəm sayına fikir verin.")
        }
    }
}
