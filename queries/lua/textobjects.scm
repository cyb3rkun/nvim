;; Capture type specifiers like 'int', 'bool', etc.
; this extends the default queries instead of overriding them all
; extends 

(_
name: (identifier) @name) 
(_
  value: (_) @value.outer) ; [199, 15] - [199, 20]
(_
content: (_) @value.inner)
