document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contact-form');
    const registerForm = document.getElementById('register-form');
    const passwordInput = document.getElementById('password');
    const lengthRequirement = document.getElementById('length-requirement');
    const specialCharRequirement = document.getElementById('special-char-requirement');

    if (contactForm) {
        contactForm.addEventListener('submit', function(event) {
            event.preventDefault();
            alert('Message sent!');
        });
    }

    if (registerForm) {
        registerForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const password = passwordInput.value;
            const passwordPattern = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;

            if (!passwordPattern.test(password)) {
                alert('Password must be at least 8 characters long and contain at least one special character.');
            } else {
                alert('Registration successful!');
            }
        });

        passwordInput.addEventListener('input', function() {
            const password = passwordInput.value;

            if (password.length >= 8) {
                lengthRequirement.classList.add('valid');
            } else {
                lengthRequirement.classList.remove('valid');
            }

            if (/[!@#$%^&*]/.test(password)) {
                specialCharRequirement.classList.add('valid');
            } else {
                specialCharRequirement.classList.remove('valid');
            }
        });
    }
});
