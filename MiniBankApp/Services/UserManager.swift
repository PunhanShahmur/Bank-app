import Foundation

class UserManager {
    
    let bankApp: BankApp = BankApp()
    
    var currentUser: User? //private(set) --- oxumaq olar, dəyişmək yox

    func registerUser() {
        print("Ad və soyadınızı daxil edin: ")
        let fullName = readLine() ?? ""

        print("Mailinizi daxil edin: ")
        let email = readLine() ?? ""

        print("Doğum tarixinizi daxil edin: ")
        let birthDate = readLine() ?? ""

        print("Telefon nömrənizi daxil edin: ")
        let phoneNumber = readLine() ?? ""

        while true {
            print("OTP kodunu daxil edin (4 rəqəm): ")
            if let otp = readLine(), otp.count == 4, Int(otp) != nil {
                break
            }
            print("OTP kodu yalniz 4 rəqəmdən ibarət olmalıdır.")
        }

        currentUser = User(fullName: fullName, email: email, birthDate: birthDate, phoneNumber: phoneNumber)
        
        print("İstifadəçi yaratdıldı")
    }

    func showProfile() {
        guard let user = currentUser else { return }
        print("Ad: \(user.fullName)")
        print("Email: \(user.email)")
        print("Doğum tarixi: \(user.birthDate)")
        print("Telefon: \(user.phoneNumber)")
        print("------------------")
        print("0. Proqram bitdi")
        print("00. Geri")
        
        let choose = readLine() ?? ""
        
        if choose == "00" {
            bankApp.start()
        }
    }
}
