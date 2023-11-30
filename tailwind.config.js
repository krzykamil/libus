/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
  "./public/*.html",
  "./slices/main/views/**/*.rb",
  "./slices/main/templates/**/*",
  ],
  theme: {
    extend: {},
  },
  daisyui: {
    themes: ["light", "dark", "nord"],
    base: true, // applies background color and foreground color for root element by default\
    darkTheme: "dark",
  },
  plugins: [
    require('@tailwindcss/typography'),
    require("daisyui")
  ],
}

