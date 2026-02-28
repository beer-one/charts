# my-app
직접 개발한 애플리케이션을 쿠버네티스로 배포할 때 사용하는 차트입니다.

## Parameters

| Name | Description | Type | Required | Default |
|------|-------------|-----|----------|----------|
| `app.image` | 애플리케이션 이미지 이름 | String | Y | |
| `app.port` | 애플리케이션 컨테이너 포트 | Integer | Y | |
| `app.replicas` | 애플리케이션 레플리카 개수 | Integer | N | `1` |
| `app.customCommand` | 애플리케이션 커맨드 | Array<\String> | N | `[]` |
| `app.customArgs` | 애플리케이션 커맨드 인자 | Array<\String> | N | `[]` |
| `app.env` | 애플리케이션 환경변수 | Array<\Env> | N | `[]` |
| `app.envFrom` | 애플리케이션 환경변수 | Array<\Env> | N | `[]` |
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
| `ingress.enabled` | 인그레스 사용 여부 | Boolean | N | `false` |
| `ingress.className` | 인그레스 클래스 이름 | String | N | `nginx` |
| `ingress.host` | 인그레스에 사용될 호스트 | String | N | `""` |
| `ingress.path` | 인그레스에 사용될 패스 | String | N | `""` |
| `ingress.pathType` | 인그레스 패스 타입, `Prefix`, `Exact` 중 하나 | Enum | N | `Prefix` |
| `schedule.affinity` | Affinity 설정 | N | `{}` |
| `schedule.topologySpreadConstraints` | Pod Topology SpreadC onstraints 설정 | N | `[]` |
| `schedule.tolerations` | Toleration 설정 | N | `[]` |
| `volumes` | 볼륨 설정 | N | `[]` |
| `volumeMounts` | 볼륨 마운트 설정 | N | `[]` |

## Version patches

### 0.1.1
* volumes, volumeMounts 추가