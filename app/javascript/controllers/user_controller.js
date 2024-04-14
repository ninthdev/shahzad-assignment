import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "attr" ]
  connect() {
  }

  autosave() {
    const url = this.element.dataset.url;
    const jsonData = {};
    jsonData[this.element.dataset.field] = this.attrTarget.value;

    fetch(url, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(jsonData),
    })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
            this.element.classList.add('success');
            setTimeout(() => {
                this.element.classList.remove("success");
            }, 500);
        })
        .catch(error => {
            this.element.classList.add('failure');
            setTimeout(() => {
                this.element.classList.remove("failure");
            }, 3000);
        });

  }
}
