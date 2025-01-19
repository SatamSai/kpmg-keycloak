document.addEventListener("DOMContentLoaded", function () {
    const toggleButtons = document.querySelectorAll(".toggle-password");

    toggleButtons.forEach(button => {
        button.addEventListener("click", function () {
            const targetId = this.getAttribute("data-target");
            const passwordField = document.getElementById(targetId);

            // Find the images inside the button
            const showIcon = this.querySelector(".show-pass");
            const hideIcon = this.querySelector(".hide-pass");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                showIcon.style.display = "none"; // Hide the show icon
                hideIcon.style.display = "block"; // Show the hide icon
            } else {
                passwordField.type = "password";
                showIcon.style.display = "block"; // Show the show icon
                hideIcon.style.display = "none"; // Hide the hide icon
            }
        });
    });
});
