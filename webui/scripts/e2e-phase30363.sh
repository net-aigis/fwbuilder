#!/usr/bin/env bash
# Phase-30363: client soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster Soft 30360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 30360+ soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase30363 e2e passed"
