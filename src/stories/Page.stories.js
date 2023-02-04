import './button.css'
import './header.css'
import './page.css'
import { within, userEvent } from '@storybook/testing-library';
import { expect } from '@storybook/jest'
import { Elm } from './Page.elm'
import code from './Page.elm?raw'

export default {
  title: 'Example/Page',
  render: (args) => {
    let node = document.createElement('div')
    window.requestAnimationFrame(() => {
      let app = Elm.Stories.Page.init({ node, flags: args })
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
};

export const LoggedOut = {};

// More on interaction testing: https://storybook.js.org/docs/7.0/html/writing-tests/interaction-testing
export const LoggedIn = {
  play: async ({ canvasElement }) => {
    // Need to wait until Elm has rendered
    await untilElmRenders()
    const canvas = within(canvasElement)
    const loginButton = canvas.getByRole('button', {
      name: /Log in/i,
    })
    userEvent.click(loginButton)

    await untilElmRenders()
    expect(
      canvas.getByText(/Jane Doe/i)
    ).toBeInTheDocument()
  },
};

// Elm rerenders our HTML on each animation frame, so we 
// should wait until after it's done
const untilElmRenders = () => new Promise((resolve) => {
  window.requestAnimationFrame(resolve)
})