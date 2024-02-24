# Technologies Used for Helix AI

Helix AI leverages a sophisticated stack of cutting-edge technologies, supported by the [CNCF Landscape](https://landscape.cncf.io/), to power its advanced artificial intelligence platform. From infrastructure management to monitoring and observability, each component plays a crucial role in delivering high-performance and scalable AI solutions.

IF there is a :heavy_check_mark: in front of the technology, it means that the thechnology has been implemented in the Helix AI platform. If there is a :x: in front of the technology, it means that the technology has not been implemented in the Helix AI platform , but it is planned to be implemented in the future.

## Application Definition & Image Build:

- :heavy_check_mark: | **[Helm](https://helm.sh/docs/) [cncf graduated]:** Helm is a package manager for Kubernetes that simplifies the deployment and management of applications. It allows users to define their application components, configurations, and dependencies in a package called a "chart." Helm charts can be easily shared and versioned, making it easier to reproduce and manage complex Kubernetes deployments. Helm provides commands to install, upgrade, and remove charts, as well as rollback to previous versions if needed. Overall, Helm streamlines the deployment process, making it more efficient and less error-prone.

## Continuous Integration & Delivery:

- :heavy_check_mark: | **[Flux](https://fluxcd.io/flux/) [cncf graduated]:** FluxCD is a GitOps tool that automates the deployment and lifecycle management of applications on Kubernetes. It works by continuously monitoring a Git repository for changes to Kubernetes manifests and automatically applying those changes to the cluster. FluxCD supports automated deployments, canary releases, and rollbacks, making it easy to implement continuous delivery practices. It also integrates with other tools like Helm and Kustomize, allowing for flexible and customizable deployment workflows. Overall, FluxCD helps teams achieve a more reliable and consistent deployment process by leveraging Git as the single source of truth for cluster state.
- :heavy_check_mark: | **[Github Actions](https://docs.github.com/en/actions):** Github Actions is a CI/CD platform that allows developers to automate their software development workflows. It provides a wide range of pre-built actions and workflows that can be used to build, test, and deploy applications. Github Actions integrates seamlessly with Github repositories, making it easy to set up and manage CI/CD pipelines directly from the repository. It also supports custom actions and workflows, allowing for flexible and customizable automation. Overall, Github Actions provides a powerful and user-friendly platform for implementing CI/CD best practices.
- :x: | **[weave gitops](https://github.com/weaveworks/weave-gitops) [cncf silver]:** Weave GitOps is a GitOps management platform that provides a declarative way to manage applications and infrastructure on Kubernetes. It uses Git as the source of truth for cluster state, allowing teams to define their desired state in version-controlled repositories. Weave GitOps supports automated deployments, rollbacks, and policy enforcement, making it easy to implement best practices for Kubernetes operations. It also integrates with other tools like Helm and Kustomize, providing a flexible and extensible platform for managing Kubernetes workloads. Overall, Weave GitOps helps teams achieve a more reliable and consistent deployment process by leveraging Git as the single source of truth for cluster state.

**Database:**
- :x: | **[Mysql]() [cncf platinum]:** MySQL is an open-source relational database management system that is widely used for web applications. It provides a robust and scalable platform for storing and managing structured data, making it suitable for a wide range of use cases. MySQL supports a variety of storage engines, including InnoDB and MyISAM, and provides features like replication, clustering, and sharding for high availability and scalability. Overall, MySQL is a popular choice for web applications due to its performance, reliability, and ease of use.
- :x: | **[redis](https://redis.io/):** Redis is an open-source, in-memory data structure store that is used as a database, cache, and message broker. It provides a rich set of data types and commands, making it suitable for a wide range of use cases, including caching, session storage, and pub/sub messaging. Redis supports high availability and clustering, making it suitable for large-scale deployments. Overall, Redis is a popular choice for applications that require fast, scalable, and reliable data storage.

**Streaming & Messaging:**
- :x: | **[cloud events](https://cloudevents.io/) [cncf graduated]:** CloudEvents is a specification for describing event data in a common way. It provides a standard format for event data, making it easier to integrate and process events across different systems. CloudEvents supports a variety of event sources and event types, allowing for flexible and extensible event-driven architectures. It also provides a set of client libraries and SDKs for working with CloudEvents, making it easy to integrate with existing systems. Overall, CloudEvents provides a powerful and interoperable platform for building event-driven applications.

**Scheduling & Orchestration:**
- :heavy_check_mark: | **[Kubernetes (K3S)](https://docs.k3s.io/) [cncf graduated]:** Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It provides a rich set of features for managing workloads, including pods, services, and deployments, making it suitable for a wide range of use cases. Kubernetes supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Kubernetes for specific requirements. Overall, Kubernetes is a popular choice for containerized applications due to its flexibility, reliability, and ease of use.

**Service Mesh:**
- :x: | **[Istio](https://istio.io/latest/docs/) [cncf graduated]:** Istio is an open-source service mesh platform that provides a uniform way to connect, secure, and monitor microservices. It provides a rich set of features for managing traffic, including load balancing, routing, and fault tolerance, making it suitable for a wide range of use cases. Istio supports mutual TLS, access control, and observability, making it suitable for secure and reliable deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Istio for specific requirements. Overall, Istio is a popular choice for microservices architectures due to its flexibility, reliability, and ease of use.

**Service Proxy:**
- :heavy_check_mark: | **[Nginx ingress](https://kubernetes.github.io/ingress-nginx/) [cncf silver]:** Nginx ingress is an open-source ingress controller for Kubernetes that provides traffic routing, load balancing, and SSL termination for HTTP and TCP traffic. It provides a rich set of features for managing ingress traffic, including path-based routing, host-based routing, and SSL termination, making it suitable for a wide range of use cases. Nginx ingress supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Nginx ingress for specific requirements. Overall, Nginx ingress is a popular choice for managing ingress traffic in Kubernetes due to its flexibility, reliability, and ease of use.

**Coordination & Service Discovery:**
- :heavy_check_mark: | **[Etcd](https://etcd.io/) [cncf graduated]:** Etcd is a distributed key-value store that provides a reliable way to store and manage data across a cluster of machines. It provides a rich set of features for managing distributed systems, including data replication, consistency, and fault tolerance, making it suitable for a wide range of use cases. Etcd supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of tools and integrations, making it easy to extend and customize Etcd for specific requirements. Overall, Etcd is a popular choice for managing distributed systems due to its flexibility, reliability, and ease of use.
- :heavy_check_mark: | **[CoreDNS](https://coredns.io/) [cncf graduated]:** CoreDNS is a flexible, extensible DNS server that provides a reliable way to resolve domain names and manage DNS records. It provides a rich set of features for managing DNS traffic, including caching, forwarding, and load balancing, making it suitable for a wide range of use cases. CoreDNS supports high availability and scalability, making it suitable for large-scale deployments. It also provides a rich ecosystem of plugins and integrations, making it easy to extend and customize CoreDNS for specific requirements. Overall, CoreDNS is a popular choice for managing DNS traffic in Kubernetes due to its flexibility, reliability, and ease of use.

**Cloud Native Storage:**

**Cloud Native Network:**
- :heavy_check_mark: | Cilium [cncf graduated]

**Container Runtime:**
- :heavy_check_mark: | Containerd [cncf graduated]

**Security & Compliance:**
- :x: | Falco [cncf incubating]
- :heavy_check_mark: | Cert-manager [cncf graduated]

**Automation & Configuration:**
- :heavy_check_mark: | Ansible [cncf platinum]
- :heavy_check_mark: | Terraform [cncf silver]

**Monitoring:**
- :heavy_check_mark: | Prometheus [cncf graduated]
- :heavy_check_mark: | Grafana [cncf graduated]
- :x: | Weave Scope [cncf silver]
- :x: | Thanos [cncf incubating]
- :heavy_check_mark: | Hubble

**Tracing:**
- :heavy_check_mark: | Jaeger [cncf graduated]
- :x: | Grafana Tempo [cncf platinum]

**Chaos Engineering:**
- :x: | Chaos Mesh [cncf incubating]

**Logging:**
- :x: | Grafana Loki [cncf platinum]

**Feature Flags:**
- :x: | Flagsmith