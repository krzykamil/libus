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
  },
  plugins: [
    require('@tailwindcss/typography'),
    require("daisyui")
  ],
}

