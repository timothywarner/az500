# AZ-500 Crash Course: Key Discussion and Demo Topics

## Course Structure
- **Duration:** 5 hours (4 segments of ~1 hour each, 8 min break at the top of each hour)
- **Focus:** Concise discussion and demos of core AZ-500 topics
- **Style:** Interactive and practical 

---

## 🔐 Segment 1: Secure Identity and Access (15-20%)
- **🔑 Microsoft Entra Management**  
  - Manage security controls for identity and access
  - Implement multi-factor authentication (MFA)  
  - Configure Conditional Access policies  
  - Plan and manage resources in Privileged Identity Management

- **🗝️ Role Management**  
  - Manage Azure built-in role assignments
  - Create and manage custom roles
  - Implement Microsoft Entra Permissions Management

- **🔐 Application Access**  
  - Manage access to enterprise applications in Microsoft Entra ID  
  - Configure app registration permission scopes and consent
  - Manage and use service principals
  - Configure managed identities for Azure resources  

---

## 🌐 Segment 2: Secure Networking (20–25%)
- **🔒 Virtual Network Security**  
  - Configure Network Security Groups (NSGs) and Application Security Groups (ASGs)  
  - Manage networks with Azure Virtual Network Manager
  - Plan and implement user-defined routes (UDRs)
  - Configure VPN connectivity and peering
  - Implement Virtual WAN with secured virtual hub
  - Monitor security with Network Watcher  

- **🛡️ Private Access**  
  - Plan and implement virtual network Service Endpoints
  - Configure Private Endpoints and Private Link services  
  - Implement network integration for App Service and Functions
  - Configure network security for App Service Environment
  - Secure Azure SQL Managed Instance

- **🚀 Public Access Security**  
  - Implement TLS for applications
  - Configure Azure Firewall and Firewall Manager
  - Deploy Azure Application Gateway and Azure Front Door
  - Implement Web Application Firewall (WAF)  
  - Deploy Azure DDoS Protection Standard  

---

## 💾 Segment 3: Secure Compute, Storage, and Databases (20–25%)
- **🖥️ Compute Security**  
  - Configure remote access with Azure Bastion and just-in-time VM access
  - Secure Azure Kubernetes Service (AKS)
  - Configure security monitoring for containers (ACI, ACA)
  - Manage access to Azure Container Registry (ACR)
  - Implement disk encryption options
  - Secure Azure API Management

- **🗄️ Storage Security**  
  - Configure access control for storage accounts  
  - Manage storage account access keys
  - Configure secure access for Azure Files and Blob Storage
  - Protect data with soft delete, backups, versioning, and immutable storage
  - Configure Bring Your Own Key (BYOK)
  - Enable double encryption at the Azure Storage infrastructure level

- **📊 Database Security**  
  - Enable Microsoft Entra database authentication
  - Configure database auditing and dynamic masking
  - Implement Transparent Data Encryption (TDE)  
  - Configure Azure SQL Database Always Encrypted

---

## 🔍 Segment 4: Secure Azure using Microsoft Defender for Cloud and Microsoft Sentinel (30–35%)
- **⚙️ Cloud Governance Policies**  
  - Create and assign Azure Policy initiatives
  - Configure Key Vault network settings and access control
  - Manage certificates, secrets, and keys
  - Configure key rotation
  - Implement backup/recovery for sensitive data
  - Configure security controls for asset management

- **🛠️ Security Posture Management**  
  - Work with Microsoft Defender for Cloud Secure Score
  - Assess compliance against security frameworks
  - Manage compliance standards
  - Connect hybrid and multi-cloud environments
  - Implement Microsoft Defender External Attack Surface Management (EASM)

- **🔒 Threat Protection**  
  - Enable Microsoft Defender workload protection services
  - Configure Defender for Servers, Databases, and Storage
  - Implement agentless scanning for VMs
  - Configure Defender Vulnerability Management
  - Connect DevOps security for GitHub, Azure DevOps, and GitLab

- **📈 Security Monitoring and Automation**  
  - Manage security alerts in Defender for Cloud
  - Configure workflow automation
  - Set up data collection rules (DCRs) in Azure Monitor
  - Configure Microsoft Sentinel data connectors and analytics
  - Implement Microsoft Sentinel automation

---

## Resources
- [🔗 Microsoft Learn AZ-500 Documentation](https://learn.microsoft.com/en-us/certifications/exams/az-500/)
- [🛠️ GitHub for Azure Security](https://github.com/topics/azure-security)
- [🎥 Azure Security Demos](https://azure.microsoft.com/en-us/resources/videos/)

### Good luck, and let's secure the cloud! 🚀

## 🎯 Demo Scenario: Securing a Multi-tier Application
Follow along with this scenario to practice key security concepts covered in the course.

### Scenario Overview
You're a security engineer at Contoso Ltd, tasked with securing a new three-tier application:
- Web frontend (Azure App Service)
- API layer (Azure Functions) 
- Database (Azure SQL)

### 🔄 Implementation Steps

#### 1. Identity & Access Setup (30 mins)
- Configure Microsoft Entra authentication for the web app
- Set up managed identities for service-to-service communication
- Implement Conditional Access policy for admin access
- Configure Privileged Identity Management for just-in-time admin access

#### 2. Network Security (30 mins)
- Create network isolation using VNets, NSGs, and ASGs
- Implement Private Endpoints for the database
- Set up Azure Application Gateway with WAF
- Configure Azure Front Door with CDN

#### 3. Data Protection (30 mins)
- Enable TDE and Always Encrypted for sensitive data
- Configure Key Vault with RBAC and network restrictions
- Implement immutable storage and soft delete
- Configure double encryption for storage

#### 4. Security Monitoring & Protection (30 mins)
- Set up Microsoft Defender for Cloud workload protections
- Configure Microsoft Sentinel data connectors and analytics rules
- Create automation workflows for common security incidents
- Implement vulnerability scanning and management

### 🎯 Success Criteria
- ✅ All services use managed identities for authentication
- ✅ Private network connectivity between services
- ✅ All sensitive data encrypted at rest and in transit
- ✅ Comprehensive detection and response capabilities

## Additional Resources

### 🔨 Practice Labs
- [Azure Security Labs on Microsoft Learn](https://learn.microsoft.com/en-us/certifications/exams/az-500)
- [Whizlabs AZ-500 Hands-on Labs](https://www.whizlabs.com/blog/top-azure-hands-on-labs/)
- [Azure GOAT - Vulnerable Azure Environment for Practice](https://github.com/Akriti-S/AzGOAT)
- [425Show Secure Azure Function Samples](https://github.com/425show/SecureAzureFunctionMiW)

### 📚 Documentation
- [Azure Security Best Practices](https://learn.microsoft.com/en-us/azure/security/fundamentals/best-practices-and-patterns)
- [Microsoft Security Documentation](https://learn.microsoft.com/en-us/security/)
- [Azure Architecture Center - Security](https://learn.microsoft.com/en-us/azure/architecture/framework/security/overview)

### 🎥 Video Resources
- [Microsoft Security YouTube Channel](https://www.youtube.com/c/MicrosoftSecurity)
- [Azure Security Center in Action](https://www.youtube.com/playlist?list=PLLasX02E8BPBxGouWlJV-u_XVcXfkdscl)
