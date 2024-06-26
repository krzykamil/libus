import "../css/app.css";
import "../css/tailwind.css";
import "../builds/tailwind.css";
import 'htmx.org';
import './htmx.js';

document.addEventListener('DOMContentLoaded', function () {
    const themeController = document.querySelector('.theme-controller');
    const htmlTag = document.documentElement;

    function toggleTheme() {
        if (themeController.checked) {
            htmlTag.setAttribute('data-theme', 'nord');
            localStorage.setItem('theme', 'nord');
        } else {
            htmlTag.setAttribute('data-theme', 'dark');
            localStorage.setItem('theme', 'dark');
        }
    }

    // Set initial theme based on local storage
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
        htmlTag.setAttribute('data-theme', savedTheme);
        themeController.checked = savedTheme === 'nord';
    }

    // Add onclick event dynamically
    themeController.addEventListener('click', toggleTheme);
});
