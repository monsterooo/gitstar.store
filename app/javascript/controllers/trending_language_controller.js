import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  initialize() {
    $(this.element).on('change', function() {
      const val = $(this).val();
      location.href = `${location.origin}${location.pathname}?lang=${val}`
    })
  }
  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }
}
