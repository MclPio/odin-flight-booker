import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["addition"]
  static values = { count: Number }

  connect() {
    //sets the count value based on h4 found within form.
    let form = document.querySelector("form");
    let ele_count = form.querySelectorAll("h4").length;
    this.countValue = ele_count;
  }

  add() {
    //create div to capture a single passenger
    const container = document.createElement("div");
    container.className = 'passenger';

    //Increment count
    this.countValue++
    
    const header = document.createElement("h4");
    header.className = 'title is-4';
    header.textContent = `Passenger ${this.countValue}`
    container.appendChild(header);

    //Create field for the name
    const nameFieldContainer = document.createElement("div");
    nameFieldContainer.className = 'field';

    //Adding name label
    const name_label = document.createElement("label");
    name_label.className = 'label';
    name_label.setAttribute("for", `booking_passengers_attributes_${this.countValue - 1}_name`);
    name_label.textContent = 'Name';
    nameFieldContainer.appendChild(name_label);

    //Adding name field
    const nameInput = document.createElement("input");
    nameInput.className = 'input';
    nameInput.type = 'text';
    nameInput.name = `booking[passengers_attributes][${this.countValue - 1}][name]`;
    nameInput.id = `booking_passengers_attributes_${this.countValue - 1}_name`;
    nameFieldContainer.appendChild(nameInput);

    container.appendChild(nameFieldContainer);
  
    // Create field for the email
    const emailFieldContainer = document.createElement("div");
    emailFieldContainer.className = 'field';

    //Adding email label
    const emailLabel = document.createElement("label");
    emailLabel.className = 'label';
    emailLabel.setAttribute("for", `booking_passengers_attributes_${this.countValue - 1}_email`);
    emailLabel.textContent = 'Email';
    emailFieldContainer.appendChild(emailLabel);

    //Adding email field
    const emailInput = document.createElement("input");
    emailInput.className = 'input';
    emailInput.type = 'text';
    emailInput.name = `booking[passengers_attributes][${this.countValue - 1}][email]`;
    emailInput.id = `booking_passengers_attributes_${this.countValue - 1}_email`;
    emailFieldContainer.appendChild(emailInput);

    container.appendChild(emailFieldContainer);
  
    //Adding remove button
    // const remove_button = document.createElement("button");
    // remove_button.type = "button";
    // remove_button.dataset.action = "passenger#remove";
    // remove_button.textContent = "Remove";
    // container.appendChild(remove_button);

    //append the container div to targer
    this.additionTarget.appendChild(container);
  }

  remove() {
    const container = this.additionTarget.querySelectorAll(".passenger");

    if(container.length > 1){
      container[container.length - 1].remove();
      this.countValue--;
    }
  }
}
