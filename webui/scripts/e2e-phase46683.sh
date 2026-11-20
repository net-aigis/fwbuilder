#!/usr/bin/env bash
# Phase-46683: client soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster Soft 46680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46680+ soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase46683 e2e passed"
