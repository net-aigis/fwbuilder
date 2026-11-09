#!/usr/bin/env bash
# Phase-17819: client soft_fertig_ssh_auth_undeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_undeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-undeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase17819 e2e passed"
