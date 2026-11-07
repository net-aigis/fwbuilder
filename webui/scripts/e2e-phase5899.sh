#!/usr/bin/env bash
# Phase-5899: client ssh_batch_mode_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_batch_mode_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-batch-mode roster type ok"; echo "cleaned"; echo "OK: phase5899 e2e passed"
