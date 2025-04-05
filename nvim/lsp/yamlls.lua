return {
    cmd = { "yaml-language-server" },
    root_markers = { ".git" },
    settings = {
        yaml = {
            disableDefaultProperties = true,
            keyOrdering = false,
            schemas = {
                kubernetes = { "**/k8s/**/templates/*.yaml" }
            }
        }
    }
}
