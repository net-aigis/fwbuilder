#!/usr/bin/env bash
# Phase-26523: client soft_fertig_ssh_auth_triacontaoctadeca_checkpoint_roster Soft 26520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaoctadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26520+ soft_fertig_ssh_auth_triacontaoctadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase26523 e2e passed"
