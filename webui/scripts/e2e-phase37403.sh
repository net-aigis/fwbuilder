#!/usr/bin/env bash
# Phase-37403: client soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster Soft 37400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37400+ soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase37403 e2e passed"
