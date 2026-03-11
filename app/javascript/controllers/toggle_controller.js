import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  show() {
    this.containerTarget.classList.toggle("hidden")
  }

  // connect() {
  //   this.element.textContent = "Hello World!"
  // }
}
