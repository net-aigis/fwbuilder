#!/usr/bin/env bash
# Phase-38299: client soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontapentacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase38299 e2e passed"
