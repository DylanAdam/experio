const changeStatus = () => {

  const acceptBtn = document.querySelectorAll(".accept");
  const declineBtn = document.querySelectorAll(".decline");

acceptBtn.forEach((element) => {
 element.addEventListener("click", (event) => {
  const idBooking = event.currentTarget.dataset.id;

// trouver le booking avec l'id
  const booking = ;
  console.log(idBooking)
  booking.status = "accepted"
  });
 });
};

export { changeStatus };
