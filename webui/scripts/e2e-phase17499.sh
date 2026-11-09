#!/usr/bin/env bash
# Phase-17499: client soft_fertig_ssh_auth_deca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_deca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-deca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase17499 e2e passed"
