import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element)
  }

  open() {
    this.modal.show()
  }

  close() {
    this.modal.hide()
  }

  disconnect() {
    this.modal.dispose()
  }
}

/*
<div data-controller="modal" class="modal fade" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      ...
    </div>
  </div>
</div> */