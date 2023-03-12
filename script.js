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
const contactForm = document.querySelector('form');
const nameInput = contactForm.querySelector('#name');
const emailInput = contactForm.querySelector('#email');
const messageInput = contactForm.querySelector('#message');

contactForm.addEventListener('submit', event => {
  // Prevent the form from submitting
  event.preventDefault();

  // Validate name field
  if (nameInput.value.trim() === '') {
    alert('Please enter your name.');
    nameInput.focus();
    return;
  }

  // Validate email field
  if (emailInput.value.trim() === '') {
    alert('Please enter your email.');
    emailInput.focus();
    return;
  }

  // Validate message field
  if (messageInput.value.trim() === '') {
    alert('Please enter a message.');
    messageInput.focus();
    return;
  }

  // Submit the form if all fields are valid
  alert('Thank you for your message!');
  contactForm.reset();
});

