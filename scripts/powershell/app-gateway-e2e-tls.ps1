<# End-to-End TLS for Application Gateway

Ref: timw.info/ys2

Note: This is only a partial procedure

#>

# Configure the certificate for the application gateway. This certificate is used to decrypt and reencrypt the traffic on the application gateway.
$passwd = ConvertTo-SecureString  <certificate file password> -AsPlainText -Force
$cert = New-AzApplicationGatewaySSLCertificate -Name cert01 -CertificateFile <full path to .pfx file> -Password $passwd

# Create the HTTP listener for the application gateway. Assign the front-end IP configuration, port, and TLS/SSL certificate to use.
$listener = New-AzApplicationGatewayHttpListener -Name listener01 -Protocol Https -FrontendIPConfiguration $fipconfig -FrontendPort $fp -SSLCertificate $cert

# V1: Upload the certificate to be used on the TLS-enabled back-end pool resources. The certificate provided in the previous step should be the public key of the .pfx certificate present on the back end.
$authcert = New-AzApplicationGatewayAuthenticationCertificate -Name 'allowlistcert1' -CertificateFile C:\cert.cer

# V2: create a trusted root certificate instead of an authentication certificate
$trustedRootCert01 = New-AzApplicationGatewayTrustedRootCertificate -Name "test1" -CertificateFile  <path to root cert file>

# Configure the HTTP settings for the application gateway back end. Assign the certificate uploaded in the preceding step to the HTTP settings.
$poolSetting01 = New-AzApplicationGatewayBackendHttpSettings -Name “setting01” -Port 443 -Protocol Https -CookieBasedAffinity Disabled -TrustedRootCertificate $trustedRootCert01 -HostName "test1"