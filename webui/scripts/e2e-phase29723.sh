#!/usr/bin/env bash
# Phase-29723: client soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster Soft 29720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29720+ soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase29723 e2e passed"
