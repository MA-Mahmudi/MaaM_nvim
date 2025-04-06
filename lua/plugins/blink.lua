return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'saghen/frizbee', build = "cargo build --release" }
  },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      default = { 'lsp', 'snippets' },
    },

    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust" }
  },
  opts_extend = { "sources.default" }
}
