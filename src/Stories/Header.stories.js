import './button.css'
import './header.css'
import { Elm } from './Header.elm'
import { render } from '../../.storybook/render'

export default {
  title: 'Example/Header',
  render: render(Elm.Stories.Header),
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/7.0/html/configure/story-layout
    layout: 'fullscreen'
  },
  // More on argTypes: https://storybook.js.org/docs/7.0/html/api/argtypes
  argTypes: {
    username: { control: 'text' },
  },
};

export const LoggedIn = {
  args: {
    username: 'Jane Doe'
  },
};

export const LoggedOut = {};
