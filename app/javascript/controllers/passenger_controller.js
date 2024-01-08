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
    const header_node = document.createTextNode(`Passenger ${this.countValue}`); // Need to have a counter
    header.appendChild(header_node);
    container.appendChild(header);

    //Adding name label
    const name_label = document.createElement("label");
    const name_text = document.createTextNode("Name");
    name_label.setAttribute("for", `booking_passengers_attributes_${this.countValue - 1}_name`);
    name_label.appendChild(name_text);
    container.appendChild(name_label);

    //Adding name field
    const name_field = document.createElement("input");
    name_field.type = "text";
    name_field.name = `booking[passengers_attributes][${this.countValue - 1}][name]`;
    name_field.id = `booking_passengers_attributes_${this.countValue - 1}_name`
    container.appendChild(name_field);

    //Adding email label
    const email_label = document.createElement("label");
    const email_text = document.createTextNode("Email");
    email_label.setAttribute("for", `booking_passengers_attributes_${this.countValue - 1}_email`);
    email_label.appendChild(email_text);
    container.appendChild(email_label);

    //Adding email field
    const email_field = document.createElement("input");
    email_field.type = "text";
    email_field.name = `booking[passengers_attributes][${this.countValue - 1}][email]`;
    email_field.id = `booking_passengers_attributes_${this.countValue - 1}_email`
    container.appendChild(email_field);

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
