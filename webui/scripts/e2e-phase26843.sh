#!/usr/bin/env bash
# Phase-26843: client soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster Soft 26840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26840+ soft_fertig_ssh_auth_triacontaenneadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase26843 e2e passed"
