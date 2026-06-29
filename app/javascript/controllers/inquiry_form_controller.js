import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]

  connect() {
    this.currentStep = 0
    this.showStep(0)
  }

  next() {
    if (this.currentStep < this.stepTargets.length - 1) {
      this.currentStep++
      this.showStep(this.currentStep)
    }
  }

  back() {
    if (this.currentStep > 0) {
      this.currentStep--
      this.showStep(this.currentStep)
    }
  }

  showStep(index) {
    this.stepTargets.forEach((step, i) => { step.hidden = (i !== index) })
  }
}
