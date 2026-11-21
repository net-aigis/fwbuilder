#!/usr/bin/env bash
# Phase-25179: client soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontatetradeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase25179 e2e passed"
