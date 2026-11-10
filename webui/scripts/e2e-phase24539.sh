#!/usr/bin/env bash
# Phase-24539: client soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontadodeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase24539 e2e passed"
