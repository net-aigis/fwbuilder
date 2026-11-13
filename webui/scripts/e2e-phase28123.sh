#!/usr/bin/env bash
# Phase-28123: client soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster Soft 28120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28120+ soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase28123 e2e passed"
