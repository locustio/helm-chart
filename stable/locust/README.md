# locust

![Version: 0.9.10](https://img.shields.io/badge/Version-0.9.10-informational?style=flat-square) ![AppVersion: 1.4.3](https://img.shields.io/badge/AppVersion-1.4.3-informational?style=flat-square)

A chart for locust

**Homepage:** <https://github.com/locustio/locust>

## How to install this chart

Add Locust chart repo:

```console
helm repo add locustio https://locustio.github.io/
```

A simple install with default values:

```console
helm install locustio/locust
```

To install the chart with the release name `my-release`:

```console
helm install my-release locustio/locust
```

To install with some set values:

```console
helm install my-release locustio/locust --set values_key1=value1 --set values_key2=value2
```

To install with custom values file:

```console
helm install my-release locustio/locust -f values.yaml
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraConfigMaps | object | `{}` | Any extra configmaps to mount for the master and worker. Can be used for extra python packages |
| extraLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"locustio/locust"` |  |
| image.tag | string | `"1.4.3"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraPaths | list | `[]` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.tls | list | `[]` |  |
| loadtest.environment | object | `{}` | environment variables used in the load test |
| loadtest.locust_host | string | `"https://www.google.com"` | the host you will load test |
| loadtest.locust_lib_configmap | string | `""` | name of a configmap containing your lib |
| loadtest.locust_locustfile | string | `"main.py"` | the name of the locustfile |
| loadtest.locust_locustfile_configmap | string | `""` | name of a configmap containing your locustfile |
| loadtest.name | string | `"example"` | a name used for resources and settings in this load test |
| loadtest.pip_packages | list | `[]` | a list of extra python pip packages to install |
| master.args_include_default | bool | `true` | Whether to include default command args |
| master.command[0] | string | `"sh"` |  |
| master.command[1] | string | `"/config/docker-entrypoint.sh"` |  |
| master.image | string | `""` | A custom docker image including tag |
| master.logLevel | string | `"INFO"` | Log level. Can be INFO or DEBUG |
| master.pdb.enabled | bool | `false` | Whether to create a PodDisruptionBudget for the master pod |
| master.resources | object | `{}` | resources for the locust master |
| master.serviceAccountAnnotations | object | `{}` |  |
| master.strategy.type | string | `"RollingUpdate"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.extraLabels | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
| worker.args_include_default | bool | `true` | Whether to include default command args |
| worker.command[0] | string | `"sh"` |  |
| worker.command[1] | string | `"/config/docker-entrypoint.sh"` |  |
| worker.hpa.enabled | bool | `false` |  |
| worker.hpa.maxReplicas | int | `100` |  |
| worker.hpa.minReplicas | int | `1` |  |
| worker.hpa.targetCPUUtilizationPercentage | int | `40` |  |
| worker.image | string | `""` | A custom docker image including tag |
| worker.logLevel | string | `"INFO"` | Log level. Can be INFO or DEBUG |
| worker.replicas | int | `1` |  |
| worker.resources | object | `{}` | resources for the locust worker |
| worker.serviceAccountAnnotations | object | `{}` |  |
| worker.strategy.type | string | `"RollingUpdate"` |  |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| max-rocket-internet | max.williams@deliveryhero.com |  |
