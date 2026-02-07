# Godot
1. set Editor>EditorSettings>TextEditor>External>Exec Path
    ```nvim```
2. set Editor>EditorSettings>TextEditor>External>Exec Flags
    `--server {project}/godothost --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line}+1,{col})<CR>"`
2. set Editor>EditorSettings>TextEditor>External>Use External Text Editor
    `on`
