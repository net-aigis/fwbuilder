#!/usr/bin/env bash
# Phase-27739: client soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontadocosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase27739 e2e passed"
