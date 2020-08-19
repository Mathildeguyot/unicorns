const initFixBookingCardOnScroll = () => {
  const bookingCard = document.querySelector('.booking-card-container');

  if (bookingCard) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 200) {
        bookingCard.classList.add('scroll');
      } else {
        bookingCard.classList.remove('scroll');
      }
    });
  }
}

export { initFixBookingCardOnScroll };

const bookUnicorn = () => {
  form.addEventListener("submit", (event) => {
  event.preventDefault();
  // TBD
});
}

export { bookUnicorn };
