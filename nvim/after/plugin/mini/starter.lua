local ascii = {
    {
        "    |\\__/,|   (`\\ ",
        "  _.|o o  |_   ) )",
        "-(((---(((--------",
    },
    {
        ' _._     _,-\'""`-._    ',
        "(,-.`._,'(       |\\`-/|",
        "    `-.-' \\ )-`( , o o)",
        "          `-    \\`_`\"'-",
    },
    {
        " |\\__/,|   (`\\ ",
        " |_ _  |.--.) )",
        " ( T   )     / ",
        "(((^_(((/(((_/ ",
    },
}

require("mini.deps").now(function()
    math.randomseed(os.time())
    local i = math.random(1, #ascii)

    require("mini.starter").setup({
        header = table.concat(ascii[i], "\n")
    })
end)
