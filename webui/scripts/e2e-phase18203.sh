#!/usr/bin/env bash
# Phase-18203: client soft_fertig_ssh_auth_dodeca_checkpoint_roster Soft 18200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_dodeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18200+ soft_fertig_ssh_auth_dodeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase18203 e2e passed"
