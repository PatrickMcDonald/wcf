﻿$FriendlyName = "WCF Bridge - Machine certificate generated by the CertificateManager"

foreach($cert in  Get-ChildItem -Path cert:\LocalMachine\My -Recurse)
{
    if($cert.FriendlyName -eq $FriendlyName)
    {
        $thumbprint = $cert.Thumbprint
        netsh http delete sslcert ipport=0.0.0.0:8084
        netsh http delete sslcert ipport=0.0.0.0:44285
        netsh http delete sslcert ipport=0.0.0.0:443
        netsh http add sslcert ipport=0.0.0.0:8084 $thumbprint appid='{00000000-0000-0000-0000-000000000000}'
        netsh http add sslcert ipport=0.0.0.0:44285 $thumbprint appid='{00000000-0000-0000-0000-000000000000}'
        netsh http add sslcert ipport=0.0.0.0:443 $thumbprint appid='{00000000-0000-0000-0000-000000000000}'
    }
}