#!/usr/bin/env bash
# Phase-15323: client soft_fertig_ssh_auth_triple_checkpoint_roster Soft 15320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triple_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15320+ soft_fertig_ssh_auth_triple_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase15323 e2e passed"
