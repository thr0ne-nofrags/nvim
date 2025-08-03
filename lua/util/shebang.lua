vim.keymap.set('n', '!', function()
  local shebangs = {
    python = '#!/usr/bin/env python3',
    bash   = '#!/usr/bin/env bash',
    sh     = '#!/usr/bin/env bash',
    lua    = '#!/usr/bin/env lua',
    perl   = '#!/usr/bin/env perl',
    ruby   = '#!/usr/bin/env ruby',
    zsh    = '#!/usr/bin/env zsh',
  }

  local ft = vim.bo.filetype
  local shebang = shebangs[ft]

  if not shebang then
    vim.notify("No shebang defined for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  -- insert shebang at top if it's not already there
  local first_line = vim.fn.getline(1)
  if not first_line:find('^#!') then
    vim.fn.append(0, shebang)
    vim.notify("Shebang inserted: " .. shebang)
  else
    vim.notify("Shebang already present", vim.log.levels.INFO)
  end
end, { desc = "Insert shebang at top", silent = true })

