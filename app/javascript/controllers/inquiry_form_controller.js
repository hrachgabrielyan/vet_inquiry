import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "indicator", "indicatorLabel"]

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

    this.indicatorTargets.forEach((dot, i) => {
      if (i < index) {
        dot.classList.remove("bg-blue-800", "text-white", "bg-slate-200", "text-slate-500")
        dot.classList.add("bg-emerald-500", "text-white")
      } else if (i === index) {
        dot.classList.remove("bg-slate-200", "text-slate-500", "bg-emerald-500")
        dot.classList.add("bg-blue-800", "text-white")
      } else {
        dot.classList.remove("bg-blue-800", "text-white", "bg-emerald-500")
        dot.classList.add("bg-slate-200", "text-slate-500")
      }
    })

    this.indicatorLabelTargets.forEach((label, i) => {
      label.className = i === index ? "text-sm text-slate-800 font-medium" : "text-sm text-slate-400"
    })
  }
}
