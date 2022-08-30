# BytesJson
Format bytes to json compatible strings.  
Gas usage could be high, consider using it in view functions.  

## requisites:
This library utilize "@openzeppelin/contracts/utils/Strings.sol";
``` 
npm install @openzeppelin/contracts
``` 
  
## importing:
for usage add the library dependence and using statement:
```
    import {BytesJson} from './BytesJson.sol';

    contract BytesJsonUser {
        using BytesJson for *;

        ...
    }
``` 
  
## examples:
refer to [BytesJson.test.js](test/BytesJson.test.js)  
  
### types:
  
  #### null:
```
    return BytesJson.nullType().toJson();           // null
``` 
  
  #### true:
```
    return BytesJson.trueType().toJson();           // true
``` 
  
  #### false:
```
    return BytesJson.falseType().toJson();          // false
``` 
  
  #### string:
```
    return "1".stringType().toJson();               // "1"
``` 
  
  #### uint256:
```
    return 1.uintType().toJson();                   // 1
``` 
  
  #### bytes32:
```
    bytes32 _b = bytes32(0);
    return _b.bytes32Type().toJson();               // "0x0000000000000000000000000000000000000000000000000000000000000000"
``` 
  
  #### address:
```
    address _add = address(0);
    return BytesJson.addressType(_add).toJson();    // "0x0000000000000000000000000000000000000000"
``` 
  
### json property:
```
    return BytesJson.init()
        .prop(
            "key".stringType(),
            "value".stringType()
        ).toJson();                                // 'key':'value'
``` 
  
### json objects:  
```
    return BytesJson.init()
        .object(BytesJson.init()
            .prop(
                "key".stringType(),
                "value".stringType()
            )
        ).toJson();                             // {'key':'value'}
```
  
### objects concatenation:
```
     return BytesJson.init()
        .object(BytesJson.init()
            .prop(
                "key".stringType(),
                1.uintType()
            )
        ).comma()
        .object(BytesJson.init()
            .prop(
                "key".stringType(),
                "value".stringType()
            )
        ).toJson();                            // {'key':1},{'key':'value'}
```
  
### complex objects:
```
    return BytesJson.init()
            .object(BytesJson.init()
                .prop(
                    "author".stringType(),
                    BytesJson.init().object(BytesJson.init()
                        .prop(
                            "id".stringType(),
                            1.uintType()
                        ).comma()
                        .prop(
                            "name".stringType(),
                            "Author name".stringType()
                        ).comma()
                        .prop(
                            "books".stringType(),
                            BytesJson.init().array(BytesJson.init()
                                .object(BytesJson.init()
                                    .prop(
                                        "title".stringType(),
                                        "My first book".stringType()
                                    )
                                ).comma()
                                .object(BytesJson.init()
                                    .prop(
                                        "title".stringType(),
                                        "My second book".stringType()
                                    )
                                ).comma()
                                .object(BytesJson.init()
                                    .prop(
                                        "title".stringType(),
                                        "My third book".stringType()
                                    )
                                )
                            )
                        )
                    )
                )
            ).toJson();                     // {"author":{"id":1,"name":"Author name","books":[{"title":"My first book"},{"title":"My second book"},{"title":"My third book"}]}}
```