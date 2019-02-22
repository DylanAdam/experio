const selectTab = () => {

  const mybookings = document.querySelector(".my-bookings");
  const bookingsAsOwner = document.querySelector(".bookings-as-owner");
  const bookingsAsOwnerHead = document.querySelector(".tabs .bookings-as-owner-head");
  const mybookingsHead = document.querySelector(".tabs .my-bookings-head");

  if (mybookingsHead) {
    mybookingsHead.addEventListener("click", (event) => {
      console.log(event);
      event.currentTarget.classList.add("active");
      bookingsAsOwnerHead.classList.remove("active");
      mybookings.classList.remove("hidden");
      bookingsAsOwner.classList.add("hidden");
    });
  }

  if (bookingsAsOwnerHead) {
    bookingsAsOwnerHead.addEventListener("click", (event) => {
      event.currentTarget.classList.add("active");
      mybookingsHead.classList.remove("active");
      mybookings.classList.add("hidden");
      bookingsAsOwner.classList.remove("hidden");
    });
  }
}

export { selectTab };
