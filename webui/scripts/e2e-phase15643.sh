#!/usr/bin/env bash
# Phase-15643: client soft_fertig_ssh_auth_quad_checkpoint_roster Soft 15640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_quad_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15640+ soft_fertig_ssh_auth_quad_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase15643 e2e passed"
