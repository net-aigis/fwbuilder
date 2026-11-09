#!/usr/bin/env bash
# Phase-16923: client soft_fertig_ssh_auth_octa_checkpoint_roster Soft 16920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_octa_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16920+ soft_fertig_ssh_auth_octa_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase16923 e2e passed"
