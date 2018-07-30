import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    "oni.loadInitVim": true,

    // UI customizations
    "editor.fontSize": "12px",
    //"editor.fontFamily": "Monaco",
    "ui.colorscheme": "solarized8", // nord
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "tabs.mode": "buffers",
    "tabs.height": "2em",
    //"sidebar.enabled": false,
}
