import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "addition"]

  add() {
    var template = this.templateTarget
    const clone = template.content.cloneNode(true);
    let new_passenger = this.additionTarget.appendChild(clone);
  }
}
