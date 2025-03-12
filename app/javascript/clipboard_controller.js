import { Controller } from "@hotwired/stimulus"
import ClipboardJS from "app/javascript/clipboard_controller"

export default class extends Controller {
    static values = {
        successMessage: { type: String, default: "Copié!"},
        errorMessage: { type: String, default: "Echec!"},
    }

    connect() {
        this.clipboard = new Clipboard(this.element)
        this.clipboard.on("sucess", (e) => this.tooltip(this.successMessageValue)
        this.clipboard.on("error", (e) => this.tooltip(this.errorMessageValue)
        )
    }

    disconnect() {
        this.clipboard.destroy()
    }
    tooltip(message) {
        tippy(this.element, {
            content: message,
            showOnCreate: true,
            onHidden: (instance) => {
                instance.destroy()
            }
        })
    }
}