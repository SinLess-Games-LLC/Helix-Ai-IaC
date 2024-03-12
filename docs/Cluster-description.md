<div align="center">
    <h1>Kubernetes Cluster Description</h1>
</div>
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
    <a href="https://helixaibot.com">
        <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fhelixaibot.com&up_message=Website%20UP&up_color=green&down_message=Website%20DOWN&down_color=red&style=for-the-badge&label=Helix%20Ai%20Website">
    </a>
    <a href="https://sinlessgamesllc.com">
        <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fsinlessgamesllc.com&up_message=Website%20UP&up_color=green&down_message=Website%20DOWN&down_color=red&style=for-the-badge&label=SinLess%20Games%20LLC%20Website">
    </a>
</div>


## Overview
This document provides a comprehensive overview of the architecture, components, and configuration of the [Kubernetes](https://kubernetes.io/docs/home/) cluster deployed for the SaaS application, Helix Ai, owned and developed by [SinLess Games LLC](https://sinlessgamesllc.com). The cluster is designed to be highly available, scalable, and secure, supporting the deployment and management of the Helix Ai application.

## Cluster Management

<div align="center">
    <h3>Distribution</h3>
</div>

The Kubernetes cluster is based on [k3s](https://docs.k3s.io/) version 1.29.1-k3s2 (The current latest as of 03/12/2024), a lightweight Kubernetes distribution designed for production workloads in resource-constrained environments. k3s provides all the core Kubernetes features, including the ability to run containerized applications at scale, while reducing the complexity and resource requirements of a typical Kubernetes deployment. The choice of k3s was made to ensure the cluster remains lightweight and easy to manage, while still providing the necessary functionality for the Helix Ai SaaS application.

<div align="center">
    <h3>Nodes</h3>
</div>

The Kubernetes cluster consists of 3 master nodes and 4 worker nodes, deployed on-premises to ensure [high availability](https://documentation.softwareag.com/webmethods/tamino/ins10-11/ha/ha.htm) and performance. The master nodes are responsible for managing the cluster's control plane components, including the API server, scheduler, and controller manager, while the worker nodes host the application workloads. The deployment of multiple master nodes enhances [fault tolerance](https://www.fortinet.com/resources/cyberglossary/fault-tolerance#:~:text=Fault%20tolerance%20is%20a%20process,operating%20despite%20failures%20or%20malfunctions.) and ensures that the cluster remains operational even if one of the master nodes fails. Similarly, the deployment of multiple worker nodes enables the cluster to handle a higher number of concurrent application workloads, improving overall performance and scalability.

## Namespaces

Namespaces are used to organize and segregate resources within the cluster, providing a logical boundary for different components and environments. The following namespaces are used in the Kubernetes cluster:


<div align="center">
    <h3>cert-manager</h3>
</div>

Manages SSL/TLS certificates for secure communication.

#### Components:

- **[Certmanager](https://cert-manager.io/docs/):** Manages SSL/TLS certificates for secure communication within the cluster.

<div align="center">
    <h3>data-plane</h3>
</div>

Houses data plane components, including [OpenEBS](https://openebs.io/docs/), [Redis Operator](https://ot-redis-operator.netlify.app/docs/), and [MySQL Operator](https://dev.mysql.com/doc/mysql-operator/en/mysql-operator-introduction.html).

#### Components:

- **[OpenEBS](https://openebs.io/docs/):** Provides storage management capabilities within the data-plane namespace.
- **[Redis Operator](https://ot-redis-operator.netlify.app/docs/):** Manages Redis instances within the data-plane namespace.
- **[MySQL Operator](https://dev.mysql.com/doc/mysql-operator/en/mysql-operator-introduction.html):** Manages MySQL instances within the data-plane namespace.

<div align="center">
    <h3>flux-system</h3>
</div>

Used for [Flux CD](https://fluxcd.io/flux/) components and GitOps workflows.

#### Components:

- **[Flux CD](https://fluxcd.io/flux/):** Implements GitOps workflows for declarative and automated cluster configuration.
- **[Flagger](https://docs.flagger.app/):** Provides progressive delivery and canary deployment capabilities.

<div align="center">
    <h3>istio-system</h3>
</div>

 Contains [Istio](https://istio.io/latest/docs/) service mesh components for advanced traffic management and security.

 #### Components:

- **[Istio](https://istio.io/latest/docs/):** Provides advanced traffic management, security, and observability features through its service mesh capabilities.

<div align="center">
    <h3>kube-system</h3>
</div>

Houses essential [Kubernetes](https://kubernetes.io/docs/home/) system components such as [Cilium](https://docs.cilium.io/en/stable/), [Metrics Server](https://github.com/kubernetes-sigs/metrics-server), and [Stakater Reloader](https://github.com/stakater/Reloader).

#### Components:

- **[Cilium](https://docs.cilium.io/en/stable/):** Provides network security within the kube-system namespace.
- **[Metrics Server](https://github.com/kubernetes-sigs/metrics-server):** Collects resource usage metrics from the cluster.
- **[Stakater Reloader](https://github.com/stakater/Reloader):** Watches changes in ConfigMap and Secret and restarts pods for the changes to take effect.

<div align="center">
    <h3>monitoring</h3>
</div>

Contains monitoring and observability tools, including [Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources), [Prometheus](https://prometheus.io/docs/introduction/overview/), and [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/).

#### Components:

- **[Prometheus](https://prometheus.io/docs/introduction/overview/):** Collects metrics from various components in the cluster for monitoring purposes.
- **[Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources):** Visualizes metrics and provides dashboards for monitoring purposes.
    - **[Mimir](https://grafana.com/docs/mimir/latest/):** Grafana Mimir is an open source software project that provides a scalable long-term storage for Prometheus.
    - **[Loki](https://grafana.com/docs/loki/latest/):** Grafana Loki is a set of components that can be composed into a fully featured logging stack.
    - **[OnCall](https://grafana.com/docs/oncall/latest/):** Grafana OnCall is an incident response and on-call management system that helps teams reduce the stress and maintenance of being on-call. Based on the Grafana OnCall OSS project, Grafana OnCall is available on Grafana Cloud as part of the Grafana Incident Response & Management (IRM) solution.
    - **[Tempo](https://grafana.com/docs/tempo/latest/):** Grafana Tempo is an open source, easy-to-use, and high-volume distributed tracing backend. Tempo is cost-efficient, and only requires an object storage to operate. Tempo is deeply integrated with Grafana, Mimir, Prometheus, and Loki. You can use Tempo with open-source tracing protocols, including Jaeger, Zipkin, or OpenTelemetry.
    = **[Application Observability](https://grafana.com/docs/grafana-cloud/monitor-applications/application-observability/):** Grafana Application Observability is an observability solution designed to minimize the mean time to repair (MTTR) for modern application problems based on OpenTelemetry semantic conventions and the Prometheus data-model.
    - **[Pyroscope](https://grafana.com/docs/pyroscope/latest/):** Grafana Pyroscope is an open source software project for aggregating continuous profiling data. Continuous profiling is an observability signal that allows you to understand your workload’s resources (CPU, memory, etc.) usage down to the line number.
    - **[Agent](https://grafana.com/docs/agent/latest/):**
- **[Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/):** Handles alert notifications based on predefined rules.


<div align="center">
    <h3>network</h3>
</div>

Houses networking components such as [NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/) and [Cloudflared](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/) for DNS management.

<div align="center">
    <h3>production</h3>
</div>

Contains resources for the production environment.

<div align="center">
    <h3>staging</h3>
</div>

Contains resources for the staging environment.

<div align="center">
    <h3>system-upgrade</h3>
</div>

Used for managing cluster upgrades.

## Components

The Kubernetes cluster is equipped with various components and tools to support the deployment, management, and monitoring of the Helix Ai application. The following components are deployed within the cluster:


- **[Flux CD](https://fluxcd.io/flux/):** Implements GitOps workflows for declarative and automated cluster configuration.
- **[Istio](https://istio.io/latest/docs/):** Provides advanced traffic management, security, and observability features through its service mesh capabilities.
- **[NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/):** Handles external traffic routing into the cluster, with both internal and external configurations.
- **[OpenEBS](https://openebs.io/docs/):** Provides storage management capabilities within the data-plane namespace.
- **[Prometheus](https://prometheus.io/docs/introduction/overview/):** Collects metrics from various components in the cluster for monitoring purposes.
- **[Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources):** Visualizes metrics and provides dashboards for monitoring purposes, including various Grafana components such as .
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

The Kubernetes cluster is integrated with various CI/CD and DevOps tools to support the development, deployment, and management of the Helix Ai application. The following tools and practices are implemented:

- Utilizes [GitHub Actions](https://docs.github.com/en/actions) and webhooks for continuous integration.
- Implements [DevSecOps](https://devsecopsdocs.com/) practices throughout the workflow, ensuring security is integrated into development and operations processes.

## Security

The Kubernetes cluster is designed with security in mind, implementing various measures to protect the cluster and its workloads. The following security features and practices are implemented:

- Utilizes [Mozilla SOPS](https://github.com/mozilla/sops) and Age for secrets management.
- Implements [Cilium](https://docs.cilium.io/en/stable/) for network security within the kube-system namespace.
- Utilizes [Falco](https://falco.org/docs/) for runtime security monitoring and anomaly detection.
- Implements [Trivy Operator](https://aquasecurity.github.io/trivy-operator/latest/) for vulnerability scanning of containers.

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
