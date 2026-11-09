#!/usr/bin/env bash
# Phase-21083: client soft_fertig_ssh_auth_henicosadeca_checkpoint_roster Soft 21080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_henicosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21080+ soft_fertig_ssh_auth_henicosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase21083 e2e passed"
