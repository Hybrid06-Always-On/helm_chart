{{- define "backend.name" -}}
backend
{{- end -}}

{{- define "backend.fullname" -}}
{{ printf "%s-%s" .Release.Name (include "backend.name" .) }}
{{- end -}}

# selectorLabels → API 전용
{{- define "backend.selectorLabels" -}}
app: {{ .Values.labels.app }}
component: api
{{- end -}}

# 공통 라벨 (component는 각 리소스에서 오버라이드)
{{- define "backend.commonLabels" -}}
app: {{ .Values.labels.app }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
