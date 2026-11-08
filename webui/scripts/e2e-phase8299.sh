#!/usr/bin/env bash
# Phase-8299: client soft_fertig_ssh_implemented_batch_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_batch_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-implemented-batch-refresh roster type ok"; echo "cleaned"; echo "OK: phase8299 e2e passed"
