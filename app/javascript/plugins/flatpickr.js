import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const startDate = document.querySelector("#booking-start");
const endDate = document.querySelector("#booking-end");
const bookingDuration = document.querySelector("#booking-duration");
const unicornPrice= document.querySelector("#unicorn-price");
const unicornTotalPrice= document.querySelector("#unicorn-total-price");
const serviceFees= document.querySelector("#service-fees");
const bookingTotalPrice= document.querySelector("#booking-total-price");

const days_between=(date1, date2) => {
  // The number of milliseconds in one day
    const oneDay = 1000 * 60 * 60 * 24

    // Convert both dates to milliseconds
    const date1_ms = date1.getTime();
    const date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    const difference_ms = Math.abs(date1_ms - date2_ms)

    // Convert back to days and return
    return Math.round(difference_ms/oneDay + 1)
};

flatpickr("#start_date", {
  onChange: function(selectedDates, dateStr, instance) {
    end_date.set('minDate',dateStr)
  },
  onClose: function(selectedDates, dateStr, instance) {
    startDate.value = selectedDates;
  },
  dateFormat: "F j, Y",
  minDate: "today"
})


const end_date = flatpickr("#end_date", {
  onClose: function(selectedDates, dateStr, instance) {
    endDate.value = dateStr;
    const start = new Date(startDate.value);
    const end = new Date(endDate.value);
    bookingDuration.innerText = ` x ${days_between(start, end)}j`;
    unicornTotalPrice.innerText = `${parseFloat(unicornPrice.innerText) * days_between(start, end)}€`;
    serviceFees.innerText = `${(parseFloat(unicornTotalPrice.innerText) * 0.05).toFixed(2) }€`;
    bookingTotalPrice.innerText = `${(parseFloat(unicornTotalPrice.innerText) +parseFloat(serviceFees.innerText)).toFixed(2)}€`;

  },
  dateFormat: "F j, Y",
});



