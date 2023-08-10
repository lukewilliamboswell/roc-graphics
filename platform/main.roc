platform "graphics"
    requires { } { program : Program }
    exposes []
    packages {}
    imports []
    provides [mainForHost]

Rgba : { r : F32, g : F32, b : F32, a : F32 }

Bounds : { height : F32, width : F32 }

KeyCode : [Left, Right, Other, Up, Down]

Event : [
    Resize { width : F32, height : F32 }, 
    KeyDown KeyCode, 
    KeyUp KeyCode, 
    Tick U128,
]

Elem : [
    Rect { color : Rgba, left : F32, top : F32, width : F32, height : F32 }, 
    Text { text : Str, color : Rgba, left : F32, top : F32, size : F32 },
]

# TODO should be provided by App
Model : {
    text : Str
}

Init : Bounds -> Model
Update : Model, Event -> Model
Render : Model -> List Elem

Program : {
    init : Init,
    update : Update,
    render : Render,
}

mainForHost : Program
mainForHost = program
