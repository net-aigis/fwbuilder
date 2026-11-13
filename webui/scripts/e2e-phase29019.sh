#!/usr/bin/env bash
# Phase-29019: client soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontahexacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase29019 e2e passed"
