import Foundation

//🟥Setの実験
////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍔p268   集合の型と初期値
//var s: Set<String>
//s = ["フランダース", "フランドル", "フランシスカ"]
//var e = Set<Int>()
//var t = Set<Int>(0..<8)

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>シーケンス型を引数にできるだと！？
//let drinks = Set<String>(["bear","wine","sake"])
//print(drinks)

////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍔p269   要素へのアクセス
//let nums =  Set(0..<8)
//for num in nums {
//    print(num, terminator: "　")
//}
//nums.first//3を出力

////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>文字
//let fruits: Set<String> = ["remon", "apple", "grap", "peach"]
//for fruit in fruits {
//    print(fruit, terminator:  "　")
//}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍔p270  タプルを含まないデータモデル型
//struct Person: Hashable {
//    let name: String
//    let age: Int
//}
//
//let persons: Set<Person> = [
//    Person(name: "ひろ", age: 31),
//    Person(name: "ひろ", age: 31),
//    Person(name: "まこ", age: 30),
//    Person(name: "ままこ", age: 30),
//    Person(name: "まさ", age: 29),
//    Person(name: "まさ", age: 28)
//
//]
//for person in persons {
//    print(person, terminator: "🍹")
//}

//================================🍹まとめて渡したいときに使用by yamadaさん
//let test1 = 1 //Aから渡ってくる
//let test2 = "a"//Bから渡ってくる
//let test3: TestEnum = .hogehoge
//let tuple = (test1, test2, test3)

//=================================

//struct Person: Hashable, CustomStringConvertible {
//    enum Sex: String { case male = "M", female = "F" }
//    let name: String
//    var attr: (age: Int, sex: Sex) //ハッシャブルに適合していない
//    init(_ name: String, _ age: Int, _ sex: Sex){
//        self.name = name
//        self.attr = (age: age ,sex: sex)
//    }
//    static func ==(lhs: Person, rhs: Person) -> Bool {
//        return lhs.attr == rhs.attr && lhs.name == rhs.name
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(attr.age)
//    }
//    var description: String {
//        name + "🍔歳は『\(attr.age)』,性別は『\(attr.sex.rawValue)』🍹"
//    }
//}
//
//let sako = Person("sako", 31, Person.Sex.male)
//let mako = Person("mako", 31, Person.Sex.male)
//let maho = Person("maho", 31, Person.Sex.female)
//let hiro = Person("sako", 31, Person.Sex.male)
//let ryoko = Person("ryoko", 29, Person.Sex.female)
//let personArray:Set<Person> = [
//    sako,mako,maho,hiro,ryoko
//]
//print(personArray)
//---------------------------------------------------------型同士の比較(オリジナル)
//試しに自分で作ったやつ
//struct Human: Equatable,Hashable {
//    enum Sex: String { case male = "M", femal = "F"}
//    var name: String
//    var attr: (age: Int, sex: Sex)
//    static func ==(lhs: Human, rhs: Human) -> Bool{
//        return lhs.name == rhs.name || lhs.attr == rhs.attr
//    }
//    //🍔エラー：イミュータブルな値に対してミューティング・メンバーを使用できない： 'hasher' は 'let' 定数である。
////    func hash(hasher: Hasher) {
////        hasher.combine(name)
////        hasher.combine(attr.age)
////    }
//    func hash(into hasher: inout Hasher) {//これで解決。ただintoの役割がわからん。Hasher型に関係ありか？
//        hasher.combine(name)
//        hasher.combine(attr.age)
//    }
//}
////
////let sako = Human(name: "sako", attr: (age: 31, sex: Human.Sex.male))
////let mako = Human(name: "mako", attr: (age: 31, sex: Human.Sex.male))
////print(sako == mako)
//
////var personSet:Set<Human> = [
////    Human(name: "🍔sako", attr: (age: 30, sex: Human.Sex.male)),
////    Human(name: "🍹mako", attr: (age: 31, sex: Human.Sex.male)),
////    Human(name: "🍟masa", attr: (age: 31, sex: Human.Sex.male)),
////    Human(name: "🍟masa", attr: (age: 31, sex: Human.Sex.male))
////]
////print(personSet)
//var array: Set<String> = ["🍇","🍎","🍋","😀"]
//let human = ["😃","😀","🙃",]
////personSet.union(array)
////集合に、other にも含まれる要素がすでに 1 つ以上ある場合は、既存のメンバが保持される。other に等価な要素の複数のインスタンスが含まれる場合は、最初のインスタンスのみが保持されます。
//array.formUnion(human)
//array.union(human)
//print(array)
//---------------------------------------------------------🍔p271　集合演算
//var array:Set<String> = Set.init()//初期化[]
//array.isEmpty//true
//let furits02 = ["もも","なし","ライチ"]
//let fruits = ["りんご","もも","なし"]
//var array2 = array.union(fruits)
//
//print(array)
//print(array2)//["りんご","なし","もも"]
//array2.contains("りんご")//true
//array2.remove("りんご")
//print(array2)//["なし", "もも"]
//array2.isSubset(of: furits02)//true
////🍔array2の["なし", "もも"]と全く同じ要素を持っているか、
////     ["なし", "もも"]＋他の持っていない要素を持っている場合にtrueを返す。
//----------------------------------------🍹Setのメソッド検証🍹
//🍹🍹上のメソッドはSet型を返す。下は何も返さないメソッド。
//上persons1.union(persons2)は大元の配列を書き換えない。 下はpersons1.formUnion(persons2)で大元の配列を書き換える。

//var persons1: Set<String> = []
//persons1 = ["さこ", "まこ", "まさ"]
//let persons2 = ["さこ", "こーへい", "しんご"]
//>>>>>>>>>>>>>>>>>>>>>>>>>>A.union(B)-> Set, A.formUnion(B)
//persons1.union(persons2)  //🍟["さこ", "まこ", "まさ", "こーへい", "しんご"]
//persons1.formUnion(persons2)
//>>>>>>>>>>>>>>>>>>>>>>>>>>A.subtracting(B)-> Set, A.subtract(B)
//persons1.subtracting(persons2) //🍟 {"まこ", "まさ"}
//persons1.subtract(persons2)
//>>>>>>>>>>>>>>>>>>>>>>>>>>A.intersection(B)-> Set, A.formIntersection(B)
//persons1.intersection(persons2) //🍟{"さこ"}
//print(persons1)//["さこ", "まこ", "まさ"]
//let intersectionMember = persons1.intersection(persons2)//大元のpersons1を書き換えることはできない。
//print(intersectionMember)//{"さこ"}
//persons1.formIntersection(persons2) //大元のpersons1を書き換えることができる。
//print(persons1)

//>>>>>>>>>>>>>>>>>>>>>>>>>>A.symmetricDifference(B)-> Set, A.formSymmetricDifference(B)
//persons1.symmetricDifference(persons2)
//persons1.formSymmetricDifference(persons2)

