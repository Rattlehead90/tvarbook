import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'input' ]
  pulse() {
    const input = this.inputTarget;
    input.addEventListener('keydown', (e) => {
      if (e.keyCode === 13) {
        input.classList.add('animate-pulse');
      }
    });
  }
}
