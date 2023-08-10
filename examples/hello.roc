app "example-app"
    packages { pf: "../platform/main.roc" }
    imports []
    provides [program] {  } to pf

init = \_ -> { text: "Hello, World!" }

update = \model, _ -> model

render = \model -> [
    Text { 
        text: model.text, 
        top: 0, 
        left: 0, 
        size: 40, 
        color: { r: 1, g: 1, b: 1, a: 1 } 
    }
]

program = { init, update, render }
