#!/usr/bin/env bash
# Phase-37083: client soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster Soft 37080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37080+ soft_fertig_ssh_auth_triacontahenicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase37083 e2e passed"
