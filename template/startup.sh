#!/bin/bash
mkdir -p /var/lib/faasd/secrets/
echo ${basic_auth_user} > /var/lib/faasd/secrets/basic-auth-user
echo ${basic_auth_password} > /var/lib/faasd/secrets/basic-auth-password

export FAASD_DOMAIN=${domain}
export LETSENCRYPT_EMAIL=${email}

bash <(curl -sfL https://raw.githubusercontent.com/openfaas/faasd/master/hack/install.sh)

%{ if ufw_enabled }
apt-get install ufw

ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp

if [ ! -z "$${FAASD_DOMAIN}" ]; then
    ufw allow 80/tcp
    ufw allow 443/tcp
else
    ufw allow 8080/tcp
    ufw allow 9090/tcp
fi

ufw enable
%{ endif }


