// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

// Import style for flatpickr
// require("flatpickr/dist/flatpickr.css")
require("flatpickr/dist/themes/material_red.css");

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)
