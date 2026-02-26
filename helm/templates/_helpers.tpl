{{- define "mychart.labels" -}}
app: {{ .Values.component }}
project: roboshop
{{- end }}
{{- define "fullname.labels" -}}
name: manju
{{- end }}