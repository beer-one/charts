# spring-app
SpringBoot 애플리케이션을 배포하는 차트입니다.  차트를 만든 과정은 블로그 글에 포스팅 하였습니다.
* https://beer1.tistory.com/43


## Parameters

| Name | Description | Type | Required | Default |
|------|-------------|-----|----------|----------|
| `app.image` | 애플리케이션 이미지 이름 | String | Y | |
| `app.port` | 애플리케이션 컨테이너 포트 | Integer | Y | |
| `app.replicas` | 애플리케이션 레플리카 개수 | Integer | N | `1` |
| `app.customCommand` | 애플리케이션 커맨드 | Array<\String> | N | `[]` |
| `app.customArgs` | 애플리케이션 커맨드 인자 | Array<\String> | N | `[]` |
| `app.resources` | 애플리케이션 리소스 req, lim <br>(https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#resources) | Object | N | `{}` |
| `initContainers` | InitContainer가 필요하다면 추가 | Array<\Container> | N | `[]` |
| `podAnnotations` | 파드 추가 애노테이션 | Object | N | `{}` |
| `podLabels` | 파드 추가 레이블 | Object | N | `{}` |
| `probes.readiness` | readinessProbe <br>(https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#Probe) | Object | N | `{}` |
| `probes.liveness` | livenessProbe <br>(https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#Probe) | Object | N | `{}` |
| `service.enabled` | 서비스 생성여부 | Boolean | N | `false` |
| `service.port` | 서비스 포트 | Integer | N | `80` |
| `rbac.enabled` | 파드 내 쿠버네티스 API 권한 부여 여부 | Boolean | N | `false` |
| `rbac.roleBinding.autoCreate` | Spring Cloud Kubernetes 사용 시 기본 roleBinding 자동생성 여부 | Boolean | N | `true` |
| `rbac.roleBinding.additionalRoles` | 적용하고 싶은 이미 존재하는 role 추가 기입 | Array<\String> | N | `{}` |
| `rbac.roleBinding.additionalClusterRoles` | 적용하고 싶은 이미 존재하는 clusterRole 추가 기입 (roleBinding) | Array<\String> | N | `{}` |
| `rbac.clusterRoleBinding.clusterRoles` | 적용하고 싶은 이미 존재하는 clusterRole 추가 기입 (clusterRoleBinding) | Array<\String> | N | `[]` |
| `applicationYamlConfig` | Spring Cloud Kuberentes Config 사용 시 적용시킬 application.yaml을 저장하는 ConfigMap, empty일 경우 생성안함 | Object | N | `{}` |
| `applicationYamlConfig.name` | application.yaml을 저장하는 ConfigMap 이름 | String | Y |  |
| `applicationYamlConfig.value` | application.yaml 내용. `\|` 을 사용하여 문자열 생성 필수 | String | Y |  |
| `applicationYamlSecret` | Spring Cloud Kuberentes Config 사용 시 적용시킬 application.yaml을 저장하는 Secret, empty일 경우 생성안함 | Object | N | `{}` |
| `applicationYamlSecret.name` | application.yaml을 저장하는 Secret 이름 | String | Y |  |
| `applicationYamlSecret.value` | application.yaml 내용. `\|` 을 사용하여 문자열 생성 필수 | String | Y |  |
| `ingress.enabled` | 인그레스 사용 여부 | Boolean | N | `false` |
| `ingress.className` | 인그레스 클래스 이름 | String | N | `nginx` |
| `ingress.host` | 인그레스에 사용될 호스트 | String | N | `""` |
| `ingress.path` | 인그레스에 사용될 패스 | String | N | `""` |
| `ingress.pathType` | 인그레스 패스 타입, `Prefix`, `Exact` 중 하나 | Enum | N | `Prefix` |


## Version Patch

### 0.1.2
* `app.name` 제거, `.Release.Name`으로 대체

### 0.1.1
* `initContainers` 추가