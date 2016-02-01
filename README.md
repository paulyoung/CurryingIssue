# Currying Issue

A project to demonstrate how breaking up an expression into distinct sub-expressions causes a build error.

```diff
extension Foo: Decodable {
    public static func decode(json: JSON) -> Decoded<Foo> {
-        return curry(self.init)
+        let f = curry(self.init)
            <^> (json <| "created_at" >>- toNSDate)
+        return f
            <*> (json <| "updated_at" >>- toNSDate)
    }
}
```

`Cannot convert value of type 'Decoded<(NSDate?) -> Foo>' (aka 'Decoded<Optional<NSDate> -> Foo>') to expected argument type 'Decoded<_ -> _>'`

Originally reported in https://github.com/thoughtbot/Argo/issues/193#issuecomment-173830763.

## Usage

Install dependencies with `git submodule update --init --recursive` and then open the `.xcworkspace` and attempt to build the target.
