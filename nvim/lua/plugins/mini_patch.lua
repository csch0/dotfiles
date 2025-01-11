diff --git a/lua/mini/files.lua b/lua/mini/files.lua
index e5ed075..23c1f47 100644
--- a/lua/mini/files.lua
+++ b/lua/mini/files.lua
@@ -1,3 +1,14 @@
+config_width = 0.8
+config_height = 0.85
+config_row = 0.5
+config_col = 0.5
+
+-- 
+
+-- AAA -> full width
+-- A | AAA -> 50px + rest of width
+-- AAA | A -> rest of full width + 50px
+
 --- *mini.files* Navigate and manipulate file system
 --- *MiniFiles*
 ---
@@ -1490,7 +1501,7 @@ H.explorer_refresh = function(explorer, opts)
   local depth_range = H.compute_visible_depth_range(explorer, explorer.opts)
 
   -- Refresh window for every target depth keeping track of position column
-  local cur_win_col, cur_win_count = 0, 0
+  local cur_win_col, cur_win_count = math.floor((H.window_get_max_width() - H.window_get_width()) * config_col), 0
   for depth = depth_range.from, depth_range.to do
     cur_win_count = cur_win_count + 1
     local cur_width = H.explorer_refresh_depth_window(explorer, depth, cur_win_count, cur_win_col)
@@ -1738,8 +1749,20 @@ H.explorer_refresh_depth_window = function(explorer, depth, win_count, win_col)
   -- Compute width based on window role
   local win_is_focused = depth == explorer.depth_focus
   local win_is_preview = opts.windows.preview and (depth == (explorer.depth_focus + 1))
-  local cur_width = win_is_focused and opts.windows.width_focus
-    or (win_is_preview and opts.windows.width_preview or opts.windows.width_nofocus)
+  -- local cur_width = win_is_focused and opts.windows.width_focus
+  --   or (win_is_preview and opts.windows.width_preview or opts.windows.width_nofocus)
+
+  local cur_width
+  if win_is_focused then
+    -- fill space
+    if opts.windows.width_focus >= 100 then
+      cur_width = H.window_get_width() - (#windows - 1) * (opts.windows.width_nofocus + 2)
+    else
+      cur_width = opts.windows.width_focus
+    end
+  else
+    cur_width = opts.windows.width_nofocus
+  end
 
   -- Prepare target view
   local view = views[path] or {}
@@ -1749,7 +1772,8 @@ H.explorer_refresh_depth_window = function(explorer, depth, win_count, win_col)
   -- Create relevant window config
   local config = {
     col = win_col,
-    height = vim.api.nvim_buf_line_count(view.buf_id),
+    row = math.floor((H.window_get_max_height() - H.window_get_height()) * config_row),
+    height = H.window_get_height(),
     width = cur_width,
     -- Use shortened full path in left most window
     title = win_count == 1 and H.fs_shorten_path(H.fs_full_path(path)) or H.fs_get_basename(path),
@@ -1946,6 +1970,8 @@ H.explorer_show_help = function(explorer, explorer_buf_id, explorer_win_id)
 end
 
 H.compute_visible_depth_range = function(explorer, opts)
+  local width = math.floor(vim.o.columns * config_width)
+
   -- Compute maximum number of windows possible to fit in current Neovim width
   -- Add 2 to widths to take into account width of left and right borders
   local width_focus, width_nofocus = opts.windows.width_focus + 2, opts.windows.width_nofocus + 2
@@ -1954,9 +1980,9 @@ H.compute_visible_depth_range = function(explorer, opts)
   local width_preview = has_preview and (opts.windows.width_preview + 2) or width_nofocus
 
   local max_number = 1
-  if (width_focus + width_preview) <= vim.o.columns then max_number = max_number + 1 end
-  if (width_focus + width_preview + width_nofocus) <= vim.o.columns then
-    max_number = max_number + math.floor((vim.o.columns - width_focus - width_preview) / width_nofocus)
+  if (width_focus + width_preview) <= width then max_number = max_number + 1 end
+  if (width_focus + width_preview + width_nofocus) <= width then
+    max_number = max_number + math.floor((width - width_focus - width_preview) / width_nofocus)
   end
 
   -- - Account for dedicated option
@@ -2079,7 +2105,7 @@ H.view_track_text_change = function(data)
   local cur_height = vim.api.nvim_win_get_height(win_id)
   local n_lines = vim.api.nvim_buf_line_count(buf_id)
   local new_height = math.min(n_lines, H.window_get_max_height())
-  vim.api.nvim_win_set_height(win_id, new_height)
+  -- vim.api.nvim_win_set_height(win_id, new_height)
 
   -- Trigger appropriate event if window height has changed
   if cur_height ~= new_height then
@@ -2403,8 +2429,10 @@ H.window_open = function(buf_id, config)
   -- - Use 99 to allow built-in completion to be on top
   config.zindex = 99
 
-  -- Add temporary data which will be updated later
-  config.row = 1
+  -- calculate row
+  local max_height = H.window_get_max_height()
+  local height = math.floor(max_height * config_height)
+  config.row = math.floor((max_height - height) * config_row)
 
   -- Ensure it works on Neovim<0.9
   if vim.fn.has('nvim-0.9') == 0 then config.title = nil end
@@ -2441,7 +2469,7 @@ H.window_update = function(win_id, config)
   local max_height = H.window_get_max_height()
 
   -- Ensure proper fit
-  config.row = has_tabline and 1 or 0
+  -- config.row = has_tabline and 1 or 0
   config.height = config.height ~= nil and math.min(config.height, max_height) or nil
   config.width = config.width ~= nil and math.min(config.width, vim.o.columns) or nil
 
@@ -2463,6 +2491,7 @@ H.window_update = function(win_id, config)
 
   -- Update config
   config.relative = 'editor'
+  print(vim.inspect(config))
   vim.api.nvim_win_set_config(win_id, config)
 
   -- Reset basic highlighting (removes possible "focused" highlight group)
@@ -2549,6 +2578,28 @@ H.window_get_max_height = function()
   return vim.o.lines - vim.o.cmdheight - (has_tabline and 1 or 0) - (has_statusline and 1 or 0) - 2
 end
 
+H.window_get_height = function()
+  local height = H.window_get_max_height()
+  if config_height < 1 then
+    return math.floor(height * config_height)
+  else
+    return math.min(height, config_height)
+  end
+end
+
+H.window_get_max_width = function ()
+  return vim.o.columns
+end
+
+H.window_get_width = function ()
+  local width = H.window_get_max_width()
+  if config_width < 1 then
+    return math.floor(width * config_width)
+  else
+    return math.min(width, config_width)
+  end
+end
+
 -- File system ----------------------------------------------------------------
 ---@class fs_entry
 ---@field name string Base name.

