import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'input', 'more', 'delete' ]
  static values = { state: { type: Number, default: 0 } }
  pulse() {
    const input = this.inputTarget;
    input.addEventListener('keydown', (e) => {
      if (e.keyCode === 13) {
        input.classList.add('animate-pulse');
      }
    });
  }

  expand() {
    const more = this.moreTarget;
    const comment_div = this.element;
    const loaded_comments = comment_div.querySelectorAll('p ~ div');

    this.stateValue++
    if (this.stateValue % 2 != 0) {
      more.textContent = 'Show less'
      loaded_comments.forEach(comment => {
        comment.classList.remove('scale-0', 'absolute');
        comment.classList.add('scale-1', 'relative');
      });
    } else {
      more.textContent = `Show ${loaded_comments.length} more...`
      loaded_comments.forEach(comment => {
        comment.classList.add('scale-0', 'absolute');
        comment.classList.remove('scale-1', 'relative');
      });
    };
  }

  showButton() {
    const button = this.deleteTarget;
    button.classList.remove('scale-0');
    button.classList.add('scale-1');
    this.element.addEventListener('mouseleave', () => {this.hideButton(button)})
  }

  hideButton(button) {
    button.classList.remove('scale-1');
    button.classList.add('scale-0');
  }
}
