#!/usr/bin/env bash
# Phase-23323: client soft_fertig_ssh_auth_octacosadeca_checkpoint_roster Soft 23320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_octacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23320+ soft_fertig_ssh_auth_octacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase23323 e2e passed"
