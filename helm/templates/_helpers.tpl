{{- define "mychart.labels" -}}
 label:
  app: {{ .Values.Component }}
  project: roboshop
{{- end }}