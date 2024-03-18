# Incident Response Plan
(SinLess Games LLC)

[last updated on 03-18-2024]

> [!NOTE] 
>This document outlines the incident response plan for SinLess Games LLC. It includes the incident severity levels, roles and responsibilities, the incident response process, and the on-call schedule for developers. 
>
> The incident response plan is designed to ensure that incidents are detected, resolved, and communicated effectively to minimize the impact on users and services.

> [!WARNING]
> This document is subject to change and should be reviewed and updated regularly to reflect the evolving needs of the organization.

## Incident Severity Levels:

### **Critical:** 
- Description: A critical incident results in a complete outage of the SaaS or a critical component of the cluster. This level of incident requires immediate action to restore services.
- Examples:
  - Complete loss of access to the SaaS platform.
  - Critical database failure resulting in data loss.
- Response:
  - Immediate notification of the on-call team.
  - Dedicated team focus until the incident is resolved.
  - Escalation to higher management if necessary.
- Communication:
  - Continuous updates to stakeholders until the incident is resolved.
  - Post-incident report detailing the root cause and resolution steps.

### **Major:** 
- Description: A major incident affects a significant portion of users or services but does not result in a complete outage. Urgent attention is required to restore services.
- Examples:
  - Performance degradation impacting a large number of users.
  - Partial loss of functionality in a critical service.
- Response:
  - Notification of the on-call team.
  - Immediate investigation and action to mitigate the impact.
  - Regular updates to stakeholders until the incident is resolved.
- Communication:
  - Updates to stakeholders every 30 minutes until the incident is resolved.
  - Post-incident report with details of the incident and actions taken.

### **Minor:**
- Description: A minor incident has a limited impact on users or services and can be resolved within a reasonable timeframe without significant impact.
- Examples:
  - Temporary loss of access to non-critical features.
  - Minor performance issues affecting a small number of users.
- Response:
  - Notification of the on-call team for awareness.
  - Resolution within a reasonable timeframe.
- Communication:
  - Updates to stakeholders as needed, depending on the impact.
  - Minimal documentation for future reference.

### **Informational:**
- Description: An informational incident includes events that do not require immediate action but should be monitored or investigated for potential impact.
- Examples:
  - Non-critical errors in logs.
  - Routine maintenance tasks.
- Response:
  - Monitoring and observation without immediate action.
- Communication:
  - No communication required unless the situation escalates.


## Roles and Responsibilities:

- **Team Leader:** The team leader is responsible for coordinating the incident response, communicating with stakeholders, and ensuring that the incident is resolved in a timely manner.
- **Developer:** Developers are responsible for investigating and resolving the incident, following the instructions provided by the team leader.

## Incident Response Process:

1. **Detection:** Incidents can be detected through monitoring tools, user reports, or automated alerts.
2. **Identification:** Once an incident is detected, the team leader verifies the incident, determines its severity level, and assigns it to a developer for resolution.
3. **Containment:** The developer works to contain the incident, minimizing its impact on users and services.
4. **Resolution:** The developer resolves the incident, restores services to normal operation, and verifies that the issue is fully resolved.
5. **Communication:** Throughout the incident response process, the team leader communicates with stakeholders, providing updates on the incident and its resolution.
6. **Post-Incident Review:** After the incident is resolved, the team conducts a post-incident review to identify the root cause of the incident, determine if any preventive measures can be implemented, and document lessons learned.

## On-call Schedule:

- Developers should be scheduled for 2 days on and 1 day off to ensure adequate rest and avoid burnout.
