/**
 * This is the javascript Hook used to interface with Trunks UI
 */
const TRUNKS_DEV = true;

window.addEventListener("DOMContentLoaded", (event) => {
    const TRUNKS = window.TRUNKS;

    TRUNKS.setEventHook((payload) => {
        Events.Call("TRUNKS_UI_EVENT", payload);
    });

    Events.Subscribe("TRUNKS_ADD_COMPONENT", (payload) => {
        TRUNKS_DEV && console.log("New component " + payload)
        TRUNKS.addComponent(payload)
    });
    Events.Subscribe("TRUNKS_UPDATE_COMPONENT", (payload) => TRUNKS.updateComponent(payload));
    Events.Subscribe("TRUNKS_DESTROY_COMPONENT", (payload) => TRUNKS.destroyComponent(payload));

    Events.Subscribe("TRUNKS_DEBUG_MODE", () => {
        TRUNKS.debugMode = true;
    });

    Events.Call("TRUNKS_LOADED");
});
