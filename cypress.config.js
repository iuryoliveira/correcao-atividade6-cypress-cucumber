const { defineConfig } = require('cypress');
const {
  addCucumberPreprocessorPlugin,
} = require('@badeball/cypress-cucumber-preprocessor');
const {
  createEsbuildPlugin,
} = require('@badeball/cypress-cucumber-preprocessor/esbuild');
const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');

module.exports = defineConfig({
  e2e: {
    baseUrl: 'https://rarocrud-frontend-88984f6e4454.herokuapp.com',
    specPattern: 'cypress/e2e/**/*.feature',
    env: {
      TAGS: 'not @ignore',
    },
    async setupNodeEvents(on, config) {
      await addCucumberPreprocessorPlugin(on, config);

      on(
        'file:preprocessor',
        createBundler({ plugins: [createEsbuildPlugin(config)] })
      );

      return config;
    },
  },
});
