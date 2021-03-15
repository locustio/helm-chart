# Helm chart for Locust

Here you can find the [Helm](https://helm.sh/) chart for installing [Locust](https://locust.io/) on Kubernetes.

## TLDR

```console
helm repo add locustio https://locustio.github.io/
helm install my-release locustio/locust
```

## The Chart

See [stable/locust](stable/locust) for the source.

## Contributing

Contributions are welcome 💚

This repository has multiple Github Actions to ensure quality is high, these include:

- [chart-testing](https://github.com/helm/chart-testing): lint and install tests
- [markdown-lint](https://github.com/avto-dev/markdown-lint): lint all markdown files
- [helm-docs](https://github.com/norwoodj/helm-docs): check all chart `README.md` have all values documented
- [helm-conftest](https://github.com/instrumenta/helm-conftest): Ensures standard labels are present

All chart `README.md` files are generated from a template. This ensures all values are documented and that formatting is consistent. See [here](https://github.com/norwoodj/helm-docs#valuesyaml-metadata) about how the table of values is produced and how to add descriptions to your chart values.

### Running CI tests locally

All commands to be run from the root of this repo.

`chart-testing`:

  ```console
  brew install chart-testing
  pip3 install yamale yamllint
  ct lint --charts stable/*
  ```

`markdown-lint`:

  ```console
  docker run --rm -v "$PWD:/helm-charts" avtodev/markdown-lint:v1.5.0 --config /helm-charts/ci/markdown-lint.yaml /helm-charts/**/*.md
  ```

`helm-docs`:

  To generate chart `README.md` files from the [template](ci/README.md.gotmpl):

  ```console
  docker run --rm -v "$PWD:/helm-docs" jnorwood/helm-docs:v0.14.0 --template-file=../../ci/README.md.gotmpl
  ```

`helm-conftest`:

  ```console
  brew tap instrumenta/instrumenta
  brew install conftest
  helm template stable/locust | conftest -p ci/helm-conftest-policies test - && echo "OK"
  ```
