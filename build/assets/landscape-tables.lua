-- landscape-tables.lua
-- Pandoc filter: tables with N or more columns are placed on their own
-- landscape page, and the heading that precedes such a table is pulled onto the
-- landscape page with it. Section breaks are injected as raw OOXML, so this
-- affects the DOCX output only; other writers ignore the raw blocks.

-- Portrait section break (A4: 11906 x 16838 twips).
local portrait_break = pandoc.RawBlock('openxml',
  '<w:p><w:pPr><w:sectPr>'
  .. '<w:pgSz w:w="11906" w:h="16838"/>'
  .. '<w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"'
  .. ' w:header="720" w:footer="720" w:gutter="0"/>'
  .. '</w:sectPr></w:pPr></w:p>')

-- Landscape section break (swap width/height, add orient="landscape").
local landscape_break = pandoc.RawBlock('openxml',
  '<w:p><w:pPr><w:sectPr>'
  .. '<w:pgSz w:w="16838" w:h="11906" w:orient="landscape"/>'
  .. '<w:pgMar w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"'
  .. ' w:header="720" w:footer="720" w:gutter="0"/>'
  .. '</w:sectPr></w:pPr></w:p>')

local LANDSCAPE_THRESHOLD = 5  -- minimum columns to trigger a landscape page

function Pandoc(doc)
  local blocks = doc.blocks
  local result = {}

  for i = 1, #blocks do
    local block = blocks[i]

    if block.t == "Table" and #block.colspecs >= LANDSCAPE_THRESHOLD then
      -- Pull the preceding heading onto the landscape page.
      local header = nil
      if #result > 0 and result[#result].t == "Header" then
        header = table.remove(result)
      end

      -- End the current portrait section (forces a page break).
      table.insert(result, portrait_break)

      if header then
        table.insert(result, header)
      end

      table.insert(result, block)

      -- End the landscape section; content after this returns to portrait.
      table.insert(result, landscape_break)
    else
      table.insert(result, block)
    end
  end

  return pandoc.Pandoc(result, doc.meta)
end
