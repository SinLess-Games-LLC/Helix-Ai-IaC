# Technologies Used for Helix AI

Helix AI leverages a sophisticated stack of cutting-edge technologies, supported by the [CNCF Landscape](https://landscape.cncf.io/), to power its advanced artificial intelligence platform. From infrastructure management to monitoring and observability, each component plays a crucial role in delivering high-performance and scalable AI solutions.

IF there is a :heavy_check_mark: in front of the technology, it means that the thechnology has been implemented in the Helix AI platform. If there is a :x: in front of the technology, it means that the technology has not been implemented in the Helix AI platform , but it is planned to be implemented in the future.

## Application Definition & Image Build:

- :heavy_check_mark: | ***[Helm](https://helm.sh/docs/) [cncf graduated]:*** Helm is a package manager for Kubernetes that simplifies the deployment and management of applications. It allows users to define their application components, configurations, and dependencies in a package called a "chart." Helm charts can be easily shared and versioned, making it easier to reproduce and manage complex Kubernetes deployments. Helm provides commands to install, upgrade, and remove charts, as well as rollback to previous versions if needed. Overall, Helm streamlines the deployment process, making it more efficient and less error-prone.

## Continuous Integration & Delivery:

- :heavy_check_mark: | ***[Flux](https://fluxcd.io/flux/) [cncf graduated]:*** FluxCD is a GitOps tool that automates the deployment and lifecycle management of applications on Kubernetes. It works by continuously monitoring a Git repository for changes to Kubernetes manifests and automatically applying those changes to the cluster. FluxCD supports automated deployments, canary releases, and rollbacks, making it easy to implement continuous delivery practices. It also integrates with other tools like Helm and Kustomize, allowing for flexible and customizable deployment workflows. Overall, FluxCD helps teams achieve a more reliable and consistent deployment process by leveraging Git as the single source of truth for cluster state.

- :heavy_check_mark: | ***[Github Actions](https://docs.github.com/en/actions):*** Github Actions is a CI/CD platform that allows developers to automate their software development workflows. It provides a wide range of pre-built actions and workflows that can be used to build, test, and deploy applications. Github Actions integrates seamlessly with Github repositories, making it easy to set up and manage CI/CD pipelines directly from the repository. It also supports custom actions and workflows, allowing for flexible and customizable automation. Overall, Github Actions provides a powerful and user-friendly platform for implementing CI/CD best practices.

## Database:

- :x: | ***[Mysql](https://dev.mysql.com/doc/) [cncf platinum]:*** MySQL is an open-source relational database management system that is widely used for web applications. It provides a robust and scalable platform for storing and managing structured data, making it suitable for a wide range of use cases. MySQL supports a variety of storage engines, including InnoDB and MyISAM, and provides features like replication, clustering, and sharding for high availability and scalability. Overall, MySQL is a popular choice for web applications due to its performance, reliability, and ease of use.

- :x: | ***[redis](https://redis.io/):*** Redis is an open-source, in-memory data structure store that is used as a database, cache, and message broker. It provides a rich set of data types and commands, making it suitable for a wide range of use cases, including caching, session storage, and pub/sub messaging. Redis supports high availability and clustering, making it suitable for large-scale deployments. Overall, Redis is a popular choice for applications that require fast, scalable, and reliable data storage.

## Streaming & Messaging:

- :x: | ***[cloud events](https://cloudevents.io/) [cncf graduated]:*** CloudEvents is a specification for describing event data in a common way. It provides a standard format for event data, making it easier to integrate and process events across different systems. CloudEvents supports a variety of event sources and event types, allowing for flexible and extensible event-driven architectures. It also provides a set of client libraries and SDKs for working with CloudEvents, making it easy to integrate with existing systems. Overall, CloudEvents provides a powerful and interoperable platform for building event-driven applications.

## Scheduling & Orchestration:

- :heavy_check_mark: | ***[Kubernetes (K3S)](https://docs.k3s.io/) [cncf graduated]:*** Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It provides a rich set of features for managing workloads, including pods, services, and deployments, making it suitable for a wide range of use cases. Kubernetes supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Kubernetes for specific requirements. Overall, Kubernetes is a popular choice for containerized applications due to its flexibility, reliability, and ease of use.

## Service Mesh:

- :x: | ***[Istio](https://istio.io/latest/docs/) [cncf graduated]:*** Istio is an open-source service mesh platform that provides a uniform way to connect, secure, and monitor microservices. It provides a rich set of features for managing traffic, including load balancing, routing, and fault tolerance, making it suitable for a wide range of use cases. Istio supports mutual TLS, access control, and observability, making it suitable for secure and reliable deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Istio for specific requirements. Overall, Istio is a popular choice for microservices architectures due to its flexibility, reliability, and ease of use.

## Service Proxy:

- :heavy_check_mark: | ***[Nginx ingress](https://kubernetes.github.io/ingress-nginx/) [cncf silver]:*** Nginx ingress is an open-source ingress controller for Kubernetes that provides traffic routing, load balancing, and SSL termination for HTTP and TCP traffic. It provides a rich set of features for managing ingress traffic, including path-based routing, host-based routing, and SSL termination, making it suitable for a wide range of use cases. Nginx ingress supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Nginx ingress for specific requirements. Overall, Nginx ingress is a popular choice for managing ingress traffic in Kubernetes due to its flexibility, reliability, and ease of use.

## Coordination & Service Discovery:

- :heavy_check_mark: | ***[Etcd](https://etcd.io/) [cncf graduated]:*** Etcd is a distributed key-value store that provides a reliable way to store and manage data across a cluster of machines. It provides a rich set of features for managing distributed systems, including data replication, consistency, and fault tolerance, making it suitable for a wide range of use cases. Etcd supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Etcd for specific requirements. Overall, Etcd is a popular choice for managing distributed systems due to its flexibility, reliability, and ease of use.

- :heavy_check_mark: | ***[CoreDNS](https://coredns.io/) [cncf graduated]:*** CoreDNS is a flexible, extensible DNS server that provides a reliable way to resolve domain names and manage DNS records. It provides a rich set of features for managing DNS traffic, including caching, forwarding, and load balancing, making it suitable for a wide range of use cases. CoreDNS supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of plugins and integrations, making it easy to extend and customize CoreDNS for specific requirements. Overall, CoreDNS is a popular choice for managing DNS traffic in Kubernetes due to its flexibility, reliability, and ease of use.

## Cloud Native Storage:

## Cloud Native Network:

- :heavy_check_mark: | ***[Cilium](https://docs.cilium.io/en/stable/) [cncf graduated]:*** Cilium is an open-source software for providing and securing network connectivity and load balancing between application workloads such as application containers or processes. Cilium operates at Layer 3/4 to provide traditional networking and security services, as well as at Layer 7 to protect and secure the use of modern application protocols such as HTTP, gRPC and Kafka. Cilium is integrated into the Linux kernel and can be used to secure network connectivity, enforce access control policies, and load balance traffic between application workloads.

## Container Runtime:

- :heavy_check_mark: | ***[Containerd](https://containerd.io/) [cncf graduated]:*** Containerd is an industry-standard core container runtime that provides a reliable way to run containerized applications. It provides a rich set of features for managing containers, including image management, container lifecycle management, and container networking, making it suitable for a wide range of use cases. Containerd supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Containerd for specific requirements. Overall, Containerd is a popular choice for running containerized applications due to its flexibility, reliability, and ease of use.

## Security & Compliance:

- :x: | ***[Falco](https://falco.org/) [cncf incubating]:*** Falco is an open-source, cloud-native runtime security project that provides intrusion and abnormality detection for platforms like Kubernetes, Mesos, and Cloud Foundry. It uses Sysdig's open-source system call capture technology to detect abnormal application behavior and provide security insights. Falco is designed to be highly extensible and can be integrated with other security tools and platforms.

- :heavy_check_mark: | ***[Cert-manager](https://cert-manager.io/docs/) [cncf graduated]:*** Cert-manager is a Kubernetes add-on to automate the management and issuance of TLS certificates from various sources. It will ensure certificates are valid and up to date, and attempt to renew certificates at a configured time before expiry.

## Automation & Configuration:

- :heavy_check_mark: | ***[Ansible](https://docs.ansible.com/) [cncf platinum]:*** Ansible is an open-source automation tool that provides a reliable way to automate infrastructure provisioning, configuration management, and application deployment. It provides a rich set of features for managing infrastructure, including playbooks, roles, and modules, making it suitable for a wide range of use cases. Ansible supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of integrations, making it easy to extend and customize Ansible for specific requirements. Overall, Ansible is a popular choice for automating infrastructure and application management due to its flexibility, reliability, and ease of use.

- :heavy_check_mark: | ***[Terraform](https://developer.hashicorp.com/terraform/docs) [cncf silver]:*** Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files. Terraform is a popular choice for managing infrastructure and application management due to its flexibility, reliability, and ease of use.

## Monitoring:

- :heavy_check_mark: | ***[Prometheus](https://prometheus.io/docs/introduction/overview/) [cncf graduated]:*** Prometheus is an open-source monitoring and alerting toolkit that is widely used for monitoring cloud-native applications. It provides a rich set of features for collecting, storing, and querying time-series data, making it suitable for a wide range of use cases. Prometheus supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of integrations, making it easy to extend and customize Prometheus for specific requirements. Overall, Prometheus is a popular choice for monitoring cloud-native applications due to its flexibility, reliability, and ease of use.

- :heavy_check_mark: | ***[Grafana](https://grafana.com/docs/grafana/latest/) [cncf graduated]:*** Grafana is an open-source platform for monitoring and observability that provides a rich set of features for visualizing and analyzing time-series data. It supports a wide range of data sources, including Prometheus, Graphite, and Elasticsearch, making it suitable for a wide range of use cases. Grafana supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of plugins and integrations, making it easy to extend and customize Grafana for specific requirements. Overall, Grafana is a popular choice for monitoring and observability due to its flexibility, reliability, and ease of use.

- :x: | ***[Thanos](https://thanos.io/) [cncf incubating]:*** Thanos is a set of components that can be composed into a highly available metric system with unlimited storage capacity. It can be added seamlessly on top of existing Prometheus deployments and leverages the Prometheus 2.0 storage format to cost-efficiently store historical metric data in any object storage while retaining fast query latencies. Additionally, it provides a global query view across all connected Prometheus servers, deduplicating and aggregating data across all servers transparently.

- :heavy_check_mark: | ***[Hubble](https://docs.cilium.io/en/v1.9/gettingstarted/hubble/):*** Hubble is a fully distributed networking and security observability platform that provides real-time visibility into the communication and behavior of services in a Kubernetes cluster. It is built on top of Cilium and eBPF to provide a scalable, efficient, and secure way to monitor and troubleshoot network traffic in Kubernetes.

## Tracing:

- :heavy_check_mark: | ***[Jaeger](https://www.jaegertracing.io/docs/1.18/) [cncf graduated]:*** Jaeger, inspired by Dapper and OpenZipkin, is a distributed tracing system released as open source by Uber Technologies. It is used for monitoring and troubleshooting microservices-based distributed systems, including distributed context propagation, distributed transaction monitoring, root cause analysis, service dependency analysis, and performance and latency optimization.

- :x: | ***[Grafana Tempo](https://grafana.com/docs/tempo/latest/) [cncf platinum]:*** Grafana Tempo is a high-volume, minimal dependency distributed tracing backend. It includes Grafana Loki for storage and emphasizes simplicity and speed.

## Chaos Engineering:

- :x: | ***[Chaos Mesh](https://chaos-mesh.org/) [cncf incubating]:*** Chaos Mesh is a cloud-native Chaos Engineering platform that orchestrates chaos on Kubernetes environments. It provides a set of tools for injecting faults and monitoring the impact on the system, allowing teams to proactively identify and fix potential issues before they impact users.

## Logging:

- :x: | ***[Grafana Loki](https://grafana.com/docs/loki/latest/) [cncf platinum]:*** Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost-effective and easy to operate, as it does not index the contents of the logs, but rather a set of labels for each log stream.

## Feature Flags:

- :x: | [Flagsmith](https://www.flagsmith.com): Flagsmith is an open-source, fully supported, Feature Flag and Remote Config service. Use our hosted API, deploy to your own private cloud, or run on-premise.