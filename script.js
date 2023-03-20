// Get all the navigation links
const navLinks = document.querySelectorAll('nav ul li a');

// Add click event listener to each link
navLinks.forEach(link => {
link.addEventListener('click', event => {
// Prevent the default link behavior
event.preventDefault();

// Get the target section ID
const target = link.getAttribute('href').substring(1);

// Scroll to the target section
const targetSection = document.getElementById(target);
targetSection.scrollIntoView({ behavior: 'smooth' });
});
});

// Validate the contact form before submitting
const contactForm = document.getElementById('contact-form');
const nameInput = document.getElementById('name');
const emailInput = document.getElementById('email');
const messageInput = document.getElementById('message');

// Function to validate input field
const validateField = (field, message) => {
if (field.value.trim() === '') {
alert(message);
field.focus();
return false;
}
return true;
};

contactForm.addEventListener('submit', event => {
// Prevent the form from submitting
event.preventDefault();

// Validate name field
if (!validateField(nameInput, 'Please enter your name.')) return;

// Validate email field
if (!validateField(emailInput, 'Please enter your email.')) return;

// Validate message field
if (!validateField(messageInput, 'Please enter a message.')) return;

// Submit the form if all fields are valid
alert('Thank you for your message!');
contactForm.reset();
});