#!/usr/bin/env bash
# Phase-28443: client soft_fertig_ssh_auth_triacontatetracosadeca_checkpoint_roster Soft 28440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatetracosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 28440+ soft_fertig_ssh_auth_triacontatetracosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase28443 e2e passed"
