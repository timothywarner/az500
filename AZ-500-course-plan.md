# AZ-500 Crash Course: Key Discussion and Demo Topics

## Course Structure
- **Duration:** 5 hours (4 segments of ~1 hour each, 8 min break at the top of each hour)
- **Focus:** Concise discussion and demos of core AZ-500 topics
- **Style:** Interactive and practical 

---

## 🛡️ Segment 1: Manage Identity and Access (25–30%)
- **🔑 Microsoft Entra Management**  
  - Manage users and groups  
  - Implement multi-factor authentication (MFA)  
  - Configure passwordless authentication  
  - Implement Conditional Access policies  

- **🗝️ Role Management**  
  - Assign and manage Azure roles  
  - Configure Privileged Identity Management (PIM)  
  - Create custom roles  

- **🔐 Application Access**  
  - Manage app registrations and OAuth permissions  
  - Configure managed identities for Azure resources  

---

## 🌐 Segment 2: Secure Networking (20–25%)
- **🔒 Virtual Network Security**  
  - Configure Network Security Groups (NSGs) and Application Security Groups (ASGs)  
  - Plan and implement Virtual Network peering and VPN gateways  
  - Monitor security with Network Watcher  

- **🛡️ Private Access**  
  - Configure Private Endpoints and Private Link services  
  - Plan secure access to Azure App Services and Functions  

- **🚀 Public Access Security**  
  - Implement Azure Firewall and Web Application Firewall (WAF)  
  - Use Azure DDoS Protection Standard  

---

## 💾 Segment 3: Secure Compute, Storage, and Databases (20–25%)
- **🖥️ Compute Security**  
  - Plan secure remote access (Azure Bastion, JIT VM access)  
  - Configure AKS network isolation and monitoring  
  - Manage container security (ACI, ACR, ACA)  

- **🗄️ Storage Security**  
  - Configure access control for storage accounts  
  - Enable encryption (ADE, BYOK, double encryption)  
  - Protect data with soft delete, backups, and versioning  

- **📊 Database Security**  
  - Enable database auditing and data classification  
  - Configure Transparent Data Encryption (TDE)  
  - Implement Always Encrypted for Azure SQL  

---

## 🔍 Segment 4: Manage Security Operations (25–30%)
- **⚙️ Governance and Compliance**  
  - Create and assign security policies with Azure Policy  
  - Configure secure infrastructures with Blueprints  
  - Manage Key Vault access and key rotation  

- **🛠️ Microsoft Defender for Cloud**  
  - Assess risks using Secure Score  
  - Enable workload protection (Storage, SQL, Containers)  
  - Remediate vulnerabilities and monitor alerts  

- **📈 Monitoring and Automation**  
  - Configure Microsoft Sentinel analytics and data connectors  
  - Respond to incidents and automate workflows  
  - Evaluate vulnerability scans and alerts  

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
- Configure Azure AD authentication for the web app
- Set up managed identities for service-to-service communication
- Implement Conditional Access policy for admin access

#### 2. Network Security (30 mins)
- Create network isolation using VNets and NSGs
- Configure Private Endpoints for the database
- Set up Azure Application Gateway with WAF

#### 3. Data Protection (30 mins)
- Enable TDE and Always Encrypted for sensitive data
- Configure backup policies and soft delete
- Implement key rotation using Key Vault

#### 4. Monitoring & Response (30 mins)
- Set up Microsoft Defender for Cloud
- Configure diagnostic settings and log analytics
- Create custom alert rules in Microsoft Sentinel

### 🎯 Success Criteria
- ✅ All services use managed identities for authentication
- ✅ No direct public access to backend services
- ✅ All sensitive data encrypted at rest and in transit
- ✅ Comprehensive logging and monitoring in place

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
