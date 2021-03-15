# locust

A chart to install Locust, a scalable load testing tool written in Python.

This chart will setup everything required to run a full distributed locust environment with any amount of workers.

This chart will also create configmaps for storing the locust files in Kubernetes, this way there is no need to build custom docker images.

By default it will install using an example locustfile and lib from [stable/locust/locustfiles/example](https://github.com/locustio/helm-chart/tree/master/stable/locust/locustfiles/example). When you want to provide your own locustfile, you will need to create 2 configmaps using the structure from that example:

```console
kubectl create configmap my-loadtest-locustfile --from-file path/to/your/main.py
kubectl create configmap my-loadtest-lib --from-file path/to/your/lib/
```

And then install the chart passing the names of those configmaps as values:

```console
helm install locust ./stable/locust \
  --set loadtest.name=my-loadtest \
  --set loadtest.locust_locustfile_configmap=my-loadtest-locustfile \
  --set loadtest.locust_lib_configmap=my-loadtest-lib
```

**Homepage:** <https://github.com/locustio/locust>

## How to install this chart

Check out this repo and then install the chart:

```console
helm install my-release ./stable/locust -f values.yaml
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
