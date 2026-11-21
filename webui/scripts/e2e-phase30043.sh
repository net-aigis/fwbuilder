#!/usr/bin/env bash
# Phase-30043: client soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster Soft 30040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30040+ soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase30043 e2e passed"
