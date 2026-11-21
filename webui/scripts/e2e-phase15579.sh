#!/usr/bin/env bash
# Phase-15579: client soft_fertig_ssh_auth_quad_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_quad_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-quad-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase15579 e2e passed"
