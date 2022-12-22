import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "avatar" ]
  static values = { state: {type: Number, default: 0} }

  pop() {
    const avatar = this.avatarTarget;

    this.stateValue++;
    if (this.stateValue % 2 != 0) {
      const pop = document.createElement('div')
      const logout_pop = document.createElement('a');
      const edit_pop = document.createElement('a');
      pop.id = 'pop';
      pop.style.position = 'absolute';
      logout_pop.href = '/users/sign_out';
      edit_pop.href = '/users/edit';
      logout_pop.textContent = 'Log out';
      edit_pop.textContent = 'Edit profile';
      pop.classList.add("shadow-xl", "border-2", "border-gray-50", "bg-white", 
                               "p-2", "w-48", "right-0", "top-12", "rounded-xl",
                               "flex", "flex-col");
      logout_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");
      edit_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");

      pop.appendChild(edit_pop);
      pop.appendChild(logout_pop);
      avatar.appendChild(pop);
    } else {
      const pop = document.getElementById('pop');
      avatar.removeChild(pop);
    }
  }
}