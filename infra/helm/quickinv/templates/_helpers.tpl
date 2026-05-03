{{- define "quickinv.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "quickinv.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "quickinv.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
