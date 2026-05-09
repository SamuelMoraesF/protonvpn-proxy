# protonvpn-proxy

A lightweight Docker image that runs a SOCKS5 proxy through ProtonVPN using [wireproxy](https://github.com/pufferffish/wireproxy). Fully userspace — no privileged containers or host network changes required.

## How it works

The container takes your ProtonVPN WireGuard credentials, generates a wireproxy config at startup, and exposes a SOCKS5 proxy on port `1080`.

## Usage

```bash
docker run -d \
  -p 1080:1080 \
  -e WG_PRIVATE_KEY="your-private-key" \
  -e WG_PEER_PUBLIC_KEY="peer-public-key" \
  -e WG_ENDPOINT="149.102.251.97:51820" \
  samuelmoraesf/protonvpn-proxy
```

Then configure your application to use `socks5://localhost:1080`.

### Getting WireGuard credentials

1. Go to [ProtonVPN WireGuard config](https://account.protonvpn.com/downloads#wireguard-configuration)
2. Generate a WireGuard configuration
3. Copy the `PrivateKey`, peer `PublicKey`, and `Endpoint` values

## Environment variables

| Variable | Required | Description |
|---|---|---|
| `WG_PRIVATE_KEY` | Yes | Your WireGuard private key |
| `WG_PEER_PUBLIC_KEY` | Yes | ProtonVPN peer public key |
| `WG_ENDPOINT` | Yes | ProtonVPN server endpoint (e.g. `149.102.251.97:51820`) |

## Multi-arch

Pre-built images are available for `linux/amd64` and `linux/arm64`.
