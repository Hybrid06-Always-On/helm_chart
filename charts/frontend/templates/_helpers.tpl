{{- define "frontend.name" -}}
frontend
{{- end }}

{{- define "frontend.fullname" -}}
{{ .Release.Name }}-frontend
{{- end }}

{{- define "frontend.selectorLabels" -}}
app: frontend
{{- end }}

{{- define "frontend.labels" -}}
app: frontend
component: web
app.kubernetes.io/name: {{ include "frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
