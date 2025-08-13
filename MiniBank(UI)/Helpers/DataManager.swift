import Foundation



class DataManager {
    
    enum UserDefaultsType: String, CaseIterable { /// CaseIterable --- Enum-i for-a salmaq ucun
        case email
        case password
        case isLoggedIn = "isLoggedIn"
    }

    func saveData(value: Any, key: UserDefaultsType) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
        
    func getData(key: UserDefaultsType) -> Any? {
        UserDefaults.standard.object(forKey: key.rawValue)
    }
        
    func getBool(key: UserDefaultsType) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
        
    func removeAllData() {
        for key in UserDefaultsType.allCases {
            UserDefaults.standard.removeObject(forKey: key.rawValue)
        }
    }
}
