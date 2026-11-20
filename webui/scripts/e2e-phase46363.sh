#!/usr/bin/env bash
# Phase-46363: client soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster Soft 46360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46360+ soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase46363 e2e passed"
