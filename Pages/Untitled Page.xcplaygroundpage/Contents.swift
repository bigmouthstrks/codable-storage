//
//final class Storage: BaseStorage, CodableStorage {
//	func store(_ audit: Audit) { append(audit, key: "auditsKey") }
//	func getAudits() -> [Audit]? { return getArray(key: "auditsKey") }
//}
//
//// MARK: - CodableStorage
//protocol CodableStorage: BaseStorage{
//	var encoder: JSONEncoder { get }
//	var decoder: JSONDecoder { get }
//
//	func save(_ object: Encodable, key: String)
//	func append<T: Codable>(_ object: T, key: String)
//	func get<T: Decodable>(key: String) -> T?
//	func getArray<T: Codable>(key: String) -> [T]?
//}
//
//// MARK: - CodableStorage
//extension CodableStorage {
//	var encoder: JSONEncoder { return JSONEncoder() }
//	var decoder: JSONDecoder { return JSONDecoder() }
//
//	func save(_ object: Encodable, key: String) {
//		do {
//			let data = try encoder.encode(object)
//			storage.set(data, forKey: key)
//		} catch let error {
//			print(error)
//		}
//	}
//
//	func append<T: Codable>(_ object: T, key: String) {
//		do {
//			var objectsArray: [T]?
//
//			if let arrayData = storage.data(forKey: key) {
//				objectsArray = try decoder.decode([T].self, from: arrayData)
//				objectsArray?.append(object)
//			} else {
//				objectsArray = []
//			}
//
//			let data = try encoder.encode(objectsArray)
//			storage.set(data, forKey: key)
//		} catch let error {
//			print(error)
//		}
//	}
//
//	func getArray<T: Codable>(key: String) -> [T]? {
//		do {
//			guard let data = storage.data(forKey: key) else { return [] }
//			let array = try decoder.decode([T].self, from: data)
//
//			return array
//		} catch let error {
//			print(error)
//		}
//
//		return []
//	}
//
//	func get<T: Decodable>(key: String) -> T? {
//		do {
//			let data = storage.data(forKey: key) ?? Data()
//			let object = try decoder.decode(T.self, from: data)
//
//			return object
//		} catch let error {
//			print(error)
//		}
//
//		return nil
//	}
//}
//
//// MARK: - BaseStorage
//protocol BaseStorage {
//	var storage: UserDefaults { get }
//}
//
//// MARK: - BaseStorage
//extension BaseStorage {
//	var storage: UserDefaults {
//		return UserDefaults.standard
//	}
//}
//
//// MARK: - Audit
//struct Audit: Codable {
//	var name: String
//}
//
//
//let audit = Audit(name: "Purchase Audit")
//
//let storage = Storage()
//let audits = storage.getAudits()
//
//audits?.forEach {
//	print($0.name)
//}

//extension String {
//	func formatAsCarPlate() -> (String, String, String) {
//		var textAsArray = Array(self)
//
//		var firstPair = "\(textAsArray[0])\(textAsArray[1])"
//		var secondPair = "\(textAsArray[2])\(textAsArray[3])"
//		var thirdPair = "\(textAsArray[4])\(textAsArray[5])"
//
//		return (firstPair, secondPair, thirdPair)
//	}
//}
//
//var originalPlate = "KD34OL"
//var formattedPlate = originalPlate.formatAsCarPlate()
//
//
//print(formattedPlate)
//
//let parameters = [
//	"identifier": "benjamin.caceres.ra@gmail.com",
//	"password": "isopropyl360",
//	"id_option": "email",
//	"device_code": "d24kj35l2kj2342"
//]
//
//do {
//	let jsonParameters = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//
//	print(jsonParameters)
//} catch {
//	print("Something went wrong")
//}

class Person {
	var name: String?
}

struct PersonStruct {
	var name: String?
}

var firstClass = Person()
firstClass.name = "FIRST CLASS"

var secondClass = firstClass
secondClass.name = "SECOND CLASS"

var firstStruct = PersonStruct()
firstStruct.name = "FIRST STRUCT"

var secondStruct = firstStruct
secondStruct.name = "SECOND STRUCT"

print(firstClass.name)
print(secondClass.name)
print(firstStruct.name)
print(secondStruct.name)
