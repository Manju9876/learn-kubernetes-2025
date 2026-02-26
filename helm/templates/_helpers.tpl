{{- define "mychart.labels" -}}
app: {{ .Values.component }}
project: roboshop
{{- end }}
{{- define "demo.labels" -}}
name: manju
{{- end }}