#!/usr/bin/env bash
# Phase-21979: client soft_fertig_ssh_auth_tetracosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_tetracosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-tetracosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase21979 e2e passed"
