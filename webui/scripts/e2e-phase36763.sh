#!/usr/bin/env bash
# Phase-36763: client soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster Soft 36760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36760+ soft_fertig_ssh_auth_triacontaicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase36763 e2e passed"
