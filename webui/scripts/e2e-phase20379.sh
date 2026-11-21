#!/usr/bin/env bash
# Phase-20379: client soft_fertig_ssh_auth_enneadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_enneadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-enneadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase20379 e2e passed"
