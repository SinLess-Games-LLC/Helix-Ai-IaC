# Cluster Description

## Overview

This document provides a detailed overview of the Kubernetes cluster managed by Helixaibot under the domain [helixaibot.com](http://helixaibot.com/).

## Cluster Management

The cluster is managed using the lightweight Kubernetes distribution [k3s](https://k3s.io/), version 1.29.1-k3s2, known for its simplicity and efficiency.

## Namespaces

The cluster includes the following namespaces, each serving specific purposes:

- **certmanager**: For managing SSL/TLS certificates.
- **data-plane** (formerly openebs-system): For [OpenEBS](https://docs.openebs.io/) storage management.
- **flux-system**: For [Flux CD](https://fluxcd.io/) components and GitOps workflows.
- **istio-system**: For [Istio](https://istio.io/) service mesh components.
- **kube-system**: For essential Kubernetes system components.
- **monitoring**: For monitoring and observability tools.
- **network**: For networking components such as [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) and DNS management.
- **production**: For production environment resources.
- **staging**: For staging environment resources.
- **system-upgrade**: For managing cluster upgrades.
- **testing**: For testing environment resources.

## Components

### kube-system

- **[Cilium](https://cilium.io/)**: Provides network security.
- **Metrics Server**: Collects resource usage metrics.
- **Stakater Reloader**: Automatically reloads resources like ConfigMaps and Secrets.

### network

- **Cloudflared**: Enables secure DNS tunneling.
- **Echo server**: Used for testing purposes.
- **External DNS**: Automatically manages DNS records for external services.
- **NGINX Ingress Controller**: Routes external traffic into the cluster, both internally and externally.
- **K8s gateway**: Acts as a gateway for Kubernetes services.

### system-upgrade

- **System Upgrade Controller**: Manages cluster upgrades.
- **k3s plan**: Provides a plan for upgrading the k3s distribution.

### data-plane

- **Redis Operator**: Manages Redis instances.
- **MySQL Operator**: Manages MySQL databases.
- **Kafka**: Highly available Kafka cluster for messaging.

### monitoring

- **[Grafana](https://grafana.com/)**: Provides metrics visualization, including Mimir, Loki, OnCall, Tempo, Application Observability, Pyroscope, and Agent.
- **[Prometheus](https://prometheus.io/)**: Collects metrics from the cluster.
- **[Alertmanager](https://prometheus.io/docs/alerting/alertmanager/)**: Handles alert notifications based on predefined rules.
- **[Grafana Kubernetes Monitoring](https://grafana.com/docs/grafana-cloud/grafana-kubernetes-monitoring/)**: Provides detailed monitoring for Kubernetes components.

## Traffic Management

- [Istio](https://istio.io/) and [Flagger](https://flagger.app/) for advanced traffic management and canary deployments.
- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/) serves as the public-facing entry point, with Istio providing load balancing.

## CI/CD and DevOps

- [Flux CD](https://fluxcd.io/) and [GitHub Actions](https://github.com/features/actions) for GitOps workflows and continuous integration.
- Webhooks used for triggering CI/CD processes.
- DevSecOps practices integrated into the workflow.

## Infrastructure Management

- [Ansible](https://docs.ansible.com/ansible/latest/index.html), [Terraform](https://www.terraform.io/docs/index.html), and [go-task](https://taskfile.dev/) for infrastructure provisioning, configuration management, and task automation.

## Security

- [Mozilla SOPS](https://github.com/mozilla/sops) and [Age](https://github.com/FiloSottile/age) for secrets management.
- Cilium for network security.
- DevSecOps practices implemented throughout the workflow.

## Testing

- Separate namespace for testing environment resources.

## Scalability and High Availability

- Planned high availability with 3 master nodes and 4 worker nodes deployed on-premises.
- Autoscaling for both nodes and pods in AWS.

## Additional Components

- [Chaos Mesh](https://chaos-mesh.org/) for chaos engineering and testing.
- Disaster recovery strategies implemented.

---

Feel free to adjust or expand this document as needed for your documentation purposes.