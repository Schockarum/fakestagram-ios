import Foundation

class AccountRepo {
    static let shared = AccountRepo()
    private let client = AccountClient()
    private let storage = CodableStorage<Account>(filename: "account.json")
    
    typealias accountResponse = (Account) -> Void
    
    func loadOrCreate(success: accountResponse?) {
        if let account = load() {
            success?(account)
            return
        }
        
        let newAccount = Account.initialize()
        
        create(newAccount) { [weak self] account in
            success?(account)
            _ = self?.storage.save(data: account)
        }
    }
    
    func load() -> Account? {
        return storage.load()
    }
    
    func create(_ account: Account, success: @escaping (Account) -> Void) {
        client.create(codable: account, success: success)
    }
}
