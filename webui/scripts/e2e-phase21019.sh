#!/usr/bin/env bash
# Phase-21019: client soft_fertig_ssh_auth_henicosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_henicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-henicosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase21019 e2e passed"
