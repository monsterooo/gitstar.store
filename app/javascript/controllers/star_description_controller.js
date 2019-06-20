import { Controller } from "stimulus"

export default class extends Controller {

  initialize() {
    $('textarea', this.element).on('change', this.handleChange)
  }
  connect() {

  }
  handleChange = (e) => {
    const value = e.target.value;

  }
}
