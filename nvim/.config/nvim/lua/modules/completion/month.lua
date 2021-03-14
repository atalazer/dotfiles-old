local M = {}

function M.getCompletionItems(prefix, score_func)
  local complete_items = {}
  -- define your total completion items
  local items = {'January', 'Feburary', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'Novermber',
                'December'}
  -- find matches items and put them into complete_items
  for _, month in ipairs(items) do
    -- score_func is a fuzzy match scoring function
    local score = score_func(prefix, month)
    if score < #prefix/2 then
      -- if you're not familiar with complete_items, see `:h complete-items`
      table.insert(complete_items, {
          word = month,
          kind = 'month',
          score = score,
          icase = 1,
          dup = 1,
          empty = 1,
        })
    end
  end
  return complete_items
end

M.complete_item = {
  item = M.getCompletionItems
}

return M
