import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  static values = { state: { type: Number, default: 0 } }

  expand() {
    const input_field = this.inputTarget;
    if (input_field.value.length > 50) {
      if (this.stateValue === 0) {
        input_field.classList.add('rounded-md');
        input_field.classList.remove('rounded-full');
        input_field.rows += 4;
        this.stateValue = 1;
      };
    } else {
      input_field.rows = 1;
      input_field.classList.add('rounded-full');
      input_field.classList.remove('rounded-md')

      this.stateValue = 0;
    }
  }

  pulse() {
    const input = this.inputTarget;
    input.addEventListener('keydown', (e) => {
      if (e.keyCode === 13 && !e.shiftKey) {
        e.preventDefault;
        input.classList.add('animate-pulse');

        input.closest("form").submit();
      }
    });
  }
}