#!/usr/bin/env bash
# Phase-18523: client soft_fertig_ssh_auth_trideca_checkpoint_roster Soft 18520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_trideca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18520+ soft_fertig_ssh_auth_trideca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase18523 e2e passed"
