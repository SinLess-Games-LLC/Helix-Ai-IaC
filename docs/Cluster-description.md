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

<br/>
<h3>cert-manager</h3>

Cert-manager is a Kubernetes add-on that automates the management and issuance of SSL/TLS certificates. It integrates with the Kubernetes API to provide a way to issue certificates for various use cases, such as securing web applications, internal services, and more. Cert-manager ensures that certificates are automatically renewed before they expire, reducing the manual effort required to manage certificates.

#### Components:

- **[Certmanager](https://cert-manager.io/docs/):** The Certmanager component manages SSL/TLS certificates for secure communication within the cluster. It includes features such as automatic certificate issuance, renewal, and revocation, as well as integration with various certificate authorities (CAs) and Kubernetes Ingress resources.

<br/>
<h3>data-plane</h3>

The data-plane namespace is dedicated to housing data plane components, which are responsible for processing and forwarding data within the Kubernetes cluster. These components are crucial for the functioning of various applications and services running in the cluster.

#### Components:

- **[OpenEBS](https://openebs.io/docs/):** OpenEBS is a popular open-source storage solution for Kubernetes that provides storage management capabilities within the data-plane namespace. It offers features such as dynamic provisioning, snapshots, and storage policies to ensure reliable and scalable storage for application workloads.
- **[Redis Operator](https://ot-redis-operator.netlify.app/docs/):** The Redis Operator manages Redis instances within the data-plane namespace. It automates the deployment, scaling, and management of Redis clusters, making it easier to use Redis for caching and data storage in Kubernetes.
- **[MySQL Operator](https://dev.mysql.com/doc/mysql-operator/en/mysql-operator-introduction.html):** The MySQL Operator manages MySQL instances within the data-plane namespace. It simplifies the deployment and management of MySQL databases in Kubernetes, providing features such as automated backups, scaling, and high availability configurations.

<br/>
<h3>flux-system</h3>

The flux-system namespace is used to house components related to Flux CD, which is a tool for implementing GitOps workflows. GitOps is a way to do Kubernetes cluster management and application delivery that relies on Git as a single source of truth for declarative infrastructure and applications.

#### Components:

- **[Flux CD](https://fluxcd.io/flux/):** Flux CD is a tool that automates the deployment and lifecycle management of applications in Kubernetes clusters. It works by synchronizing the state of a Git repository with the cluster, ensuring that the cluster's configuration matches the desired state defined in the repository.
- **[Flagger](https://docs.flagger.app/):** Flagger is a progressive delivery tool that integrates with Flux CD to automate the promotion of canary deployments. It provides advanced deployment strategies such as canary releases, A/B testing, and blue-green deployments, allowing for safer and more controlled application deployments.

<br/>
<h3>istio-system</h3>

The istio-system namespace contains components of Istio, which is a popular service mesh platform for Kubernetes. Istio provides advanced traffic management, security, and observability features, making it easier to manage and secure microservices-based applications.

#### Components:

- **[Istio Pilot](https://istio.io/latest/docs/ops/deployment/architecture/#pilot):** Pilot is responsible for configuring the Envoy proxies deployed alongside your application services. It translates high-level routing rules into Envoy-specific configurations and dynamically propagates them to the Envoy proxies.
- **[Istio Citadel](https://istio.io/latest/docs/ops/deployment/architecture/#citadel):** Citadel provides strong service-to-service and end-user authentication with built-in identity and credential management. It manages the issuance and rotation of certificates for services in the mesh.
- **[Istio Galley](https://istio.io/latest/docs/ops/deployment/architecture/#galley):** Galley is Istio's configuration validation, ingestion, processing, and distribution component. It ensures that configuration is propagated to all components in the Istio mesh.
- **[Istio Mixer](https://istio.io/latest/docs/ops/deployment/architecture/#mixer):** Mixer enforces access control and usage policies across the service mesh and collects telemetry data from the Envoy proxies and other services. It provides a centralized policy and telemetry hub for Istio.
- **[Istio Sidecar Injector](https://istio.io/latest/docs/ops/configuration/traffic-management/sidecar-injection/):** The sidecar injector is a mutating webhook that automatically injects Envoy sidecar proxies into pods. This allows Istio to control and monitor traffic to and from the pods.
- **[Istio Ingress Gateway](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/):** The Ingress Gateway is the entry point for traffic coming into the mesh. It routes external traffic to the appropriate services inside the mesh based on the defined routing rules.
- **[Istio Egress Gateway](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/):** The Egress Gateway allows traffic from inside the mesh to egress to external services. It provides control over egress traffic and can enforce policies for external communication.
- **[Istio Telemetry](https://istio.io/latest/docs/ops/integrations/observability/):** Istio provides various telemetry components, including metrics, logs, and traces, to observe and troubleshoot your services. This includes integration with tools like Prometheus, Grafana, Jaeger, and Kiali for monitoring and observability.

<br/>
<h3>kube-system</h3>

The kube-system namespace houses essential Kubernetes system components that are necessary for the cluster's operation and management.

#### Components:

- **[Cilium](https://docs.cilium.io/en/stable/):** Cilium provides network security within the kube-system namespace. It offers features such as network policy enforcement, transparent encryption, and API-aware network visibility.
- **[Metrics Server](https://github.com/kubernetes-sigs/metrics-server):** Metrics Server collects resource usage metrics from the cluster, such as CPU and memory usage of pods and nodes. These metrics are used for monitoring and autoscaling purposes.
- **[Stakater Reloader](https://github.com/stakater/Reloader):** Reloader watches changes in ConfigMap and Secret objects and restarts pods that use these resources to apply the changes. This ensures that configuration updates are applied to the running pods.
- **[Falco](https://falco.org/docs/):** Falco is added to the kube-system namespace for runtime security monitoring and anomaly detection. It monitors system calls and detects abnormal behavior in real-time, helping to identify and respond to potential security threats.
- **[Trivy Operator](https://aquasecurity.github.io/trivy-operator/latest/):** Trivy Operator is added to the kube-system namespace for vulnerability scanning of containers. It scans container images for known vulnerabilities and provides reports to help ensure that only secure images are deployed in the cluster.
- **[Chaos Mesh](https://chaos-mesh.org/docs/):** Chaos Mesh is used for chaos engineering and testing, ensuring the resilience and reliability of the cluster. It allows users to simulate various failure scenarios, such as network latency, pod failures, and clock skew, to validate the cluster's robustness under adverse conditions.

<br/>
<h3>monitoring</h3>

The monitoring namespace contains monitoring and observability tools that provide insights into the health and performance of the Kubernetes cluster and the applications running on it.

#### Components:

- **[Prometheus](https://prometheus.io/docs/introduction/overview/):** Prometheus collects metrics from various components in the cluster for monitoring purposes. It stores these metrics in a time-series database and provides a powerful query language for data analysis and alerting.
- **[Grafana](https://grafana.com/docs/grafana/latest/getting-started/build-first-dashboard/?pg=oss-graf&plcmt=resources):** Grafana visualizes metrics and provides dashboards for monitoring purposes. It allows users to create custom dashboards to visualize the data collected by Prometheus and other data sources. Additionally, Grafana supports plugins that extend its functionality, such as Grafana Mimir, Loki, OnCall, Tempo, Application Observability, Pyroscope, and Agent.
    - **[Mimir](https://grafana.com/docs/mimir/latest/):** Grafana Mimir is an open-source project that provides scalable long-term storage for Prometheus metrics. It allows users to store and query metrics over a longer period, enabling historical analysis and trend analysis.
    - **[Loki](https://grafana.com/docs/loki/latest/):** Grafana Loki is a set of components that provide a fully-featured logging stack. It is designed to be highly scalable and efficient, allowing users to store and query logs from multiple sources.
    - **[OnCall](https://grafana.com/docs/oncall/latest/):** Grafana OnCall is an incident response and on-call management system that helps teams manage on-call rotations and incidents. It integrates with Grafana Cloud for seamless incident management and communication.
    - **[Tempo](https://grafana.com/docs/tempo/latest/):** Grafana Tempo is an open-source, high-volume distributed tracing backend. It is designed to be cost-efficient and easy to use, providing observability into distributed systems.
    - **[Application Observability](https://grafana.com/docs/grafana-cloud/monitor-applications/application-observability/):** Grafana Application Observability is an observability solution that helps minimize the mean time to repair (MTTR) for modern application problems. It is based on OpenTelemetry semantic conventions and the Prometheus data model.
    - **[Pyroscope](https://grafana.com/docs/pyroscope/latest/):** Grafana Pyroscope is an open-source project for aggregating continuous profiling data. It allows users to understand their workload's resource usage down to the line number, helping to optimize performance.
    - **[Agent](https://grafana.com/docs/agent/latest/):** Grafana Agent is an OpenTelemetry Collector distribution with Terraform-inspired configuration. It is designed to be flexible, performant, and compatible with multiple ecosystems, such as Prometheus and OpenTelemetry.
- **[Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/):** Alertmanager handles alert notifications based on predefined rules. It integrates with Prometheus to send notifications via various channels, such as email, Slack, or PagerDuty, based on the severity of the alert.

<br/>
<h3>network</h3>


Houses networking components such as [NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/) and [Cloudflared](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/) for DNS management.

#### Components:

- **[Cloudflared](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel/):** Enables secure DNS tunneling within the cluster for enhanced security.
- **[NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/):** Handles external traffic routing into the cluster, with both internal and external configurations
- **[CoreDNS](https://coredns.io/):** CoreDNS is a flexible, extensible DNS server that can be used as a Kubernetes DNS plugin. It provides service discovery and DNS resolution for Kubernetes clusters, ensuring that applications can communicate with each other using DNS names.
- **[External DNS](https://kubernetes-sigs.github.io/external-dns/v0.14.0/):** External DNS is a Kubernetes add-on that automatically configures DNS records for Kubernetes services and ingresses. It integrates with various DNS providers, such as AWS Route 53, Google Cloud DNS, and Azure DNS, to manage DNS records for external services.
- **[Istio](https://istio.io/latest/docs/):** Provides advanced traffic management, security, and observability features through its service mesh capabilities.
- **[NGINX Ingress Controller](https://docs.nginx.com/nginx-ingress-controller/):** Handles external traffic routing into the cluster, with both internal and external configurations.

<br/>
<h3>production</h3>


Contains resources for the production environment.

#### Components:

- **[Kafka operator](https://strimzi.io/docs/operators/latest/overview):** Deployed in both staging and production environments for messaging and event streaming purposes.
- **[Flagsmith](https://docs.flagsmith.com/deployment/hosting/kubernetes):** Added to the production namespace for feature flag and remote configuration management.

<br/>
<h3>staging</h3>


Contains resources for the staging environment.

#### Components:

- **[Kafka operator](https://strimzi.io/docs/operators/latest/overview):** Deployed in both staging and production environments for messaging and event streaming purposes.

<br/>
<h3>system-upgrade</h3>

Used for managing cluster upgrades.

#### Components:

- **System Upgrade Controller:** Manages cluster upgrades, ensuring the cluster remains up to date with the latest versions of components.
- **[K3s Upgrade Plan](https://rancher.com/docs/k3s/latest/en/upgrades/):** Provides a plan for upgrading the k3s distribution to the latest version.

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
