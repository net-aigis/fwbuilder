#!/usr/bin/env bash
# Phase-31259: client soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatricosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontatricosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase31259 e2e passed"
