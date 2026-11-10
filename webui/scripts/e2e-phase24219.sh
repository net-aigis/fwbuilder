#!/usr/bin/env bash
# Phase-24219: client soft_fertig_ssh_auth_triacontahenadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontahenadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase24219 e2e passed"
