import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const startDate = document.querySelector("#booking-start");
const endDate = document.querySelector("#booking-end");
const bookingDuration = document.querySelector("#booking-duration");


flatpickr("#start_date", {
  onChange: function(selectedDates, dateStr, instance) {
    end_date.set('minDate',dateStr)
  },
  onClose: function(selectedDates, dateStr, instance) {
    startDate.value = dateStr
  },
  dateFormat: "Y-m-d",
  minDate: "today"
})


const end_date = flatpickr("#end_date", {
  onClose: function(selectedDates, dateStr, instance) {
    endDate.value = dateStr
  },
  dateFormat: "Y-m-d",
});
