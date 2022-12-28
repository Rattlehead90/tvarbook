import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["notification"]
  static values = { state: { type: Number, default: 0 } }

  pop() {
    this.stateValue++
    if (this.stateValue % 2 != 0) {
      // query the notification sign 
      const notification = this.notificationTarget;
      // parent pop div
      const pop = document.createElement('div');
    }
  }
}