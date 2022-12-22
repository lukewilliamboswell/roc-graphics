mod graphics;
mod gui;
mod roc;
mod glue;

#[no_mangle]
pub extern "C" fn rust_main() -> i32 {
    let bounds = glue::Bounds {
        width: 1900.0,
        height: 1000.0,
    };

    gui::run_event_loop("RocOut!", bounds).expect("Error running event loop");

    // Exit code
    0
}
