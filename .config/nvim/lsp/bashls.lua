return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
    root_markes = {".git"},
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)"
        }
    }
}
