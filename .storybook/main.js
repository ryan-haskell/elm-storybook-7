import ElmVitePlugin from 'vite-plugin-elm'

export default {
  "stories": [
    "../src/**/*.mdx",
    "../src/**/*.stories.@(js|jsx|ts|tsx)"
  ],
  "addons": [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions"
  ],
  "framework": {
    "name": "@storybook/html-vite",
    "options": {}
  },
  async viteFinal(config) {
    return {
      ...config,
      plugins: [
        ...config.plugins,
        ElmVitePlugin({ debug: false, optimize: false })
      ],
      define: {
        ...config.define,
        // Prevents "global is not defined" error
        global: "window",
      },
    };
  }
};