{{- define "mychart.labels" -}}
app: {{ .Values.component }}
project: roboshop
{{- end }}