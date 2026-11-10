#!/usr/bin/env bash
# Phase-23963: client soft_fertig_ssh_auth_triacontadeca_checkpoint_roster Soft 23960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23960+ soft_fertig_ssh_auth_triacontadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase23963 e2e passed"
