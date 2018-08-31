# Kubernetes Resource

## Installing

```yaml
resource_types:
- name: kubernetes
  type: docker-image
  source:
    repository: demilletech/concourse-kubernetes-resource
resources:
- name: kubernetes
  type: kubernetes
  source:
    cluster_url: https://hostname:port
    namespace: default
    cluster_ca: _contents of CA pem file_
    admin_key: _contents of key pem file_
    admin_cert: _contents certificate pem file_
    resource_type: deployment
    resource_name: some_pod_name
    container_name: some_container
```

## Source Configuration

* `cluster_url`: *Required.* URL to Kubernetes Master API service
* `namespace`: *Required.* Kubernetes namespace.
* `cluster_ca`: *Optional.* Contents of a PEM file. Required if `cluster_url` is https.
* `admin_key`: *Optional.* Contents of a PEM file. Required if `cluster_url` is https.
* `admin_cert`: *Optional.* Contents of a PEM file. Required if `cluster_url` is https.
* `resource_type`: *Required.* Resource type to operate upon (valid values: `deployment`, `replicationcontroller`, `job`).
* `resource_name`: *Required.* Resource name to operate upon.
* `container_name`: *Optional.* For multi-container pods, specify the name of the container being updated. (Default: resource_name)

#### `out`: Begins Kubernetes Deploy Process

Applies a kubectl action.

#### Parameters

* `image_name`: *Required.* Path to file containing docker image name.
* `image_tag`: *Required.* Path to file container docker image tag.

## Example

### Out

```yaml
---
resources:
- name: k8s
  type: kubernetes
  source:
    cluster_url: https://kube-master.domain.example
    namespace: alpha
    resource_type: deployment
    resource_name: myapp
    container_name: mycontainer
    cluster_ca: _contents of CA pem file_
    admin_key: _contents of key pem file_
    admin_cert: _contents certificate pem file_
```

```yaml
---
- put: k8s
  params:
    image_name: docker/repository
    image_tag: docker/tag
```
