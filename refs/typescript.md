# JavaScript/TypeScript

This document contains JavaScript/TypeScript notes.

Contents:
* [Array](#array)
* [DOM](#dom)
* [OOP](#oop)
* [References](#references)

## Some practical tips

*   *Boolean coercion* (the following expressions return false, all others return
    true)

    ```typescript
    Boolean(false)
    Boolean("")
    Boolean(0); Boolean(-0); Boolean(-0); Boolean (0n)
    Boolean(undefined); Boolean(null); Boolean(Null)
    ```

*   *Opaque types* in TypeScript: avoid mix-ups between different types of the
    same base type (e.g. string or number)

    // TODO: add more details later

    ```typescript
    // Simpler example:
    type ProductId = string & { readonly brand: unique symbol };
    function createProductId(id: string): ProductId {
        return id as ProductId;
    }
    function processProduct(id: ProductId) {
        console.log("Processing...", id);
    }
    const productId: ProductId = createProductId("abcd1234");
    console.log(productId);     // print "abcd1234"
    processProduct(productId);  // print "Processing... abcd1234"

    // A more complex example:
    declare namespace Tag {
        const OpaqueTagSymbol: unique symbol;

        class OpaqueTag<T> {
            private [OpaqueTagSymbol]: T;
        }
    }
    type Id<T extends _HasId> = string & Tag.OpaqueTag<T>;
    // usage
    Id<User> = string & Tag.OpaqueTag<User>;
    Id<Product> = string & Tag.OpaqueTag<Product>;
    const userId: Id<User> = "user-123" as Id<User>;
    const productId: Id<Product> = "user-123" as Id<Product>;
    console.log(userId === productId);  // returns false
    ```

    [Example in more details](./typescript/opaqueTag.ts)

*   *Spread Operator*

    [Spread syntax - MDN][1]

    ```typescript
    // array
    const arr1 = [1, 2, 3];
    const arr2 = [11, 12, 13];
    const expanded = [...arr1, 4, 5]; // [1,2,3,4,5]
    const combined = [...arr1, ...arr2]; // [1,2,3,11,12,13]
    // object
    const obj1 = { x: 1 }
    const obj2 = { ...obj1, y: 2} // { x: 1, y: 2 }
    const obj3 = { ...obj2, y: 3} // { x: 1, y: 3 }
    // string
    const chars = [..."abc"] // ["a", "b", "c"]
    // type and tuple
    type A = [number, string]
    type B = [...A, boolean]
    const a: A = [1, "a"];
    const b: B = [42, "hat", false]
    ```

*   *Shallow and Deep Copy* of Array

    ```typescript
    // array of primitive data
    const arr = [1, 2, 3];
    const deep = [...arr];
    const shallow = arr;

    deep[0] = 2;
    console.log(arr[0]);        // 1
    console.log(shallow[0]);    // 1
    console.log(deep[0]);       // 2

    shallow[0] = 100;
    console.log(arr[0]);        // 100
    console.log(shallow[0]);    // 100
    console.log(deep[0]);       // 2

    // array of objects (array stores pointers)
    const arrObjs = [{ x: 1 }, { y: 2 }];
    const newArr = [...arrObjs];

    newArr[0].x = 99;
    console.log(arrObjs[0].x);  // 99
    console.log(newArr[0].x);   // 99
    ```

*   *Shallow and Deep Copy* of Objects

    ```typescript
    const obj = { x: 1 ,  y: 2 };
    const deep = {...obj};
    const shallow = obj;

    deep.x = 99;
    console.log(obj.x);         // 1
    console.log(shallow.x);     // 1
    console.log(deep.x);        // 99

    deep.x = 42;
    console.log(obj.x);         // 42
    console.log(shallow.x);     // 42
    console.log(deep.x);        // 99
    ```

*   *Type-checking variables*

    *    primitive types

         ```typescript
         console.log(typeof 42)          // "number"
         console.log(typeof "hello")     // "string"
         console.log(typeof true)        // "boolean"
         console.log(typeof undefined)   // "undefined"
         console.log(typeof Symbol())    // "symbol"
         console.log(typeof 42n)         // "bigint"
         console.log(typeof null)        // "object"
         console.log(typeof (() => {}))  // "function"
         // any other object             // "object"
         console.log(typeof new String("string"))  // "object"
         console.log(typeof new Number(100))       // "object"
         console.log(typeof new Function())        // "function"
         ```

         Why `typeof null === "object`? [Type tag for null (0x00) collides with
         the type tag for object (0).][3]

    *   objects

        ```typescript
        object instanceof constructor  // syntax of `instanceof`
        // returns true if constructor.prototype appears in the prototype chain
        //   of the object
        ```

    *   classes
    *   custom types

*   *Prototype chain*

    [Inheritance and the prototype chain][4]

    1.  Inheritance with the prototype chain

        ```typescript
        // 1.1 Inheriting properties
        const o = {
            a: 1,
            b: 2,
            // __proto__ sets the [[Prototype]]. It's specified here
            // as another object literal.
            __proto__: {
                b: 3,
                c: 4,
                __proto__: {
                d: 5,
                },
            },
        };

        // { a: 1, b: 2 } ---> { b: 3, c: 4 } ---> { d: 5 } ---> Object.prototype ---> null
        console.log(o.d); // 5


        // 1.2 Inheriting "methods"
        const parent = {
            value: 2,
            method() {
                return this.value + 1;
            },
        };

        console.log(parent.method()); // 3
        // When calling parent.method in this case, 'this' refers to parent

        // child is an object that inherits from parent
        const child = {
            __proto__: parent,
        };
        console.log(child.method()); // 3
        // When child.method is called, 'this' refers to child.
        // So when child inherits the method of parent,
        // The property 'value' is sought on child. However, since child
        // doesn't have an own property called 'value', the property is
        // found on the [[Prototype]], which is parent.value.

        child.value = 4; // assign the value 4 to the property 'value' on child.
        // This shadows the 'value' property on parent.
        // The child object now looks like:
        // { value: 4, __proto__: { value: 2, method: [Function] } }
        console.log(child.method()); // 5
        // Since child now has the 'value' property, 'this.value' means
        // child.value instead
        ```

    1.  Constructor

        ```typescript
        // 2.1 - Constructor function
        function Box(value) {
            this.value = value;
        }

        //   Properties all boxes created from the Box() constructor will have
        Box.prototype.getValue = function () {
            return this.value;
        };

        const boxes = [new Box(1), new Box(2), new Box(3)];

        //   Mutate Box.prototype after an instance has already been created.
        //     However, re-assigning `Constructor.prototype` is a bad practice
        Box.prototype.getValue = function () {
            return this.value + 1;
        };

        boxes[0].getValue();  // 2

        //   Rewritten in a class
        class Box {
            constructor(value) {
                this.value = value;
            }

            // Methods are created on Box.prototype
            getValue() {
                return this.value;
            }
        }


        // 2.2 - Building a longer prototype chain
        function Base() {}
        function Derived() {}
        Object.setPrototypeOf(Derived.prototype, Base.prototype);  // instance properties
        Object.setPrototypeOf(Derived, Base);                      // static properties
        // TODO: compare static and instance properties
        // Note: don't set prototype like:  `Derived.prototype = Object.create(Base.prototype)`

        const obj = new Derived();
        // obj ---> Derived.prototype ---> Base.prototype ---> Object.prototype ---> null

        //   Rewrite in classes
        class Base {}
        class Derived extends Base {}
        const obj = new Derived();
        // obj ---> Derived.prototype ---> Base.prototype ---> Object.prototype ---> null
        ```

*   *Callable and Newable interface*

    ```typescript
    interface Nuke {
        new(id: string): Nuke;      // Nuke is newable via `new Nuke(id)`
        (id: string): Nuke;         // Nuke is callable via `Nuke(id)`
    }
    ```

## Array

See [Array - MDN Documentation][2]

## DOM
```javascript
function addElement() {
  const newElem = document.createElement("div");
  newElem.textContent = "text under div";
  document.querySelector(".main").append(newElem);
}

function headingListenToClick() {
  document.querySelector("h1").addEventListener("click", changeRed);
}

function changeRed(e) {
  console.log(e.target);
  e.target.style.color = "red";
}

// jQuery
$(function () {
  const id = $("#task");
  $(".main").append("<div>text under div</div>");
  $("h1").on("click", changeRed);
});
```

## OOP

```javascript
// ======== Eloquent JS ========
// Symbol
let id1 = Symbol("id");
let id2 = Symbol("id");
console.log(id1 === id2); // returns false

let user = { name: "John" };
user.id1 = 1;
user[id1] = 11;
console.log(user); // returns { name: "John", id1: 1, [Symbol(id)]: 11}

console.log(user.id1 === user["id1"]); // returns true for normal key
console.log(user.id1); // returns 1
console.log(user[id1]); // returns 11

// Global Symbol
let newId1 = Symbol.for("newId");
let newId2 = Symbol.for("newId");
console.log(newId1 === newId2); // returns true

console.log(Symbol.for("id")); // returns Symbol(id)
console.log(Symbol.keyFor(newId1)); // returns "newId"
console.log(Symbol.keyFor(newId2)); // returns "newId"

// Java Iterable interface
// Iterable has a method that returns an Iterator
// Iterator has methods hasNext() and next()

/**
 * public interface Iterable<Item> {
 *  Iterator<Item> iterator();
 * }
 */

/**
 * public interface Iterator<Item> {
 *  boolean hasNext();
 *  Item next();
 * }
 */

// JavaScript iterable
// iterable has a method that returns an iterator
// iterator has methods next() that returns object in forms of
// { value: xxx, done: false }
let okIterator = "OK"[Symbol.iterator]();
console.log(okIterator.next()); // → {value: "O", done: false}
console.log(okIterator.next()); // → {value: "K", done: false}
console.log(okIterator.next()); // → {value: undefined, done: true}

let arr = [1, 2, 3];
let arrIterator = arr[Symbol.iterator]();
console.log(arrIterator.next()); // → {value: 1, done: false}
console.log(arrIterator.next()); // → {value: 2, done: false}
console.log(arrIterator.next()); // → {value: 3, done: false}
console.log(arrIterator.next()); // → {value: undefined, done: true}

// customized iterator
let range = { from: 1, to: 5 };
range[Symbol.iterator] = () => {
  return {
    current: this.from,
    last: this.to,
    next() {
      if (this.current <= this.last) {
        return { done: false, value: this.current++ };
      } else {
        return { done: true };
      }
    },
  };
};

for (let num of range) {
  console.log(num);
}
```

## Functions

```javascript
/*
three ways to declare a function in JavaScript:

1. function declaration
  - not part of regular top-to-bottom flow of control
  - can be called even before the declaration
  - no semicolon at end

  function myFunction(para) {
    <function body>
  }

2. function as values (regular binding)
  - semicolon required

  let myFunc = function(para) {
    <function body>
  }

3. arrow function

  const myFunc = (para) => {
    <function body>
  }

*/

const solution = (nums) => {
  return 0;
};

exports.solution = solution;
```

## References
*   [fff]()

[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax
[2]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof#typeof_null
[4]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain
