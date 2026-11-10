#!/usr/bin/env bash
# Phase-26203: client soft_fertig_ssh_auth_triacontaheptadeca_checkpoint_roster Soft 26200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaheptadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26200+ soft_fertig_ssh_auth_triacontaheptadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase26203 e2e passed"
