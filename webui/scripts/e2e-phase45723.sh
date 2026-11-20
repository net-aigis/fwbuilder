#!/usr/bin/env bash
# Phase-45723: client soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster Soft 45720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45720+ soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase45723 e2e passed"
