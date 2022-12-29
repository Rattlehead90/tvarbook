import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["notification"]
  static values = { state: { type: Number, default: 0 } }

  pop() {
    // query the notification sign 
    const notification = this.notificationTarget;
    this.stateValue++
    if (this.stateValue % 2 != 0) {
      // parent pop div
      const pop = document.createElement('div');
      // get the friend requests
      const friends_ids = this.data.get("friends").match(/\d+/g).map(Number);
      friends_ids.forEach(id => {
        // create the notification option_pop
        const option_pop = document.createElement('a');
        option_pop.textContent = 'Friend request';
        option_pop.href = `/users/${id}`;
        option_pop.classList.add("hover:bg-gray-300", "rounded-xl", "p-2");
        pop.appendChild(option_pop);
      })
      // add functionality to the pop
      pop.addEventListener('mouseleave', () => {
        this.mouseleave();
      });
      // Styling of the pop div 
      pop.classList.add("shadow-xl", "border-2", "border-gray-50", "bg-white",
        "p-2", "w-48", "right-0", "top-12", "rounded-xl",
        "flex", "flex-col");

      // Positioning of pop div
      pop.id = 'pop';
      pop.style.position = 'absolute';
      // display pop
      notification.appendChild(pop);
    } else {
      const pop = document.getElementById('pop');
      notification.removeChild(pop);
    }
  }

  mouseleave() {
    this.stateValue++
    const pop = document.getElementById('pop');
    pop.remove();
  }

  warning() {
    // query the notification sign 
    const notification = this.notificationTarget;
    this.stateValue++
    if (this.stateValue % 2 != 0) {
      // parent pop div
      const pop = document.createElement('div');
      // get the friend requests
      const friends_ids = this.data.get("friends");
      const warning = document.createElement('p');
      warning.textContent = 'No notifications'
      warning.classList.add("p-2", "text-gray-500", "hover:cursor-default");
      pop.appendChild(warning)

      pop.addEventListener('mouseleave', () => {
        this.mouseleave();
      });
      // Styling of the pop div 
      pop.classList.add("shadow-xl", "border-2", "border-gray-50", "bg-white",
        "p-2", "w-48", "right-0", "top-12", "rounded-xl",
        "flex", "flex-col");

      // Positioning of pop div
      pop.id = 'pop';
      pop.style.position = 'absolute';
      // display pop
      notification.appendChild(pop);
    } else {
      const pop = document.getElementById('pop');
      notification.removeChild(pop);
    }
  }
}