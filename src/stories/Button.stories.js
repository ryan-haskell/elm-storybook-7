import './button.css'
import { Elm } from './Button.elm'
import code from './Button.elm?raw'

// More on how to set up stories at: https://storybook.js.org/docs/7.0/html/writing-stories/introduction
export default {
  title: 'Example/Button',
  tags: ['autodocs'],
  render: (args) => {
    let node = document.createElement('div')
    window.requestAnimationFrame(() => {
      let app = Elm.Stories.Button.init({ node, flags: args })
      app.ports.log.subscribe(args.onLog)
    })
    return node
  },
  parameters: {
    layout: 'centered',
    docs: {
      source: {
        language: 'elm',
        code
      }
    }
  },
  argTypes: {
    label: { control: 'text' },
    onLog: { action: 'Elm', control: false },
    primary: { control: 'boolean' },
    size: {
      control: { type: 'select' },
      options: ['small', 'medium', 'large'],
    },
  },
};

// More on writing stories with args: https://storybook.js.org/docs/7.0/html/writing-stories/args
export const Primary = {
  args: {
    primary: true,
    label: 'Create post',
  },
  parameters: {
    layout: 'centered',
    docs: {
      source: {
        language: 'elm',
        code: `
import Components.Button

view : Html Msg
view =
    Components.Button.new 
        { label = "Create post" 
        }
        |> Components.Button.view
`
      }
    }
  },
};

export const Secondary = {
  args: {
    label: 'Cancel',
  },
  parameters: {
    layout: 'centered',
    docs: {
      source: {
        language: 'elm',
        code: `
import Components.Button

view : Html Msg
view =
    Components.Button.new 
        { label = "Cancel" 
        }
        |> Components.Button.withStyleSecondary
        |> Components.Button.view
`
      }
    }
  },
};

export const Large = {
  args: {
    size: 'large',
    label: 'Button',
  },
  parameters: {
    layout: 'centered',
    docs: {
      source: {
        language: 'elm',
        code: `
import Components.Button

view : Html Msg
view =
    Components.Button.new 
        { label = "Button" 
        }
        |> Components.Button.withStyleSecondary
        |> Components.Button.withSizeLarge
        |> Components.Button.view
`
      }
    }
  },
};

export const Small = {
  args: {
    size: 'small',
    label: 'Button',
  },
  parameters: {
    layout: 'centered',
    docs: {
      source: {
        language: 'elm',
        code: `
import Components.Button

view : Html Msg
view =
    Components.Button.new 
        { label = "Button" 
        }
        |> Components.Button.withStyleSecondary
        |> Components.Button.withSizeSmall
        |> Components.Button.view
`
      }
    }
  },
};