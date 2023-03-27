{{ if eq .chezmoi.os "linux" }}
  {{ if (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
  # WSL-specific code
  {{ end }}
{{ end }}
