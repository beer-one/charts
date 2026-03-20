{{/*
Pod-level securityContext
*/}}
{{- define "common-rule.podSecurityContext" -}}
securityContext:
  runAsNonRoot: true
  seccompProfile:
    type: "RuntimeDefault"
{{- end -}}

{{/*
Container-level securityContext
*/}}
{{- define "common-rule.containerSecurityContext" -}}
securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - "ALL"
  runAsUser: {{ .Values.securityContext.runAsUser }}
{{- end -}}

{{/*
Node namespace share restrict
*/}}
{{- define "common-rule.nodeNamespaceShareRestrict" -}}
hostNetwork: false
hostIPC: false
hostPID: false
{{- end -}}


{{/*
Main container resources
*/}}
{{- define "common-rule.resources" -}}
resources:
  requests:
    cpu: {{ .Values.resources.cpu }}
    memory: {{ .Values.resources.memory }}
  limits:
    memory: {{ .Values.resources.memory }}
{{- end -}}


{{/*
DNS Config
*/}}
{{- define "common-rule.dnsConfig" -}}
dnsConfig:
  options:
    - name: ndots
      value: "2"
{{- end -}}

