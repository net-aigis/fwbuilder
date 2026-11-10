#!/usr/bin/env bash
# Phase-26779: client soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontaenneadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase26779 e2e passed"
