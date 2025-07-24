import Foundation

class BankApp {
    let userManager: UserManager
    let cardManager: CardManager

    init() {
            self.userManager = UserManager()
            self.cardManager = CardManager()
            self.userManager.bankApp = self
            self.cardManager.bankApp = self
        }

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

        cardManager.showCards(isTransfer: true)
        print("Göndərən kartın nömrəsini seçin: (məs.1-ci, 2-ci)")
        let chooseCardIndex = (Int(readLine() ?? "") ?? 0) - 1

        print("Qəbul edən kartın nömrəsini seçin: (məs.1-ci, 2-ci)")
        let transferCardIndex = (Int(readLine() ?? "") ?? 0) - 1

        print("Transfer məbləği:")
        let money = Int(readLine() ?? "") ?? 0

        if chooseCardIndex >= 0, transferCardIndex >= 0,
           chooseCardIndex < cardManager.cards.count, transferCardIndex < cardManager.cards.count,
           chooseCardIndex != transferCardIndex, money > 0, cardManager.cards[chooseCardIndex].balance >= money  {
            
            cardManager.cards[chooseCardIndex].balance -= money
            cardManager.cards[transferCardIndex].balance += money
            print("\(money) manat göndərildi.")
            print("--------------------")
            cardManager.showCards(isTransfer: true)
            
        } else {
            print("Yanlış seçim.")
        }
    }
}
