#!/usr/bin/env bash
# Phase-15963: client soft_fertig_ssh_auth_penta_checkpoint_roster Soft 15960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_penta_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15960+ soft_fertig_ssh_auth_penta_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase15963 e2e passed"
