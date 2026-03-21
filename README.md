# custom-title.yazi

Set a custom static or dynamic title for Yazi's header bar.

## Installation

```sh
ya pkg add elweday1/custom-title
```

Or manually:

```sh
git clone https://github.com/elweday1/custom-title.yazi.git ~/.config/yazi/plugins/custom-title.yazi
```

## Usage

Add this to your `init.lua`:

```lua
require("custom-title"):setup()
```

### Static Title

```lua
require("custom-title"):setup({ title = "My File Manager" })
```

### Environment Variables

Supports `$VAR` or `${VAR}` syntax:

```lua
require("custom-title"):setup({ title = "$USER @ ${HOSTNAME}" })
```

### Current Directory

Use `%d` to insert the current directory:

```lua
require("custom-title"):setup({ title = "%d" })
```

### Alignment

Control text alignment with the `align` option (`"left"`, `"center"`, `"right"`):

```lua
require("custom-title"):setup({
  title = "My Title",
  align = "left",
})
```

### Dynamic Title

Pass a function that's called on every redraw:

```lua
require("custom-title"):setup({
  title = function()
    return os.date("%H:%M") .. " - Yazi"
  end
})
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `title` | `string \| function` | `"Yazi"` | The title to display. Supports `%d` for current directory, `$VAR` for env vars, or a function. |
| `align` | `string` | `"center"` | Text alignment: `"left"`, `"center"`, or `"right"`. |

## License

MIT
