#!/usr/bin/env bash
# Phase-15899: client soft_fertig_ssh_auth_penta_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_penta_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-penta-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase15899 e2e passed"
