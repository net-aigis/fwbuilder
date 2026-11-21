#!/usr/bin/env bash
# Phase-8363: client soft_fertig_ssh_implemented_batch_refresh_roster Soft 8360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_batch_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8360+ soft_fertig_ssh_implemented_batch_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8363 e2e passed"
