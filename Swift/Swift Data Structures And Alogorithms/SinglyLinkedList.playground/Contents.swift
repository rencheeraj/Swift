import UIKit
import Foundation

public class Node<Value>{
    public var value : Value
    public var next : Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct Linkedlist<Value>{
    
    public var head : Node<Value>?
    public var tail : Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool{
        return head == nil
    }
    
    public mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil{
            tail = head
        }
        printDeatils()
    }
    public func printDeatils(){
        if let head = head{
            print(head.value)
        }else{
            print("Head is \(String(describing: head?.value))")
        }

        if let tail = tail{
            print(tail.value)
        }else{
            print("tail is \(String(describing: tail?.value))")
        }
    }
}

var list = Linkedlist<Int>()
list.push(6)
list.push(8)


