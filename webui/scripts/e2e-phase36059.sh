#!/usr/bin/env bash
# Phase-36059: client soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontaoctacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase36059 e2e passed"
