{{- define "backend.name" -}}
backend
{{- end }}

{{- define "backend.fullname" -}}
{{ printf "%s-%s" .Release.Name (include "backend.name" .) }}
{{- end }}

# selectorLabels (Deployment / Service selector 전용)
{{- define "backend.selectorLabels" -}}
app: {{ .Values.labels.app }}
component: api
{{- end }}

# 공통 labels (모든 리소스 공통)
{{- define "backend.commonLabels" -}}
app: {{ .Values.labels.app }}
app.kubernetes.io/name: {{ include "backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}
