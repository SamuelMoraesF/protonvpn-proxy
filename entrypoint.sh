#!/bin/sh
set -e

: "${WG_PRIVATE_KEY:?Variável WG_PRIVATE_KEY é obrigatória}"
: "${WG_PEER_PUBLIC_KEY:?Variável WG_PEER_PUBLIC_KEY é obrigatória}"
: "${WG_ENDPOINT:?Variável WG_ENDPOINT é obrigatória}"

cat > /etc/wireproxy.conf <<EOF
[Interface]
PrivateKey = ${WG_PRIVATE_KEY}
Address = 10.2.0.2/32
DNS = 10.2.0.1

[Peer]
PublicKey = ${WG_PEER_PUBLIC_KEY}
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = ${WG_ENDPOINT}
PersistentKeepalive = 25

[Socks5]
BindAddress = 0.0.0.0:1080
EOF

echo "Conectando em ${WG_ENDPOINT}..."

exec wireproxy -c /etc/wireproxy.conf
