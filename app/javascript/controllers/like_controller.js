import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'button' ]
  spin() {
    const button = this.buttonTarget;
    const originalTextContent = button.textContent;
    button.textContent = '...';
    button.value = '...';
    button.classList.add('animate-bounce', 'w-6', 'h-6', 'flex', 'justify-center', 'items-center');
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      button.classList.remove('animate-bounce', 'w-6', 'h-6', 'flex', 'justify-center', 'items-center');
      button.textContent = originalTextContent;
    }, 2000)
  }
}
