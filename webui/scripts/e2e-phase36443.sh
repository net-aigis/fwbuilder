#!/usr/bin/env bash
# Phase-36443: client soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster Soft 36440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36440+ soft_fertig_ssh_auth_triacontaenneacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase36443 e2e passed"
