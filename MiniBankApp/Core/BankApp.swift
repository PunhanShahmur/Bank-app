import Foundation

class BankApp {
    let userManager = UserManager()
    let cardManager = CardManager()

    func start() {
        if userManager.currentUser == nil {
            userManager.registerUser()
        }

        while true {
            print("""
            \n1. Kartlar
            2. Transfer
            3. Profil
            0. Çıxış
            Seçiminizi edon:
            """)
            let choose = readLine()

            switch choose {
            case "1":
                showCardsMenu()
            case "2":
                handleTransfer()
            case "3":
                userManager.showProfile()
            case "0":
                print("Proqramdan çıxıldı")
                return
            default:
                print("Yanlış seçim")
            }
        }
    }

    func showCardsMenu() {
        cardManager.showCards()
        let input = readLine()
        if input == "0" {
            cardManager.addCard()
        }
    }

    func handleTransfer() {
        if cardManager.cards.count < 2 {
            print("Transfer üçün ən az 2 kart olmalıdır")
            return
        }

        cardManager.showCards()
        print("Göndərən kartın nömrəsini seçin:")
        let chooseCardIndex = (Int(readLine() ?? "") ?? 0) - 1

        print("Qəbul edən kartın nömrəsini seçin:")
        let transferCardIndex = (Int(readLine() ?? "") ?? 0) - 1

        print("Transfer məbləği:")
        let money = Int(readLine() ?? "") ?? 0

        if chooseCardIndex >= 0, transferCardIndex >= 0,
           chooseCardIndex < cardManager.cards.count, transferCardIndex < cardManager.cards.count,
           chooseCardIndex != transferCardIndex, money > 0, cardManager.cards[chooseCardIndex].balance >= money  {
            var chooseCard = cardManager.cards[chooseCardIndex]
            var transferCard = cardManager.cards[transferCardIndex]
            
            chooseCard.balance -= money
            transferCard.balance += money
            print("\(money) manat göndərildi.")
            
        } else {
            print("Yanlış seçim.")
        }
    }
}
