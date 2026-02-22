local function equalize_everything()
  -- Equalize Neovim splits first
  vim.cmd("wincmd =")

  if not vim.env.TMUX or vim.env.TMUX == "" then
    return
  end

  local socket = vim.split(vim.env.TMUX, ",")[1]

  -- Count Neovim windows
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local nvim_wins = #vim.api.nvim_tabpage_list_wins(0)



  -- Count tmux panes (correct way)
  local pane_list = vim.fn.systemlist({ "tmux", "-S", socket, "list-panes" })
  local pane_count = #pane_list

  -- for k, v in pairs(pane_list) do
  --  print(k)
  --  print(v)
  -- end

  local pane_sizes = vim.fn.systemlist({ "tmux", "-S", socket, "list-panes", "-F", "#{pane_width}" })
  for k, v in pairs(pane_sizes) do
	  print(k)
	  print(v)
  end



  if pane_count <= 1 then
    return
  end

  -- Total visual regions
  local total_regions = nvim_wins + (pane_count - 1)

  -- Get full tmux window width
  local total_width = tonumber(
    vim.fn.system({ "tmux", "-S", socket, "display-message", "-p", "#{window_width}" })
  )

  if not total_width then
    return
  end

  -- Desired width for the nvim pane
  local target_width = math.floor(total_width * (nvim_wins / total_regions))

  -- Resize this pane explicitly
  vim.fn.system({
    "tmux",
    "-S",
    socket,
    "resize-pane",
    "-x",
    tostring(target_width),
  })

  -- Rebalance other panes
  vim.fn.system({
    "tmux",
    "-S",
    socket,
    "select-layout",
    "-E",
  })
end

equalize_everything()
