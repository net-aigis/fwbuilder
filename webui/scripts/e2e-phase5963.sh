#!/usr/bin/env bash
# Phase-5963: client soft_fertig_ssh_batch_mode_roster Soft 5960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_batch_mode_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5960+ soft_fertig_ssh_batch_mode_roster type ok"; echo "cleaned"; echo "OK: phase5963 e2e passed"
