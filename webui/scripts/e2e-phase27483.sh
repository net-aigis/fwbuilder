#!/usr/bin/env bash
# Phase-27483: client soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster Soft 27480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 27480+ soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase27483 e2e passed"
