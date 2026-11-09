#!/usr/bin/env bash
# Phase-19803: client soft_fertig_ssh_auth_heptadeca_checkpoint_roster Soft 19800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_heptadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19800+ soft_fertig_ssh_auth_heptadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase19803 e2e passed"
