# Pine
A language that compiles to HTML code.

The language itself is similar to Javascript in some regards, however it lacks nearly all of its features.

### Example

```
@html{
    @body{
        @h1{
            Header!
        }
        
        @p{
            Paragraph
            
            @div(id="test"){
                This is a div element with the id "test"!
            }
        }
    }
}
```

Compiles to...

```
<html><body><h1>Header!</h1><p>Paragraph<div id="test">This is a div element with the id "test"!</div></p></body></html>
```

### How to Use

Pine uses the Neko VM and the Haxe programming language. If you do not have it installed, please install it from the NekoVM website.

Once you have it installed, you can begin to compile your Pine code.

The only files you need are `pine.n` and `yourcode.pine`.

Now all you have to do is run `neko pine.n yourcode.pine`

This will generate output.html in the same directory.

### Issues

In order to embed Javascript in your Pine code, you need to surround it with 3 tildas on each side. For example:
```
~~~
var test = new Object();
~~~
```

The tildas turn on a flag in the compiler which will stop parsing the code. You can use tildas on Pine characters, such as @, {, and }, to write them in text without conflict from the compiler.
