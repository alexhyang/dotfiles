// opaque types in typescript
// https://www.geeksforgeeks.org/typescript/opaque-types-in-typescript/

type Id<T> = string & Tag.OpaqueTag<T>;

declare namespace Tag {
    const OpaqueTagSymbol: unique symbol;
    class OpaqueTag<T> {
        private [OpaqueTagSymbol]: T;
    }
}

type User = { id: Id<User> }
type Product = { id: Id<Product> }

let firstUser: User = { id: "first" as Id<User> }
let firstProduct: Product = { id: "first" as Id<Product> }

let userId: Id<User> = "123" as Id<User>;
let productId: Id<Product> = "456" as Id<Product>;

console.log(typeof(userId));
console.log(typeof(productId));


function processUserId(id: Id<User>) { console.log("user:", id) }
function processProductId(id: Id<Product>) { console.log("product:", id) }
processUserId(productId); // OK
processProductId(userId); // OK

userId = productId;

console.log(userId == productId);  // true
console.log(userId === productId); // true


// another experiment
// type UserId = string & { readonly brand: unique symbol }
// type ProductId = string & { readonly brand: unique symbol }
type UserId = string & { brand: "UserId" }
type ProductId = string & { brand: "ProductId" }
function createUserId(id: string): UserId {
  return id as UserId;
}
function createProductId(id: string): ProductId {
  return id as ProductId;
}

let anotherUserId = createUserId("user-1234");
let anotherProductId = createProductId("user-1234");

function processUserId2(id: UserId) {
  console.log(id);
}
function processProductId2(id: ProductId) {
  console.log(id);
}

anotherUserId = anotherProductId;
processUserId2(anotherProductId);
processUserId2(userId);
processUserId2("someid" as UserId);
processProductId2(anotherUserId);

