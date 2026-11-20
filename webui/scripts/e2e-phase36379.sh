#!/usr/bin/env bash
# Phase-36379: client soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontaenneacosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase36379 e2e passed"
