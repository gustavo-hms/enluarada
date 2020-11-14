# We are going to parse the ctags output. Say we have the following Lua file:
#     
#     function primeira(um, dois)
#         return um + dois
#     end
#     
#     function segunda()
#         return 17
#     end
#
# Then, running `ctags -f - file.lua` produces:
#
#     primeira	file.lua	/^function primeira(um, dois)$/;"	f
#     segunda	file.lua	/^function segunda()$/;"	f
#     
define-command tag -menu -params 1 -docstring %{
    tag <name>: select a symbol definition for the current buffer

} -shell-script-candidates %{
    # Extract the tags (the first word of each line)
    ctags -f - $kak_bufname | sed -r "s/^([^\t]+).+/\1/g"

} %{
    lua %val{bufname} %arg{1} %{
        local buffer, tag = args()
        local pattern = "^" .. tag .. "\t.+/^([^/]+)$/"

        local ctags = io.popen("ctags --pattern-length-limit=0 -f - " .. buffer)

        for line in ctags:lines() do
            -- Extract everything between /^ and $/
            local match = line:match(pattern)

            if match then
                -- Interpret the matched string literally
                local search = [[\Q]] .. match .. [[\E]]

                -- Kakoune interprets everything between angle brackets as
                -- a key (like <ret> and <esc>), so searching for thing like
                -- Vec<i64> won't work. Thus, we need to cheat a little.
                search = search:gsub("<", [[\E.\Q]])
                kak.execute_keys("/" .. search .. "<ret>")
                kak.execute_keys("s" .. tag .. "<ret>vv")
                return
            end
        end
    }
}
