
function Image(img)
  if img.classes:find('contribution',1) then
    local f = io.open("contribution/" .. img.src, 'r')
    local doc = pandoc.read(f:read('*a'))
    f:close()
    local contribution = pandoc.utils.stringify(doc.meta.contribution) or "Epigraph has not been set"
    local undergraduate_student = pandoc.utils.stringify(doc.meta.student) or "Undergraduate Student Full Name has not been set"
    local uuid = pandoc.utils.stringify(doc.meta.id) or "Undergraduate Student ID has not been set"
    local credentials = " Undergraduate Student: " .. undergraduate_student .. " (" .. uuid .. ")"
    local text = "\n\n _" .. modification .. "_ \n\n"
    return pandoc.RawInline('markdown',text .. credentials)
  end
end
