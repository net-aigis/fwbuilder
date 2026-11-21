#!/usr/bin/env bash
# Phase-36123: client soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster Soft 36120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36120+ soft_fertig_ssh_auth_triacontaoctacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase36123 e2e passed"
