<div align="center">
    <h1>Kubernetes Cluster Description</h1>
</div>
<br/>
<br/>
<div align="center">
    <a href="https://helixaibot.com/" target="blank">
        <img 
            src="https://github.com/SinLess-Games-LLC/Helix-Ai/raw/master/DOCS/images/logos/Favicon-01.png" 
            width="350" 
            alt="Helix Ai Logo"
        />
    </a>
</div>
<br/>
<div align="center" >
    <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fhelixaibot.com&up_message=Website%20UP&up_color=green&down_message=Website%20DOWN&down_color=red&style=for-the-badge&label=Helix%20Ai%20Website">
</div>


## Overview
This document provides a comprehensive overview of the architecture, components, and configuration of the [Kubernetes](https://kubernetes.io/docs/home/) cluster deployed for the SaaS application, Helix Ai, owned and developed by [SinLess Games LLC](https://sinlessgamesllc.com). The cluster is designed to be highly available, scalable, and secure, supporting the deployment and management of the Helix Ai application.

## Cluster Management
- **Distribution:** The cluster is based on [k3s](https://docs.k3s.io/) version 1.29.1-k3s2, chosen for its lightweight nature and ease of management.
- **Nodes:** The cluster comprises 3 master nodes and 4 worker nodes, deployed on-premises for high availability and performance.

## Namespaces
- **cert-manager:** Manages SSL/TLS certificates for secure communication.
- **data-plane:** Houses data plane components, including [OpenEBS](https://openebs.io/docs/), [Redis Operator](https://ot-redis-operator.netlify.app/docs/), and [MySQL Operator](https://dev.mysql.com/doc/mysql-operator/en/mysql-operator-introduction.html).
- **flux-system:** Used for [Flux CD](https://fluxcd.io/flux/) components and GitOps workflows.
- **istio-system:** Contains [Istio](https://istio.io/latest/docs/) service mesh components for advanced traffic management and security.
- **kube-system:** Houses essential [Kubernetes](https://kubernetes.io/docs/home/) system components such as [Cilium](https://docs.cilium.io/en/stable/), [Metrics Server](https://github.com/kubernetes-sigs/metrics-server), and [Stakater Reloader](https://github.com/stakater/Reloader).
- **monitoring:** Contains monitoring and observability tools, including [Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources), [Prometheus](https://prometheus.io/docs/introduction/overview/), and [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/).
- **network:** Houses networking components such as [NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/) and [Cloudflared](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/) for DNS management.
- **production:** Contains resources for the production environment.
- **staging:** Contains resources for the staging environment.
- **system-upgrade:** Used for managing cluster upgrades.

## Components
- **[Certmanager](https://cert-manager.io/docs/):** Manages SSL/TLS certificates for secure communication within the cluster.
- **[Flux CD](https://fluxcd.io/flux/):** Implements GitOps workflows for declarative and automated cluster configuration.
- **[Istio](https://istio.io/latest/docs/):** Provides advanced traffic management, security, and observability features through its service mesh capabilities.
- **[NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/):** Handles external traffic routing into the cluster, with both internal and external configurations.
- **[OpenEBS](https://openebs.io/docs/):** Provides storage management capabilities within the data-plane namespace.
- **[Prometheus](https://prometheus.io/docs/introduction/overview/):** Collects metrics from various components in the cluster for monitoring purposes.
- **[Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources):** Visualizes metrics and provides dashboards for monitoring purposes, including various Grafana components such as [Mimir](https://grafana.com/docs/mimir/latest/), [Loki](https://grafana.com/docs/loki/latest/), [OnCall](https://grafana.com/docs/oncall/latest/), [Tempo](https://grafana.com/docs/tempo/latest/), [Application Observability](https://grafana.com/docs/grafana-cloud/monitor-applications/application-observability/), [Pyroscope](https://grafana.com/docs/pyroscope/latest/), and [Agent](https://grafana.com/docs/agent/latest/).
- **[Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/):** Handles alert notifications based on predefined rules, ensuring timely response to incidents.
- **[Redis Operator](https://ot-redis-operator.netlify.app/docs/) and [MySQL Operator](https://dev.mysql.com/doc/mysql-operator/en/mysql-operator-introduction.html):** Deployed within the data-plane namespace to manage Redis and MySQL instances respectively.
- **[Chaos Mesh](https://chaos-mesh.org/docs/):** Used for chaos engineering and testing, ensuring resilience and reliability of the cluster.
- **[Kafka operator](https://strimzi.io/docs/operators/latest/overview):** Deployed in both staging and production environments for messaging and event streaming purposes.
- **System Upgrade Controller:** Manages cluster upgrades, ensuring the cluster remains up to date with the latest versions of components.
- **[Cloudflared](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/):** Enables secure DNS tunneling within the cluster for enhanced security.
- **[Falco](https://falco.org/docs/):** Added to the kube-system namespace for runtime security monitoring and anomaly detection.
- **[Trivy Operator](https://aquasecurity.github.io/trivy-operator/latest/):** Added to the kube-system namespace for vulnerability scanning of containers.
- **[Flagsmith](https://docs.flagsmith.com/deployment/hosting/kubernetes):** Added to the production namespace for feature flag and remote configuration management.

## CI/CD and DevOps
- Utilizes [GitHub Actions](https://docs.github.com/en/actions) and webhooks for continuous integration.
- Implements [DevSecOps](https://devsecopsdocs.com/) practices throughout the workflow, ensuring security is integrated into development and operations processes.

## Security
- Utilizes [Mozilla SOPS](https://github.com/mozilla/sops) and Age for secrets management.
- Implements [Cilium](https://docs.cilium.io/en/stable/) for network security within the kube-system namespace.

## Observability
- Uses various monitoring and observability tools such as [Prometheus](https://prometheus.io/docs/introduction/overview/), [Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources), and [Istio](https://istio.io/latest/docs/) for comprehensive visibility into the cluster's health and performance.

## Scalability and High Availability
- Planned high availability with multiple master and worker nodes, ensuring resilience and fault tolerance.
- Implements autoscaling for both nodes and pods in AWS, providing elasticity to handle varying workload demands.

## Infrastructure Management
- Utilizes [Ansible](https://docs.ansible.com/), [Terraform](https://developer.hashicorp.com/terraform/docs), and [go-task](https://taskfile.dev/) for infrastructure provisioning, configuration management, and task automation.

## Disaster Recovery
- Implements disaster recovery strategies to ensure business continuity in case of unforeseen incidents.

---

This document provides a detailed description of the Kubernetes cluster, highlighting its key components, namespaces, and configurations. It serves as a reference for understanding the architecture and design of the cluster deployed for the Helix Ai application.
