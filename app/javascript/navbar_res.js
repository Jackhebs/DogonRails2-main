function buttonClicked(event) {
    console.log(event);
    const navbarLinks = document.getElementsByClassName('navbar-links')[0]
        navbarLinks.classList.toggle('active')
}
window.buttonClicked = buttonClicked;

