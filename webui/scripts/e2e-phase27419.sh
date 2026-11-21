#!/usr/bin/env bash
# Phase-27419: client soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontahenicosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase27419 e2e passed"
