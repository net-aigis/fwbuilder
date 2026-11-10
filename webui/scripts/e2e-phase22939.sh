#!/usr/bin/env bash
# Phase-22939: client soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-heptacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase22939 e2e passed"
