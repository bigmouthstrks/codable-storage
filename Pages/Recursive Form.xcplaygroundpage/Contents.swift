import Foundation

// MARK: - FormResponse
struct FormResponse: Codable {
	var fields: [Field]
	var viewType: String
	
	func parse<T: Codable>() -> T? {
		let encoder = JSONEncoder()
		let decoder = JSONDecoder()
		
		encoder.keyEncodingStrategy = .convertToSnakeCase
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		do {
			let data = try encoder.encode(self)
			let newObject = try decoder.decode(T.self, from: data)
			
			print(newObject)
			
			return newObject
		} catch {
			print("no funcionó")
		}
		
		return nil
	}
}

// MARK: - Field
struct Field: Codable {
	var name: String
	var type: String
	var values: [Field]?
	var id: String?
}

// MARK: - AppFormResponse
struct AppFormResponse: Codable {
	var fields: [AppField]
	var viewType: String
}

// MARK: - AppField
struct AppField: Codable {
	var name: String
	var type: String
	var values: [AppField]?
	var id: String?
}

let field1 = Field(name: "Email", type: "email")
let field2 = Field(name: "Password", type: "password")
let fieldsContainer = Field(name: "User Data", type: "Container", values: [field1, field2])
let form = FormResponse(fields: [fieldsContainer], viewType: "Login")

let newForm: AppFormResponse? = form.parse()

print(newForm)
