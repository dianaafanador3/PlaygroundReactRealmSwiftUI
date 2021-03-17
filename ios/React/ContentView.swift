//
//  ContentView.swift
//  React
//
//  Created by Diana Maria Perez Afanador on 17/3/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var body: some View {
        Text("Test Realm")
            .onAppear(perform: testRealm)
    }
}

@objcMembers class TestObject: Object {
    dynamic var id: ObjectId = ObjectId.generate()
    dynamic var name: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension ContentView {
    func testRealm() {
        let realm = try! Realm()
        let testObject = TestObject()
        testObject.name = "New Name"

        try! realm.write {
            realm.add(testObject)
        }

        let readObjects = realm.objects(TestObject.self)

        print(readObjects)

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
