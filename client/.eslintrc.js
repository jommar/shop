module.exports = {
  root: true,
  env: {
    node: true,
    browser: true,
  },
  extends: ['plugin:vue/vue3-essential', 'eslint:recommended'],
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    indent: ['error', 2], // 2-space indentation
    semi: ['error', 'always'], // enforces semicolons
    quotes: ['error', 'single'], // enforces single quotes
    // Add more custom rules here
  },
};
