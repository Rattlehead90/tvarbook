import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'button' ]
  spin() {
    const button = this.buttonTarget;
    button.textContent = '...';
    button.value = '...';
    button.classList.add('animate-bounce', 'w-6', 'h-6', 'flex', 'justify-center', 'items-center');
  }
}
