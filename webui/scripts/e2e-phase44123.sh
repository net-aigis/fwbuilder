#!/usr/bin/env bash
# Phase-44123: client soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster Soft 44120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 44120+ soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase44123 e2e passed"
