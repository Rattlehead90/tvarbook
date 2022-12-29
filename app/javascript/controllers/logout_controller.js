import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "avatar" ]
  static values = { state: {type: Number, default: 0} }

  pop() {
    const avatar = this.avatarTarget;

    this.stateValue++;
    if (this.stateValue % 2 != 0) {
      // Parent pop div 
      const pop = document.createElement('div')
      // Option elements inside the pop div
      const logout_pop = document.createElement('a');
      const edit_pop = document.createElement('a');
      const show_pop = document.createElement('a');
      // Positioning of pop div
      pop.id = 'pop';
      pop.style.position = 'absolute';
      // Links' settings
      logout_pop.href = '/users/sign_out';
      edit_pop.href = '/users/edit';
      show_pop.href = '/users/show';
      // Options' labels
      logout_pop.textContent = 'Log out';
      edit_pop.textContent = 'Edit profile';
      show_pop.textContent = 'Show profile';

      // Styling of the pop div 
      pop.classList.add("shadow-xl", "border-2", "border-gray-50", "bg-white", 
                               "p-2", "w-48", "right-0", "top-12", "rounded-xl",
                               "flex", "flex-col");
      // Add mouseleave to the pop
      pop.addEventListener('mouseleave', () => {
        this.mouseleave()
      })
      // Adding of option elements
      show_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");
      logout_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");
      edit_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");

      // Appending options to pop div
      pop.appendChild(show_pop);
      pop.appendChild(edit_pop);
      pop.appendChild(logout_pop);

      // Connecting the pop div to avatar button on navbar
      avatar.appendChild(pop);
    } else {
      const pop = document.getElementById('pop');
      avatar.removeChild(pop);
    }
  }

  mouseleave() {
    this.stateValue++
    const pop = document.getElementById('pop');
    pop.remove();
  }
}