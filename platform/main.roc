# UNCOMMENT THIS TO USE ROC PLATFORM
platform "graphics"
    requires { Model } { program : _ }
    exposes []
    packages {}
    imports [Game.{ Bounds, Elem, Event }]
    provides [programForHost]

programForHost : {
    init : (Bounds -> Model) as Init,
    update : (Model, Event -> Model) as Update,
    # The T (List Elem) Model is a workaround to stop use-after-free bug from 
    # Roc throwing away long strings on model re-render
    render : (Model -> [T (List Elem) Model]) as Render,
}
programForHost =
    {
        init: program.init,
        update: program.update,
        render: \model ->
            elems = program.render model
            T elems model
    }

# UNCOMMENT THIS TO USE ROC GLUE
# platform "graphics"
#     requires {  } { program : _ }
#     exposes [ Model]
#     packages {}
#     imports [Game.{ Bounds, Elem, Event }]
#     provides [programForHost]

# Model : {}

# programForHost : {
#     init : (Bounds -> Model) as Init,
#     update : (Model, Event -> Model) as Update,
#     render : (Model -> List Elem) as Render,
# }
# programForHost = program