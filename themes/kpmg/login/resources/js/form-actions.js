document.addEventListener("DOMContentLoaded", function () {
    
    const email = document.getElementById("email") || document.getElementById("username");

    email.addEventListener("input", (event) => {
        const username = document.getElementById("username");
        if(username){
            username.value = event.target.value;
        }
    });
    const toggleButtons = document.querySelectorAll(".toggle-password");

    toggleButtons.forEach(button => {
        button.addEventListener("click", function () {
            const targetId = this.getAttribute("data-target");
            const passwordField = document.getElementById(targetId);

            const showIcon = this.querySelector(".show-pass");
            const hideIcon = this.querySelector(".hide-pass");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                showIcon.style.display = "none";
                hideIcon.style.display = "block";
            } else {
                passwordField.type = "password";
                showIcon.style.display = "block";
                hideIcon.style.display = "none";
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const errorDiv = document.querySelector(".alert-error");
    const loginSubmit = document.getElementById("kc-form-buttons");
    const terms = document.getElementById("terms")

    const adjacent = terms || loginSubmit

    if (terms) {
        const errorsContainer = errorDiv.children[1]
        let errors = errorsContainer.innerHTML.split("<br>")
        errors = errors.filter(error => !error.toLowerCase().includes("username"))
        const nonPassErrors = errors.filter(error => !error.toLowerCase().includes("password"))
        const passErrors = errors.filter(error => error.toLowerCase().includes("password"))
        errorsContainer.innerHTML = nonPassErrors.length > 0 ? nonPassErrors.join("<br>") : passErrors.join("<br>")
        errorDiv.parentNode.removeChild(errorDiv);
        if(nonPassErrors.length > 0){
            adjacent.parentNode.insertBefore(errorDiv, adjacent);
        }
        else{
            const step2 = document.getElementById('step-2')
            const submitButton = document.querySelector("#kc-form-buttons")
            submitButton.parentNode.insertBefore(errorDiv,submitButton)
            step2.classList.add("show-form")
        }
    }
});


window.addEventListener('click', (e) => {
    const target = e.target
    const step2 = document.getElementById('step-2')

    if (target.id === "back-button") {
        step2.classList.remove("show-form")
    }
    if (target.id === "continue-button") {
        step2.classList.add("show-form")
    }
})

