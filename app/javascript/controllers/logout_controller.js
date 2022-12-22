import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "avatar" ]
  static values = { state: {type: Number, default: 0} }

  pop() {
    const avatar = this.avatarTarget;

    this.stateValue++;
    if (this.stateValue % 2 != 0) {
      const logout_pop = document.createElement('a');
      logout_pop.id = 'pop';
      logout_pop.style.position = 'absolute';
      logout_pop.href = '/users/sign_out';
      logout_pop.textContent = 'Log out';
      logout_pop.classList.add("shadow-xl", "border-2", "border-gray-50", "bg-white", 
                               "p-2", "w-48", "right-0", "top-12", "rounded-xl", "hover:bg-gray-300")
      avatar.appendChild(logout_pop);
    } else {
      const logout_pop = document.getElementById('pop');
      avatar.removeChild(logout_pop);
    }
  }
}