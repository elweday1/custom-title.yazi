# custom-title.yazi

Set a custom static or dynamic title for Yazi's header bar.

## Installation

```sh
ya pkg add elweday1/custom-title
```

Or manually:

```sh
git clone https://github.com/<your-username>/custom-title.yazi.git ~/.config/yazi/plugins/custom-title.yazi
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

### Dynamic Title

Pass a function that's called on every redraw:

```lua
require("custom-title"):setup({
  title = function()
    return os.date("%H:%M") .. " - Yazi"
  end
})
```

Combine with environment variables:

```lua
require("custom-title"):setup({
  title = function()
    local user = os.getenv("USER") or "user"
    return user .. " | " .. os.date("%H:%M")
  end
})
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `title` | `string \| function` | `"Yazi"` | The title to display. Can be a string (with env var expansion) or a function returning a string. |

## License

MIT
