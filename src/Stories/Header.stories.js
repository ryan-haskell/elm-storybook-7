import './button.css'
import './header.css'
import { Elm } from './Header.elm'
import code from './Header.elm?raw'

export default {
  title: 'Example/Header',
  // This component will have an automatically generated Autodocs entry: https://storybook.js.org/docs/7.0/html/writing-docs/docs-page
  tags: ['autodocs'],
  render: (args) => {
    let node = document.createElement('div')
    window.requestAnimationFrame(() => {
      let app = Elm.Stories.Header.init({ node, flags: args })
      app.ports.log.subscribe(args.onLog)
    })
    return node
  },
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/7.0/html/configure/story-layout
    layout: 'fullscreen',
    docs: {
      source: {
        language: 'elm',
        code
      }
    }
  },
  // More on argTypes: https://storybook.js.org/docs/7.0/html/api/argtypes
  argTypes: {
    username: { control: 'text' },
    onLog: { action: 'Elm', control: false },
  },
};

export const LoggedIn = {
  args: {
    username: 'Jane Doe'
  },
};

export const LoggedOut = {};
