# Godot
1. set Editor>EditorSettings>TextEditor>External>Exec Path
    ```bash
    nvim
    ```
2. set Editor>EditorSettings>TextEditor>External>Exec Flags
    ```bash
    --server {project}/godothost --remote-send "<C-\><C-N>:e {file}<CR>:call cursor({line}+1,{col})<CR>"

    ```
2. set Editor>EditorSettings>TextEditor>External>Use External Text Editor
    ```bash
    on
    ```
