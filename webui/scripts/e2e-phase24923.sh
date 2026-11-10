#!/usr/bin/env bash
# Phase-24923: client soft_fertig_ssh_auth_triacontatriadeca_checkpoint_roster Soft 24920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatriadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24920+ soft_fertig_ssh_auth_triacontatriadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase24923 e2e passed"
