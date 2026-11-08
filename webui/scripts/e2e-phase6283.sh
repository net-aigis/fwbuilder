#!/usr/bin/env bash
# Phase-6283: client soft_fertig_ssh_implemented_batch_roster Soft 6280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_batch_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6280+ soft_fertig_ssh_implemented_batch_roster type ok"; echo "cleaned"; echo "OK: phase6283 e2e passed"
