# common-rules
직접 개발한 차트에 적용할 공통 룰입니다.

## 공통 룰

### podSecurityContext

파드 수준의 기본 SecurityContext을 적용한다.
* `runAsNonRoot: true`: 컨테이너 런타임이 컨테이너를 생성하려고 할 때, UID가 0이면 실행을 중단하고 에러를 발생시킨다.
* `seccompProfile.type: "RuntimeDefault"`: 컨테이너가 커널에 요청할 수 있는 시스템 콜의 종류를 제한하여 컨테이너 환경의 보안을 강화 -> RuntimeDefault로 적용하면 CRI에서 미리 정해둔 기본 보안 프로파일을 적용한다.


### containerSecurityContext

컨테이너 수준의 기본 SecurityContext을 적용한다. (매인 컨테이너 기준)
* `allowPrivilegeEscalation: false`: 자식 프로세스가 부모 프로세스의 권한보다 더 많은 권한을 가지는 것을 차단시키는 옵션, (setuid 와 같은 설정 차단)
* `readOnlyRootFilesystem: true`: 루트권한의 파일시스템은 읽기전용으로만 가지는 옵션\
* `capabilities.drop[0]: "ALL"`: 리눅스 커널이 루트(root) 사용자에게 부여하는 수십 가지의 특수 권한을 하나도 남김없이 전부 제거하겠다는 옵션 (CAP_CHOWN, CAP_NET_ADMIN 등)
* `runAsUser`, `fsGroup` 옵션을 지정하도록 구성

### nodeNamespaceShareRestrict
* `hostNetwork: false`, `hostIPC: false`, `hostPID: false`: 파드를 호스트의 핵심 시스템 자원으로부터 완전히 격리시키기 위한 설정

### resources
메인 컨테이너의 리소스를 무조건 다음 조건으로 구성하겠다는 뜻
* CPU: requests만 부여
* 메모리: requests, limits 을 같게 부여


### dnsConfig
ndots=5 옵션으로 인해 DNS NXDOMAIS 이슈가 많아짐으로부터 방어
* 대부분 많이 통신하는 것은 ndots=2
* dot=2인 외부 서비스에 통신을 원활하게 하고, 내부 통신은 FQDN(dot=4) 으로 하면 NXDOMAINS 이슈 없음.


