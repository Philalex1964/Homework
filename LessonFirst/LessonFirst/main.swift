import Foundation

func test () {
    print(1)
    testSecond ()
}

func testSecond () {
    print(2)
}


var array = [1,2,3,4,5,1,2,3,4,5]
array.append(4)
array.append(5)
print(array)
var value : Set<Int> = [1,2,3,4,5,1,2,3,4,5]
var valueSecond : Set<Int> = [1,4,25,101]
print(value.subtracting(valueSecond))
test()
print(123)


